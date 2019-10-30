package eu.curiousit.flutter_page_curl

import android.content.Intent
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  private val CHANNEL = "curiousit.eu/page_curl"

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
      if (call.method == "openNewPage") {
        val intent = Intent(this, SecondActivity::class.java)
        startActivity(intent)
        result.success(true)
      } else {
        result.notImplemented()
      }
    }

  }
}
