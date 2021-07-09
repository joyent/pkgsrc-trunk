<<<<<<< HEAD
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
=======
$NetBSD: patch-cmake_boost.cmake,v 1.1 2021/05/13 15:25:20 jdolecek Exp $

Allow newer boost.

--- cmake/boost.cmake.orig	2021-03-22 08:44:50.000000000 +0000
+++ cmake/boost.cmake
@@ -300,13 +300,6 @@ IF(NOT BOOST_MAJOR_VERSION EQUAL 10)
   COULD_NOT_FIND_BOOST()
 ENDIF()
 
-IF(NOT BOOST_MINOR_VERSION EQUAL 73)
-  MESSAGE(WARNING "Boost minor version found is ${BOOST_MINOR_VERSION} "
-    "we need 73"
>>>>>>> netbsd/trunk
-    )
-  COULD_NOT_FIND_BOOST()
-ENDIF()
-
 MESSAGE(STATUS "BOOST_INCLUDE_DIR ${BOOST_INCLUDE_DIR}")
 
 # We have a limited set of patches/bugfixes here:
