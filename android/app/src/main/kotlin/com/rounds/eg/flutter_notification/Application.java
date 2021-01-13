package com.rounds.eg.flutter_notification;

import io.flutter.app.FlutterApplication;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService;
import io.flutter.view.FlutterMain;

public class Application extends FlutterApplication implements PluginRegistrantCallback {
    @Override
    public void onCreate() {
        super.onCreate();
        FlutterFirebaseMessagingService.setPluginRegistrant(this);

    }

    @Override
    public void registerWith(PluginRegistry registry) {
//         GeneratedPluginRegistrant.registerWith(new FlutterEngine(this));
        FirebaseCloudMessagingPluginRegistrant.registerWith(registry);



    }
}