import 'cast_member.dart';
import 'crew_member.dart';

/// Arguments passed to the Cast and Crew screen via navigation.
class CastAndCrewArgs {
  final List<CastMember> cast;
  final List<CrewMember> crew;

  const CastAndCrewArgs({required this.cast, required this.crew});
}
