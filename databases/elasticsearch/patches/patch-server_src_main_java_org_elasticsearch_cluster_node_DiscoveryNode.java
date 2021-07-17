$NetBSD$

--- server/src/main/java/org/elasticsearch/cluster/node/DiscoveryNode.java.orig	2021-06-10 18:41:11.000000000 +0000
+++ server/src/main/java/org/elasticsearch/cluster/node/DiscoveryNode.java
@@ -441,7 +441,7 @@ public class DiscoveryNode implements Wr
 
     /**
      * Returns whether or not the node is a frozen only node, i.e., has data frozen role and no other data roles.
-     * @return
+     * @return true if the node is a frozen only node, false otherwise
      */
     public boolean isDedicatedFrozenNode() {
         return isDedicatedFrozenRoles(getRoles());
