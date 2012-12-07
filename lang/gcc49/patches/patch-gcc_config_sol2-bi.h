$NetBSD$

Pull in ${PREFIX}/lib by default and handle for multiarch.

--- gcc/config/sol2-bi.h.orig	2014-01-02 22:23:26.000000000 +0000
+++ gcc/config/sol2-bi.h
@@ -74,8 +74,9 @@
   "%{G:-G} \
    %{YP,*} \
    %{R*} \
-   %{!YP,*:%{p|pg:-Y P,%R/usr/lib/libp/" ARCH64_SUBDIR ":%R/lib/" ARCH64_SUBDIR ":%R/usr/lib/" ARCH64_SUBDIR "}	\
-	   %{!p:%{!pg:-Y P,%R/lib/" ARCH64_SUBDIR ":%R/usr/lib/" ARCH64_SUBDIR "}}}"
+   -R@PREFIX@/lib/" @MARCH64_SUBDIR@ " \
+   %{!YP,*:%{p|pg:-Y P,%R/usr/lib/libp/" ARCH64_SUBDIR ":%R/lib/" ARCH64_SUBDIR ":%R/usr/lib/" ARCH64_SUBDIR ":%R@PREFIX@/lib/" @MARCH64_SUBDIR@ "} \
+	   %{!p:%{!pg:-Y P,%R/lib/" ARCH64_SUBDIR ":%R/usr/lib/" ARCH64_SUBDIR ":%R@PREFIX@/lib/" @MARCH64_SUBDIR@ "}}}"
 
 #undef LINK_ARCH64_SPEC
 #ifndef USE_GLD
