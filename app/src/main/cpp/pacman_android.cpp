// Placeholder entry point. The game is not ported yet: this only logs and returns,
// so the APK can be built and installed while the platform layer is in progress.
#include <android/log.h>
#include <android/native_activity.h>

#define LOG_TAG "PacManCE"

extern "C" __attribute__((visibility("default")))
void ANativeActivity_onCreate(ANativeActivity* activity, void* saved_state, size_t saved_state_size) {
    (void)activity;
    (void)saved_state;
    (void)saved_state_size;
    __android_log_print(ANDROID_LOG_WARN, LOG_TAG,
                        "Pac-Man CE: Android port not ready yet (placeholder build).");
}
