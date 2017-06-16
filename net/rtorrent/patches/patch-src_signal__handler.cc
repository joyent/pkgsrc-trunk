--- src/signal_handler.cc
+++ src/signal_handler.cc
@@ -38,6 +38,7 @@
 
 #include <signal.h>
 #include <stdexcept>
+#include <string>
 #include "rak/error_number.h"
 #include "signal_handler.h"

@@ -74,8 +74,15 @@ SignalHandler::set_handler(unsigned int signum, slot_void slot) {
   if (!slot)
     throw std::logic_error("SignalHandler::set_handler(...) received an empty slot.");

-  signal(signum, &SignalHandler::caught);
-  m_handlers[signum] = slot;
+  struct sigaction sa;
+  sigemptyset(&sa.sa_mask);
+  sa.sa_flags = SA_RESTART;
+  sa.sa_handler = &SignalHandler::caught;
+
+  if (sigaction(signum, &sa, NULL) == -1)
+    throw std::logic_error("Could not set sigaction: " + std::string(rak::error_number::current().c_str()));
+  else
+    m_handlers[signum] = slot;
 }

 void
