$NetBSD$

* Use posix_madvise(3) instead of madvise(3) for Solaris/SunOS.
  Solaris/SunOS's madvise(3) is not enabled in this context,
  and its first argument type is different from NetBSD/Linux's one.

--- src/libknot/yparser/yparser.c.orig	2019-01-23 09:57:41.000000000 +0000
+++ src/libknot/yparser/yparser.c
@@ -124,7 +124,13 @@ int yp_set_input_file(
 		}
 
 		// Try to set the mapped memory advise to sequential.
+#if defined(MADV_SEQUENTIAL) && !defined(__sun)
 		(void)madvise(start, file_stat.st_size, MADV_SEQUENTIAL);
+#else  
+#ifdef POSIX_MADV_SEQUENTIAL
+		(void)posix_madvise(start, file_stat.st_size, POSIX_MADV_SEQUENTIAL);
+#endif /* POSIX_MADV_SEQUENTIAL */
+#endif /* MADV_SEQUENTIAL && !__sun */
 
 		parser->input.eof = false;
 	} else {
