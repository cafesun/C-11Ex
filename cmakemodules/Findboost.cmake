# Variables used by this module, they can change the default behaviour and
# need to be set before calling find_package:

#   Boost_USE_MULTITHREADED  [in]    Can be set to OFF to use the non-multithreaded
#                                boost libraries.  If not specified, defaults
#                                to ON.

#   Boost_USE_STATIC_LIBS    [in]    Can be set to ON to force the use of the static
#                                boost libraries. Defaults to OFF.

#   Boost_USE_STLPORT      [in]      If enabled, searches for boost libraries
#                                compiled against the STLPort standard
#                                library ('p' ABI tag). Defaults to OFF.

#   Boost_DEBUG           [in]       Set this to TRUE to enable debugging output
#                                of FindBoost.cmake if you are having problems.
#                                Please enable this before filing any bug
#                                reports.

#   Boost_COMPILER       [in]        Set this to the compiler suffix used by Boost
#                                (e.g. "-gcc43") if FindBoost has problems finding
#                                the proper Boost installation

#   Boost_FOUND         [out]         Boost found

#   Boost_LIBRARIES        [out]      Link to these to use the Boost libraries that you
#                                specified: not cached

#	Boost_lib_xxx 	[out]	Link to this to use a single library.

# ------------------------------------------------------------------------------------

IF (NOT Boost_USE_MULTITHREADED)
	SET (Boost_USE_MULTITHREADED ON)
ENDIF (NOT Boost_USE_MULTITHREADED)

IF (NOT Boost_USE_STATIC_LIBS)
	SET (Boost_USE_STATIC_LIBS OFF)
ENDIF (NOT Boost_USE_STATIC_LIBS)

IF (NOT Boost_USE_STLPORT)
	SET (Boost_USE_STLPORT OFF)
ENDIF (NOT Boost_USE_STLPORT)

IF (CMAKE_BUILD_TYPE MATCHES Deb)
	SET (Boost_DEBUG ON)
ENDIF ()

IF (NOT Boost_COMPILER)
	SET (Boost_COMPILER vc90)
ENDIF (NOT Boost_COMPILER)

IF (NOT Boost_Version)
	SET (Boost_Version 1_47)
ENDIF (NOT Boost_Version)

SET (Boost_FOUND YES)

FOREACH (COMPONENT ${boost_FIND_COMPONENTS})

	IF (Boost_USE_STATIC_LIBS)
		SET (${COMPONENT}_LIB_NAME libboost_${COMPONENT})
	ELSE (Boost_USE_STATIC_LIBS)
		SET (${COMPONENT}_LIB_NAME boost_${COMPONENT})
	ENDIF (Boost_USE_STATIC_LIBS)
	
	IF (WIN32)
		IF (Boost_COMPILER)
   		SET (${COMPONENT}_LIB_NAME ${${COMPONENT}_LIB_NAME}-${Boost_COMPILER})
   	ENDIF (Boost_COMPILER)
   	
   	IF (Boost_USE_MULTITHREADED)
   		SET (${COMPONENT}_LIB_NAME ${${COMPONENT}_LIB_NAME}-mt)
   	ENDIF (Boost_USE_MULTITHREADED)
   	
   	IF (Boost_DEBUG)
   		SET (${COMPONENT}_LIB_NAME ${${COMPONENT}_LIB_NAME}-gd)
   	ELSE (Boost_DEBUG)
   		SET (${COMPONENT}_LIB_NAME ${${COMPONENT}_LIB_NAME}-)
   	ENDIF (Boost_DEBUG)
   	
   	IF (Boost_USE_STLPORT)
   		SET (${COMPONENT}_LIB_NAME ${${COMPONENT}_LIB_NAME}p)
   	ENDIF (Boost_USE_STLPORT)	
   	
   	IF (Boost_USE_VERSION)
		SET (${COMPONENT}_LIB_NAME ${${COMPONENT}_LIB_NAME}-${Boost_Version})
	ENDIF (Boost_USE_VERSION)	
  ENDIF (WIN32)
  
  FIND_LIBRARY (${COMPONENT}_LIB_FOUND NAMES ${${COMPONENT}_LIB_NAME} PATHS $ENV{PATH} ${ADDITIONAL_LIB_PATH})
  
  IF (${COMPONENT}_LIB_FOUND)
  		IF (WIN32)
			SET (Boost_lib_${COMPONENT} ${${COMPONENT}_LIB_NAME}.lib)
 		ELSE()
			SET (Boost_lib_${COMPONENT} ${${COMPONENT}_LIB_FOUND})
		ENDIF()
		SET (Boost_LIBRARIES ${Boost_LIBRARIES} ${Boost_lib_${COMPONENT}})
	ELSE (${COMPONENT}_LIB_FOUND)
		SET (Boost_FOUND NO)
		MESSAGE (STATUS "Could not find boost libraries:" ${${COMPONENT}_LIB_NAME})
	ENDIF (${COMPONENT}_LIB_FOUND)
	
ENDFOREACH (COMPONENT)
