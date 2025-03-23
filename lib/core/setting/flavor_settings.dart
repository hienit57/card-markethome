class FlavorSettings {
  final String apiBaseUrl;
  final String environment;

  FlavorSettings.development()
      : environment = 'development',
        apiBaseUrl = 'https://dev.vdone.info';

  FlavorSettings.staging()
      : environment = 'staging',
        apiBaseUrl = 'https://dev.vdone.info';

  FlavorSettings.production()
      : environment = 'production',
        apiBaseUrl = 'https://rickandmortyapi.com/api/';
}
