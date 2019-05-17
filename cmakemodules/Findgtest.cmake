# find utility library
#   GTEST_LIB     [out]         Link to these to use the utility library

IF (WIN32)
	SET (GTEST_LIB_NAME gtestd)
ELSE (WIN32)
	SET (GTEST_LIB_NAME gtest)
ENDIF (WIN32)

FIND_LIBRARY (GTEST_LIB NAMES ${GTEST_LIB_NAME} PATHS $ENV{PATH} ${ADDITIONAL_LIB_PATH})

IF (GTEST_LIB)
	SET (GTEST_FOUND)
ENDIF (GTEST_LIB)
