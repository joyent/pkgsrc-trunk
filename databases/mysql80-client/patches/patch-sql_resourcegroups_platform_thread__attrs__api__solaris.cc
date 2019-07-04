$NetBSD$

Fix build on illumos.

--- sql/resourcegroups/platform/thread_attrs_api_solaris.cc.orig	2019-01-25 22:33:03.000000000 +0000
+++ sql/resourcegroups/platform/thread_attrs_api_solaris.cc
@@ -60,6 +60,7 @@ bool bind_to_cpu(cpu_id_t cpu_id, my_thr
 }
 
 bool bind_to_cpus(const std::vector<cpu_id_t> &cpu_ids) {
+#if 0
   if (cpu_ids.empty()) return false;
 
   procset_t ps;
@@ -76,10 +77,13 @@ bool bind_to_cpus(const std::vector<cpu_
     return true;
   }
   return false;
+#endif
+  return true;
 }
 
 bool bind_to_cpus(const std::vector<cpu_id_t> &cpu_ids,
                   my_thread_os_id_t thread_id) {
+#if 0
   procset_t ps;
   uint_t nids = cpu_ids.size();
   id_t *ids = reinterpret_cast<id_t *>(const_cast<unsigned *>(cpu_ids.data()));
@@ -96,9 +100,12 @@ bool bind_to_cpus(const std::vector<cpu_
     return true;
   }
   return false;
+#endif
+  return true;
 }
 
 bool unbind_thread() {
+#if 0
   procset_t ps;
   uint32_t flags = PA_CLEAR;
 
@@ -112,9 +119,12 @@ bool unbind_thread() {
     return true;
   }
   return false;
+#endif
+  return true;
 }
 
 bool unbind_thread(my_thread_os_id_t thread_id) {
+#if 0
   procset_t ps;
   uint32_t flags = PA_CLEAR;
 
@@ -128,6 +138,8 @@ bool unbind_thread(my_thread_os_id_t thr
     return true;
   }
   return false;
+#endif
+  return true;
 }
 
 int thread_priority() { return getpriority(PRIO_PROCESS, my_thread_os_id()); }
