$NetBSD$

Support pkgsrc boost.

--- cmake/boost.cmake.orig	2019-04-13 11:46:31.000000000 +0000
+++ cmake/boost.cmake
@@ -280,17 +280,6 @@ STRING(REGEX REPLACE
 
 MESSAGE(STATUS "BOOST_VERSION_NUMBER is ${BOOST_VERSION_NUMBER}")
 
-IF(NOT BOOST_MAJOR_VERSION EQUAL 10)
-  COULD_NOT_FIND_BOOST()
-ENDIF()
-
-IF(NOT BOOST_MINOR_VERSION EQUAL 69)
-  MESSAGE(WARNING "Boost minor version found is ${BOOST_MINOR_VERSION} "
-    "we need 69"
-    )
-  COULD_NOT_FIND_BOOST()
-ENDIF()
-
 MESSAGE(STATUS "BOOST_INCLUDE_DIR ${BOOST_INCLUDE_DIR}")
 
 # We have a limited set of patches/bugfixes here:
