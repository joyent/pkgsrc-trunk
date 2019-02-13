$NetBSD$

* Use posix_madvise(3) instead of madvise(3) for Solaris/SunOS.
  Solaris/SunOS's madvise(3) is not enabled in this context,
  and its first argument type is different from NetBSD/Linux's one.

--- src/libzscanner/scanner.rl.orig	2019-01-23 09:57:41.000000000 +0000
+++ src/libzscanner/scanner.rl
@@ -326,7 +326,13 @@ int zs_set_input_file(
 		s->input.mmaped = true;
 
 		// Try to set the mapped memory advise to sequential.
+#if defined(MADV_SEQUENTIAL) && !defined(__sun)
 		(void)madvise(start, size, MADV_SEQUENTIAL);
+#else
+#ifdef POSIX_MADV_SEQUENTIAL
+		(void)posix_madvise(start, size, POSIX_MADV_SEQUENTIAL);
+#endif /* POSIX_MADV_SEQUENTIAL */
+#endif /* MADV_SEQUENTIAL && !__sun */
 	}
 
 	// Set the scanner input limits.
