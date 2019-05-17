cmake_minimum_required(VERSION 2.8)

project(C++11Ex)

foreach(this_dir
		ex01
		ex02
		)
	add_subdirectory(${this_dir})
endforeach(this_dir)
