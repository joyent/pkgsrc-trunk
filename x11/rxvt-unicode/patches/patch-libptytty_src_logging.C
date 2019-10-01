$NetBSD$

--- libptytty/src/logging.C.orig	2014-11-16 12:22:34.000000000 +0000
+++ libptytty/src/logging.C
@@ -189,7 +189,7 @@ update_lastlog (const char *pty, const c
   updlastlogx (LASTLOGX_FILE, getuid (), &llx);
 # endif
 
-# ifdef HAVE_STRUCT_LASTLOG
+# ifdef HAVE_LASTLOG
   memset (&ll, 0, sizeof (ll));
   ll.ll_time = time (NULL);
   strncpy (ll.ll_line, pty, sizeof (ll.ll_line));
