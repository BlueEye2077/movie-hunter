import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hunter/core/networking/api_result.dart';

import '../../../../core/networking/requests_state.dart';
import '../../data/models/person_details_response.dart';
import '../../data/repository/person_repository.dart';

class PersonDetailsCubit extends Cubit<RequestsState<PersonDetailsResponse>> {
  final PersonRepository personRepository;

  PersonDetailsCubit({required this.personRepository})
      : super(const RequestsState.idle());

  void getPersonDetails(int personId) async {
    emit(const RequestsState.loading());
    final result = await personRepository.getPersonDetails(personId);
    result.when(
      success: (data) => emit(RequestsState.success(data)),
      failure: (error) => emit(RequestsState.error(error)),
    );
  }
}
