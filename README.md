# verbose-goggles
Generate Fortran project templates

The `create_project.sh` script takes a project name (and optionally a project directory name) as inputs, creates the project folder, the build and docs folders within it, and saves template files for CMake and Doxygen. It also saves a dummy F90 file in the main project folder which just prints 'Hello world!'. The script also checks if you have cmake, doxygen, and gdb (coz why not) installed, and prints a warning if they're not installed (I tried adding a way to automatically install them, but I don't know how to make it distro-agnostic).

The install script simply aliases the `create_project.sh` script as the command `create_f90_project` in the `.bashrc` file. It also (optionally) adds a command alias `compile_f90` which, assuming that your `CMakeLists.txt` file is updated, goes to the build directory, compiles the program, copies the executable into the main directory and runs it. If you don't wish to have this alias, simply press 'n' when the prompt asks whether to install it.
