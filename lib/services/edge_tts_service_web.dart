/// Web stub for Edge TTS (native synthesis/playback uses dart:io + platform channels).
class EdgeTtsService {
  EdgeTtsService._();
  static final EdgeTtsService instance = EdgeTtsService._();

  bool _isSpeaking = false;
  bool get isSpeaking => _isSpeaking;

  Future<bool> speak(String text, {String? voice}) async {
    _isSpeaking = false;
    return false;
  }

  Future<void> stop() async {
    _isSpeaking = false;
  }
}
