$NetBSD$

Backport upstream change to avoid decimal_string conflict on SunOS.

--- gcc/read-md.c.orig	2014-01-02 22:23:26.000000000 +0000
+++ gcc/read-md.c
@@ -780,7 +780,7 @@ traverse_md_constants (htab_trav callbac
 /* Return a malloc()ed decimal string that represents number NUMBER.  */
 
 static char *
-decimal_string (int number)
+md_decimal_string (int number)
 {
   /* A safe overestimate.  +1 for sign, +1 for null terminator.  */
   char buffer[sizeof (int) * CHAR_BIT + 1 + 1];
@@ -852,7 +852,7 @@ handle_enum (int lineno, bool md_p)
 	  ev->name = value_name;
 	}
       ev->def = add_constant (md_constants, value_name,
-			      decimal_string (def->num_values), def);
+			      md_decimal_string (def->num_values), def);
 
       *def->tail_ptr = ev;
       def->tail_ptr = &ev->next;
