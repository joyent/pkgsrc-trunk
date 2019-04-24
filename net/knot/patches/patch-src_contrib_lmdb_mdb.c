$NetBSD$

* Use posix_madvise(3) instead of madvise(3) for Solaris/SunOS.
  Solaris/SunOS's madvise(3) is not enabled in this context,
  and its first argument type is different from NetBSD/Linux's one.

--- src/contrib/lmdb/mdb.c.orig	2019-01-23 09:57:41.000000000 +0000
+++ src/contrib/lmdb/mdb.c
@@ -3994,13 +3994,13 @@ mdb_env_map(MDB_env *env, void *addr)
 
 	if (flags & MDB_NORDAHEAD) {
 		/* Turn off readahead. It's harmful when the DB is larger than RAM. */
-#ifdef MADV_RANDOM
+#if defined(MADV_RANDOM) && !defined(__sun)
 		madvise(env->me_map, env->me_mapsize, MADV_RANDOM);
 #else
 #ifdef POSIX_MADV_RANDOM
 		posix_madvise(env->me_map, env->me_mapsize, POSIX_MADV_RANDOM);
 #endif /* POSIX_MADV_RANDOM */
-#endif /* MADV_RANDOM */
+#endif /* MADV_RANDOM && !__sun */
 	}
 #endif /* _WIN32 */
 
