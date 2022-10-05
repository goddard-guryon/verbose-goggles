#!/usr/bin/bash

# get details about project
echo "Project Name: "
read name
if [[ $name == '' ]]; then
    echo "Invalid filename"
    exit 1
fi
pr_dir="$name/"
echo "Project directory ($pr_dir): "
read pr_new_dir
if [[ $pr_new_dir != '' ]]; then
    if [[ $pr_new_dir != */ ]]; then
        pr_new_dir=$pr_new_dir'/'
    fi
    pr_dir=$pr_new_dir
fi

# create directories
if ! command -v cmake &>/dev/null; then
    echo "Failed to find cmake, make sure to install it before compiling the files"
fi
if ! command -v doxygen &>/dev/null; then
    echo "Failed to find doxygen, make sure to install to generate code documentation"
fi
if ! command -v gdb &>/dev/null; then
    echo "Failed to find gdb, make sure to install it for code debugging"
fi
if [[ -d $pr_dir ]]; then
    echo "Project directory already exists, exiting"
    exit 1
fi
echo "Initializing project"
mkdir $pr_dir
mkdir $pr_dir"build/"
mkdir $pr_dir"docs/"
cp CMakeLists.txt $pr_dir
cp Doxyfile.in $pr_dir"docs/"
cp mainpage.dox $pr_dir
cp main.f90 $pr_dir$name".f90"

# Add project name in appropriate places
sed -i -e "s/template_filename/$name/g" $pr_dir"CMakeLists.txt"
sed -i -e "s/project_name/$name/g" $pr_dir"docs/Doxyfile.in"
echo "Done"
