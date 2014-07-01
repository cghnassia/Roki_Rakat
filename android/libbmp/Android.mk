LOCAL_PATH := $(call my_dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := src/bmpfile.c

LOCAL_C_INCLUDES := external/libbmp/src 

LOCAL_MODULE := libbmp-lib
LOCAL_MODULES_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
include $(CLEAR_VARS)
LOCAL_SRC_FILES := src/bmpfile.c

LOCAL_C_INCLUDES := external/libbmp/src 

LOCAL_MODULE := libbmp-lib-static
LOCAL_MODULE_TAGS = optional

include $(BUILD_STATIC_LIBRARY)
