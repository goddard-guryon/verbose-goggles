cmake_minimum_required(VERSION 3.0)

project(testing_cmake LANGUAGES Fortran)

option(BUILD_DOC "Build documentation" ON)

set(CMAKE_Fortran_MODULE_DIRECTORY
    ${CMAKE_BINARY_DIR}/modules)
file(MAKE_DIRECTORY ${CMAKE_Fortran_MODULE_DIRECTORY})

add_compile_options(-Wall -Wextra)

find_package(Doxygen)
if (DOXYGEN_FOUND)
    set(DOXYGEN_INPUT_DIR ${PROJECT_SOURCE_DIR})
    set(DOXYGEN_IN ${CMAKE_CURRENT_SOURCE_DIR}/docs/Doxyfile.in)
    set(DOXYGEN_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

    configure_file(${DOXYGEN_IN} ${DOXYGEN_OUT} @ONLY)
    message("Doxygen build started")

    add_custom_target( doc_doxygen ALL
        COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT "Generating API documentation with Doxygen"
        VERBATIM )
else (DOXYGEN_FOUND)
    message("Failed to find Doxygen, skipping documentation build")
endif (DOXYGEN_FOUND)

add_executable(template_filename template_filename.f90)
