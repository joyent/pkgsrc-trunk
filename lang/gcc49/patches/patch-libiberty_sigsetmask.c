$NetBSD$

Fixes for building on SunOS in C99 mode.

--- libiberty/sigsetmask.c.orig	2005-05-24 20:48:25.000000000 +0000
+++ libiberty/sigsetmask.c
@@ -15,7 +15,6 @@ be the value @code{1}).
 
 */
 
-#define _POSIX_SOURCE
 #include <ansidecl.h>
 /* Including <sys/types.h> seems to be needed by ISC. */
 #include <sys/types.h>
