# Common build/runtime failures

- **Qt5 not found**: ensure Qt5 Core/Widgets/OpenGL/Network dev packages are installed.
- **ODE mismatch**: prefer double precision ODE builds.
- **Protobuf not found**: install protobuf compiler and development libraries.
- **OpenGL headers missing**: install mesa OpenGL dev packages (Linux) or platform OpenGL SDK.
- **VarTypes missing**: install globally or allow CMake external project download path.

When multiple failures appear, fix in this order: toolchain -> Qt/OpenGL -> ODE -> protobuf -> project code.
