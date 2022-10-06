# verbose-goggles
Generate Fortran project templates

Create simple template directory for a Fortran project through a single command.

 - The `create_project.sh` script asks for a project name and a project directory name, creates the directory with a dummy `main.f90` file that 
 simply prints "Hello world!" upon compilation, and also places template files and scripts for `cmake` and `doxygen`.
 
 - The `install.sh` script creates an alias to the `create_project.sh` script as the command `create_f90_project` (assuming that you do not move 
 the script from its original location), and adds an additional alias command, `compile_f90` which compiles the Fortran scripts, generates 
 `doxygen` documentation for the project, and runs the compiled script in a single go.
 - The doxygen documentation is generated with a custom theme (taken from https://github.com/jothepro/doxygen-awesome-css) with a light/dark 
 mode toggle. The generated documentation is saved in the `build\doc_doxygen` directory in both HTML and Latex forms.
