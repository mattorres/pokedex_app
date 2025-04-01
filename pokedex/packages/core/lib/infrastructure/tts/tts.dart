import 'package:flutter/services.dart';

import '../../domain/domain.dart';

class TtsServiceChannel implements ITtsService {
  static const _channel = MethodChannel('pokemon_tts');

  @override
  Future<void> speak(String text) async {
    try {
      await _channel.invokeMethod('speak', {'name': text});
    } catch (e) {
      print('Erro ao executar TTS: $e');
    }
  }
}
