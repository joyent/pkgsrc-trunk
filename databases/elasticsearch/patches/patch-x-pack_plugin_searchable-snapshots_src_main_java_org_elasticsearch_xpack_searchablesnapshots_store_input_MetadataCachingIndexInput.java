$NetBSD$

--- x-pack/plugin/searchable-snapshots/src/main/java/org/elasticsearch/xpack/searchablesnapshots/store/input/MetadataCachingIndexInput.java.orig	2021-06-10 18:41:11.000000000 +0000
+++ x-pack/plugin/searchable-snapshots/src/main/java/org/elasticsearch/xpack/searchablesnapshots/store/input/MetadataCachingIndexInput.java
@@ -51,7 +51,7 @@ public abstract class MetadataCachingInd
     protected final CacheFileReference cacheFileReference;
 
     /**
-     * If > 0, represents a logical file within a compound (CFS) file or is a slice thereof represents the offset of the logical
+     * If &gt; 0, represents a logical file within a compound (CFS) file or is a slice thereof represents the offset of the logical
      * compound file within the physical CFS file
      */
     protected final long compoundFileOffset;
