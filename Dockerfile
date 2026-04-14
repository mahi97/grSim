FROM ubuntu:24.04 AS build
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    cmake \
    pkg-config \
    qt6-base-dev \
    libqt6opengl6-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libprotobuf-dev \
    protobuf-compiler \
    libode-dev \
    libboost-dev

WORKDIR /vartypes
RUN git clone https://github.com/jpfeltracco/vartypes.git . && \
    git checkout 2d16e81b7995f25c5ba5e4bc31bf9a514ee4bc42 && \
    sed -i 's/find_package(Qt5 COMPONENTS Core Widgets Gui REQUIRED)/find_package(Qt6 COMPONENTS Core Widgets Gui REQUIRED)/' CMakeLists.txt && \
    sed -i 's/qt5_add_resources/qt_add_resources/' CMakeLists.txt && \
    sed -i 's/Qt5::Core/Qt6::Core/g' CMakeLists.txt && \
    sed -i 's/Qt5::Widgets/Qt6::Widgets/g' CMakeLists.txt && \
    sed -i 's/Qt5::Gui/Qt6::Gui/g' CMakeLists.txt && \
    sed -i 's/-std=c++11/-std=c++17/g' CMakeLists.txt && \
    sed -i 's/l->setMargin(1);/l->setContentsMargins(1, 1, 1, 1);/' vartypes/gui/VarTreeView.cpp && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DVARTYPES_BUILD_STATIC=ON -DCMAKE_INSTALL_DOCDIR=share/doc .. && \
    make && \
    make install

WORKDIR /grsim
COPY clients /grsim/clients
COPY cmake /grsim/cmake
COPY config /grsim/config
COPY include /grsim/include
COPY resources /grsim/resources
COPY src /grsim/src
COPY CMakeLists.txt README.md LICENSE.md /grsim/
RUN mkdir build && \
    cd build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. && \
    make && \
    make install


FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive \
    LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib

RUN apt-get update && apt-get install -y \
        tini \
        qt6-base-dev \
        libqt6opengl6 \
        libode8t64 \
        libprotobuf32t64 \
        # virtual display and VNC server
        x11vnc xvfb && \
        apt-get clean -y
COPY --from=build /usr/local /usr/local

RUN useradd -ms /bin/bash default
COPY /docker-entry.sh .
RUN chmod 775 /docker-entry.sh

EXPOSE 20011 30011 30012 10300 10301 10302 5900
USER default
WORKDIR /home/default
ENTRYPOINT ["tini", "--", "/docker-entry.sh"]
