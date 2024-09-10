package com.danieldallos.go_home

import android.app.Activity
import android.content.Context
import android.content.Intent
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** GoHomePlugin */
class GoHomePlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var context: Context? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "go_home")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "sendAppToHome") {
      sendHomeIntent()
      result.success(true)
    } else {
      result.notImplemented()
    }
  }

  private fun sendHomeIntent() {
    val i = Intent(Intent.ACTION_MAIN)
    // NOTE: we can omit this flag, if we capture the activity context instead of the application context
    // affect of this has to be seen.
    i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    i.addCategory(Intent.CATEGORY_HOME)
    context?.startActivity(i)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    context = null
    channel.setMethodCallHandler(null)
  }
}
