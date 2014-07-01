LOACL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_PRELINK_MODULE := false
LOCAL_SRC_FILES := bnp_jni_test.c
LOCAL_C_INCLUDES += external/libbmp/src
		    $(JNI_H_INCLUDE)
LOCAL_SHARED_LIBRARIES := libbmp-lib \
			  libutils \
			  libCutils
LOCAL_MODULE := native-bmp
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
include $(BUILD_EXECUTABLE)
