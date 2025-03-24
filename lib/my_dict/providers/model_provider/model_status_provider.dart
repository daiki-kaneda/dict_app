
enum ModelStatus {
  geminiFlash,
  geminiPro;

  String get modelName {
    switch (this) {
      case geminiFlash:
        return 'gemini-2.0-flash-lite';
      case geminiPro:
        return 'gemini-1.5-pro';
    }
  }
}
