$NetBSD$

Add endian.h definition for SmartOS too.

--- src/libknot/endian.h.orig	2019-01-23 09:57:41.000000000 +0000
+++ src/libknot/endian.h
@@ -29,7 +29,7 @@
 #       include <endian.h>
 #elif defined(__FreeBSD__) || defined(__NetBSD__)
 #       include <sys/endian.h>
-#elif defined(__OpenBSD__)
+#elif defined(__OpenBSD__) || defined(__sun)
 #       include <endian.h>
 #elif defined(__APPLE__)
 #       include <libkern/OSByteOrder.h>
