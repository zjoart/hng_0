import 'package:dart_frog/dart_frog.dart';

import '../repo/fact.dart';

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(factRepo());
}

Middleware factRepo() {
  return provider<FactRepository>((context) => FactRepository());
}
