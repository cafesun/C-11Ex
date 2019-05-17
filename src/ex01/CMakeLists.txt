cmake_minimum_required(VERSION 2.8)

project(ex01)

foreach(this_dir
		src
		#test
		)
	add_subdirectory(${this_dir})
endforeach(this_dir)