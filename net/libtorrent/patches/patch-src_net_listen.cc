stricter error checking for select() interface

https://github.com/rakshasa/libtorrent/pull/40

--- src/net/listen.cc
+++ src/net/listen.cc
@@ -125,7 +125,14 @@ Listen::event_write() {

 void
 Listen::event_error() {
-  throw internal_error("Listener port received an error event.");
+  int socket = get_fd().get_fd();
+  int error = 0;
+  socklen_t errorLen = sizeof(error);
+
+  if (getsockopt(socket, SOL_SOCKET, SO_ERROR, &error, &errorLen) != -1 && error != 0) {
+    std::string errorMsg = std::string("Listener port received an error event: ") + strerror(error);
+    throw internal_error(errorMsg.c_str());
+  }
 }

 }
