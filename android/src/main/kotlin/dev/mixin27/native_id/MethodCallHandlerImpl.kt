package dev.mixin27.native_id

import android.annotation.SuppressLint
import android.content.Context
import android.content.SharedPreferences
import android.content.pm.PackageManager
import android.provider.Settings
import android.view.WindowManager
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import java.util.*

class MethodCallHandlerImpl(
    private val context: Context,
): MethodCallHandler {
    private val PREF_UNIQUE_ID = "PREF_UNIQUE_ID_99599"

    @SuppressLint("HardwareIds")
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method.equals("getId")) {
            val androidId = Settings.Secure.getString(context.contentResolver, Settings.Secure.ANDROID_ID)
            result.success(androidId)
        } else if (call.method.equals("getUUID")) {
            result.success(getUUID(context))
        } else {
            result.notImplemented()
        }
    }

    private fun getUUID(context: Context): String {
        val sharedPreferences = context.getSharedPreferences(PREF_UNIQUE_ID, Context.MODE_PRIVATE)
        var uniqueID: String? = sharedPreferences.getString(PREF_UNIQUE_ID, null)
        if (uniqueID == null) {
            uniqueID = UUID.randomUUID().toString()
            val editor: SharedPreferences.Editor = sharedPreferences.edit()
            editor.putString(PREF_UNIQUE_ID, uniqueID)
            editor.apply()
        }

        return uniqueID;
    }

}