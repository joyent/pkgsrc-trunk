$NetBSD$
Docker broke building their client on solaris
--- ../../docker/docker/client/client_unix.go.orig	2019-01-16 23:06:36.532171754 +0000
+++ ../../docker/docker/client/client_unix.go
@@ -1,4 +1,4 @@
-// +build linux freebsd openbsd darwin
+// +build linux freebsd openbsd darwin solaris
 
 package client // import "github.com/docker/docker/client"
 
