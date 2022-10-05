#!/usr/bin/bash

echo -e "Installation script to create new Fortran project template directories."
echo -e "This script installs a command alias to quickly create template files for"
echo -e "a Fortran project. Build files for CMake and Doxygen are added, along with"
echo -e "a minimal main f90 file to begin working on the project.\n"
echo -e "Make sure to not remove the file 'create_project.sh' from this directory."
echo -e "Note: an extra alias can be added to quickly compile Fortran scripts through"
echo -e "CMake. You can choose to add this alias in your bashrc file below:"
echo "Add quick CMake compilation command alias (Y/n): "
read consent
if [[ $consent == '' ]]; then
    consent='y'
fi

# we don't wanna keep adding aliases
if command -v create_f90_project &>/dev/null; then
    echo "Aliases have already been installed."
else
    echo -e "\n# Command aliases added via $(pwd)/install.sh script" >> ~/.bashrc
    echo -e "alias create_f90_project=\"$(pwd)/create_project.sh\"" >> ~/.bashrc

    # a handy alias I use for quick compilation
    if [[ $consent == 'y' ]]; then
        echo "alias compile_f90=\"cd build && cmake -DBUILD_WITH_DOCS=ON .. && make && find . -maxdepth 1 -type f -executable | xargs cp -t ../ && cd .. && find . -maxdepth 1 -type f -executable -exec {}\;\"" >> ~/.bashrc
    fi
    bash
fi
echo "Done"
echo "For more information, check https://github.com/goddard-guryon/verbose-goggles\n"
