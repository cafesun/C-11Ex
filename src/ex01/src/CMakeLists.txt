cmake_minimum_required(VERSION 2.8)

project(c++11ex01)
add_definitions("-DWIN32_LEAN_AND_MEAN")
include_directories("${PROJECT_SOURCE_DIR}/."
	${GTEST_INCLUDE}
	)

file(GLOB PROJECT_SOURCES "${PROJECT_SOURCE_DIR}/*.cpp"
						"${PROJECT_SOURCE_DIR}/*.h"
)
link_directories(${EXT_LIBS_PATH})
add_executable("${PROJECT_NAME}" ${PROJECT_SOURCES})

set_target_properties("${PROJECT_NAME}" PROPERTIES COMPILE_DEFINITIONS "_CRT_SECURE_NO_WARNINGS")
target_link_libraries("${PROJECT_NAME}" ${GTEST_LIB})
#add_dependencies
