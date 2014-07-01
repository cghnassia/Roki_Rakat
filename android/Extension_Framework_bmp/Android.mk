LOCAL_PATH := $(call my-dir)
include $(CALL_VARS)
LOCAL_SRC_FILES := \
$(call all-java-files-under, Java)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := com.android.utbm.lo52.test
include $(BUILD_JAVA_LIBRARY)

include $(CALL_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := com.android.utbm.lo52.test.Test.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)


