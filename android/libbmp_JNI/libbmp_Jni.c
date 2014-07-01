/*Jni de la libbmp */

#include "jni.h"
#include "bmpfile.h"

JNIEXPORT void JNICALL Java_com_android_utbm_lo52_test_Test_Jni(JNIEnv* env, jobject this, jstring filename, jint width, jint height, jint depth){

bmpfile_t *bmp;
  int i, j;
  rgb_pixel_t pixel = {128, 64, 0, 0};

  if ((bmp = bmp_create((int) width, (int) height, (int) depth)) == NULL) {
    printf("Invalid depth value: %s.\n", (int) depth);
    return 1;
  }

  for (i = 10, j = 10; j < (int) height; ++i, ++j) {
    bmp_set_pixel(bmp, i, j, pixel);
    pixel.red++;
    pixel.green++;
    pixel.blue++;
    bmp_set_pixel(bmp, i + 1, j, pixel);
    bmp_set_pixel(bmp, i, j + 1, pixel);
  }

  const char *filename_char = (*env)->GetStringUTFChars(env, filename, 0);
  bmp_save(bmp, filename_char);
  bmp_destroy(bmp);
  (*env)->ReleaseStringUTFChars(env, filename, filename_char);

}
