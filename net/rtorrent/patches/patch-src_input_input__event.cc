--- src/input/input_event.cc
+++ src/input/input_event.cc
@@ -39,7 +39,19 @@
 #include "input_event.h"

 //ncurses.h must be included last since sys/mman.h on Solaris munges ERR.
+#if defined(HAVE_NCURSESW_CURSES_H)
+#include <ncursesw/curses.h>
+#elif defined(HAVE_NCURSESW_H)
+#include <ncursesw.h>
+#elif defined(HAVE_NCURSES_CURSES_H)
+#include <ncurses/curses.h>
+#elif defined(HAVE_NCURSES_H)
 #include <ncurses.h>
+#elif defined(HAVE_CURSES_H)
+#include <curses.h>
+#else
+#error "SysV or X/Open-compatible Curses header file required"
+#endif

 namespace input {

