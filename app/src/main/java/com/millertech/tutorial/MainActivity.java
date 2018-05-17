package com.millertech.tutorial;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

import com.johnholdsworth.swiftbindings.SwiftMathBinding;

public class MainActivity extends AppCompatActivity implements SwiftMathBinding.Responder {

    public static final String TAG = "MainActivity";

    @SuppressWarnings("JniMissingFunction")
    private native SwiftMathBinding.Listener bind(SwiftMathBinding.Responder self);

    private static void loadNativeDependencies() {
        System.loadLibrary("swiftandroid");
    }

    private SwiftMathBinding.Listener listener;

    @Override protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        loadNativeDependencies();
        listener = bind(this);

        listener.processSum(200, 200);
    }

    @Override public void processedSum(int result) {

        Log.v(TAG, "El resultado es "+result);

    }
}
