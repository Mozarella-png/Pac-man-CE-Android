package com.m4candcheese.pacmanced;

import android.app.NativeActivity;

/**
 * Native activity: the game runs in libpacman.so (src/main/cpp).
 * SDL-based activity glue is still to be decided during the platform port.
 */
public class MainActivity extends NativeActivity {
    static {
        System.loadLibrary("pacman");
    }
}
