cmake_minimum_required(VERSION 2.8)

project(C++11Ex)

set(EXT_LIBS_INCLUDE_PATH "")
set(EXT_LIBS_PATH "")

set(SysArchitecture "")
MATH(EXPR SysArchitecture "${CMAKE_SIZEOF_VOID_P} * 8")
message("Current Architecture is ${SysArchitecture} Bits")
if (SysArchitecture STREQUAL "64")
	set(EXT_LIBS_PATH "${PROJECT_SOURCE_DIR}/../ext/lib/win32_vc15_x64")
else ()
	set(EXT_LIBS_PATH "${PROJECT_SOURCE_DIR}/../ext/lib/win32_vc15_x86")
endif()
set(EXT_LIBS_INCLUDE_PATH "${PROJECT_SOURCE_DIR}/../ext/include")

#gtest include path
set(GTEST_INCLUDE "${EXT_LIBS_INCLUDE_PATH}/google/gtest/1.8.1")

#gmock include path
set(GMOCK_INCLUDE "${EXT_LIBS_INCLUDE_PATH}/google/gmock/1.8.1")

#set boost include path
set(BOOST_INCLUDE "${EXT_LIBS_INCLUDE_PATH}/boost/1.64")

#ext lib
set(GTEST_LIB "gtestd.lib")
set(GMOCK_LIB "gmockd.lib")


foreach(this_dir
		src
		)
	add_subdirectory(${this_dir})
endforeach(this_dir)
