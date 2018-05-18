package com.millertech.tutorial;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import com.johnholdsworth.swiftbindings.SwiftMathBinding.Listener;
import com.johnholdsworth.swiftbindings.SwiftMathBinding.Responder;

public class MainActivity extends AppCompatActivity implements Responder {

    public static final String TAG = "MainActivity";

    @SuppressWarnings("JniMissingFunction")
    native Listener bind(Responder self);

    private static void loadNativeDependencies() {
        System.loadLibrary("swiftandroid");
    }

    Listener listener;

    @Override protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        loadNativeDependencies();
        listener = bind(this);

        listener.processSum(200, 200);
    }

    @Override
    public void processedSum(int result) {

        Log.v(TAG, "El resultado es "+result);

    }
}
