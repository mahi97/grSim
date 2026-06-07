# Patch vartypes CMakeLists.txt to use Qt6 instead of Qt5
file(READ "${FILE}" content)
string(REPLACE "find_package(Qt5 COMPONENTS Core Widgets Gui REQUIRED)" "find_package(Qt6 COMPONENTS Core Widgets Gui REQUIRED)" content "${content}")
string(REPLACE "qt5_add_resources" "qt_add_resources" content "${content}")
string(REPLACE "Qt5::Core" "Qt6::Core" content "${content}")
string(REPLACE "Qt5::Widgets" "Qt6::Widgets" content "${content}")
string(REPLACE "Qt5::Gui" "Qt6::Gui" content "${content}")
# Qt6 requires C++17 minimum
string(REPLACE "-std=c++11" "-std=c++17" content "${content}")
file(WRITE "${FILE}" "${content}")

# Patch VarTreeView.cpp: QLayout::setMargin() was removed in Qt6, use setContentsMargins()
get_filename_component(SOURCE_DIR "${FILE}" DIRECTORY)
set(VARTREEVIEW_FILE "${SOURCE_DIR}/vartypes/gui/VarTreeView.cpp")
if(EXISTS "${VARTREEVIEW_FILE}")
  file(READ "${VARTREEVIEW_FILE}" vtv_content)
  string(REPLACE "l->setMargin(1);" "l->setContentsMargins(1, 1, 1, 1);" vtv_content "${vtv_content}")
  file(WRITE "${VARTREEVIEW_FILE}" "${vtv_content}")
endif()
