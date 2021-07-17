$NetBSD$

--- server/src/main/java/org/elasticsearch/cluster/metadata/SingleNodeShutdownMetadata.java.orig	2021-06-10 18:41:11.000000000 +0000
+++ server/src/main/java/org/elasticsearch/cluster/metadata/SingleNodeShutdownMetadata.java
@@ -341,7 +341,7 @@ public class SingleNodeShutdownMetadata
 
         /**
          * @param pluginsStatus An object describing the status of plugin shutdown on this node.
-         * @return
+         * @return This builder.
          */
         public Builder setPluginsStatus(NodeShutdownComponentStatus pluginsStatus) {
             this.pluginsStatus = pluginsStatus;
