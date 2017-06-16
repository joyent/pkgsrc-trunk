--- src/display/window_download_list.cc
+++ src/display/window_download_list.cc
@@ -90,7 +90,7 @@ WindowDownloadList::redraw() {
   Range range = rak::advance_bidirectional(m_view->begin_visible(),
                                            m_view->focus() != m_view->end_visible() ? m_view->focus() : m_view->begin_visible(),
                                            m_view->end_visible(),
-                                           m_canvas->height() / 3);
+                                           (m_canvas->height() - 1) / 3);
 
   // Make sure we properly fill out the last lines so it looks like
   // there are more torrents, yet don't hide it if we got the last one
@@ -104,6 +104,9 @@ WindowDownloadList::redraw() {
     char buffer[m_canvas->width() + 1];
     char* last = buffer + m_canvas->width() - 2 + 1;
 
+    if (pos + 3 > m_canvas->height())
+      break;
+
     print_download_title(buffer, last, *range.first);
     m_canvas->print(0, pos++, "%c %s", range.first == m_view->focus() ? '*' : ' ', buffer);
     
