import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  // obfuscate: true broke the token into small chunks
  @EnviedField(varName: 'TMDB_API_KEY', obfuscate: true)
  static final String tmdbApiKey = _Env.tmdbApiKey;
}