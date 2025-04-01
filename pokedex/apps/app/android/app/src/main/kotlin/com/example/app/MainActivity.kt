package com.example.app
import android.os.Bundle
import android.speech.tts.TextToSpeech
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.*

class MainActivity : FlutterActivity(), TextToSpeech.OnInitListener {

    private lateinit var tts: TextToSpeech
    private var isTtsReady = false
    private val CHANNEL = "pokemon_tts"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Inicializa TTS
        tts = TextToSpeech(this, this)

        // Configura o canal
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "speak" -> {
                    val name = call.argument<String>("name") ?: "Pokémon"
                    if (isTtsReady) {
                        speak(name)
                        result.success(null)
                    } else {
                        result.error("TTS_NOT_READY", "TTS ainda não inicializado", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    override fun onInit(status: Int) {
        isTtsReady = status == TextToSpeech.SUCCESS
        if (isTtsReady) {
            tts.language = Locale.US // Ou Locale("pt", "BR") se quiser em português
        }
    }

    private fun speak(text: String) {
        tts.speak(text, TextToSpeech.QUEUE_FLUSH, null, null)
    }

    override fun onDestroy() {
        super.onDestroy()
        tts.stop()
        tts.shutdown()
    }
}