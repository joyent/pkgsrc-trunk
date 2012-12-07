$NetBSD$

Fixes for building on SunOS in C99 mode.

--- gcc/gengtype.c.orig	2014-01-02 22:23:26.000000000 +0000
+++ gcc/gengtype.c
@@ -4951,7 +4951,7 @@ variable_size_p (const type_p s)
 }
 
 enum alloc_quantity
-{ single, vector };
+{ gsingle, vector };
 
 /* Writes one typed allocator definition into output F for type
    identifier TYPE_NAME with optional type specifier TYPE_SPECIFIER.
@@ -5035,8 +5035,8 @@ write_typed_alloc_defns (outf_p f,
       if (nb_plugin_files > 0 
 	  && ((s->u.s.line.file == NULL) || !s->u.s.line.file->inpisplugin))
 	continue;
-      write_typed_struct_alloc_def (f, s, "", single);
-      write_typed_struct_alloc_def (f, s, "cleared_", single);
+      write_typed_struct_alloc_def (f, s, "", gsingle);
+      write_typed_struct_alloc_def (f, s, "cleared_", gsingle);
       write_typed_struct_alloc_def (f, s, "vec_", vector);
       write_typed_struct_alloc_def (f, s, "cleared_vec_", vector);
     }
@@ -5055,8 +5055,8 @@ write_typed_alloc_defns (outf_p f,
 	  if (!filoc || !filoc->file->inpisplugin)
 	    continue;
 	};
-      write_typed_typedef_alloc_def (f, p, "", single);
-      write_typed_typedef_alloc_def (f, p, "cleared_", single);
+      write_typed_typedef_alloc_def (f, p, "", gsingle);
+      write_typed_typedef_alloc_def (f, p, "cleared_", gsingle);
       write_typed_typedef_alloc_def (f, p, "vec_", vector);
       write_typed_typedef_alloc_def (f, p, "cleared_vec_", vector);
     }
