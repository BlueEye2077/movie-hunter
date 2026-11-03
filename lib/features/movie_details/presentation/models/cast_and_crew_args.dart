import '../../domain/entities/movie_credits_entity.dart';

/// Arguments passed to the Cast and Crew screen via navigation.
class CastAndCrewArgs {
  final MovieCreditsEntity credits;

  const CastAndCrewArgs({required this.credits});
}

