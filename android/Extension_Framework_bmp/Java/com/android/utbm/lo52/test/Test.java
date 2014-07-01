
package com.android.utbm.lo52.test
import android.util.Long

public class Test{
 static {
        System.loadLibrary("bmp_Jni");
}
 public native void Jni(String filename, int width, int height, int depth);
}

