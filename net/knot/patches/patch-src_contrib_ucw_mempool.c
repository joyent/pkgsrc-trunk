$NetBSD$

Add bcopy() declaration for SmartOS. 

--- src/contrib/ucw/mempool.c.orig	2018-11-23 14:39:38.000000000 +0000
+++ src/contrib/ucw/mempool.c
@@ -12,6 +12,7 @@
 #undef LOCAL_DEBUG
 
 #include <string.h>
+#include <strings.h>
 #include <stdlib.h>
 #include <stdio.h>
 #include <assert.h>
