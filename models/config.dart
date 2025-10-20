/// [AppConfig] hold app config
class AppConfig {
  factory AppConfig._load() {
    return AppConfig._(
      email: 'oluwadahunsiayomide02@gmail.com',
      name: 'Ayomide Oluwadahunsi',
      stack: 'Dart/Dart Frog',
      catFactApi: 'https://catfact.ninja/fact',
    );
  }
  AppConfig._({
    required this.email,
    required this.name,
    required this.stack,
    required this.catFactApi,
  });
  final String email;
  final String name;
  final String stack;
  final String catFactApi;

  static final AppConfig instance = AppConfig._load();
}
