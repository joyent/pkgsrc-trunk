$NetBSD$

Pull in ${PREFIX}/lib by default.

--- gcc/config/sol2.h.orig	2014-05-28 11:37:50.000000000 +0000
+++ gcc/config/sol2.h
@@ -154,8 +154,9 @@ along with GCC; see the file COPYING3.  
   "%{G:-G} \
    %{YP,*} \
    %{R*} \
-   %{!YP,*:%{p|pg:-Y P,%R/usr/ccs/lib/libp:%R/usr/lib/libp:%R/usr/ccs/lib:%R/lib:%R/usr/lib} \
-	   %{!p:%{!pg:-Y P,%R/usr/ccs/lib:%R/lib:%R/usr/lib}}}"
+   -R@PREFIX@/lib \
+   %{!YP,*:%{p|pg:-Y P,%R/usr/ccs/lib/libp:%R/usr/lib/libp:%R/usr/ccs/lib:%R/lib:%R/usr/lib:%R@PREFIX@/lib} \
+	   %{!p:%{!pg:-Y P,%R/usr/ccs/lib:%R/lib:%R/usr/lib:%R@PREFIX@/lib}}}"
 
 #undef LINK_ARCH32_SPEC
 #define LINK_ARCH32_SPEC LINK_ARCH32_SPEC_BASE
