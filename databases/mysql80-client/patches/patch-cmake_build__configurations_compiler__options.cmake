$NetBSD$

--- cmake/build_configurations/compiler_options.cmake.orig	2019-04-13 11:46:31.000000000 +0000
+++ cmake/build_configurations/compiler_options.cmake
@@ -88,7 +88,7 @@ IF(UNIX)
   # Solaris flags
   IF(CMAKE_SYSTEM_NAME MATCHES "SunOS")
     # Link mysqld with mtmalloc on Solaris 10 and later
-    SET(WITH_MYSQLD_LDFLAGS "-lmtmalloc" CACHE STRING "")
+    #SET(WITH_MYSQLD_LDFLAGS "-lmtmalloc" CACHE STRING "")
 
     IF(CMAKE_C_COMPILER_ID MATCHES "SunPro")
       SET(SUNPRO_FLAGS     "")
