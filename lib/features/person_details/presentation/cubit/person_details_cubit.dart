import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entities/person_details_entity.dart';
import '../../domain/usecases/get_person_details_usecase.dart';

part 'person_details_cubit.freezed.dart';
part 'person_details_state.dart';

class PersonDetailsCubit extends Cubit<PersonDetailsState> {
  final GetPersonDetailsUseCase _getPersonDetailsUseCase;

  PersonDetailsCubit({required GetPersonDetailsUseCase getPersonDetailsUseCase})
    : _getPersonDetailsUseCase = getPersonDetailsUseCase,
      super(const PersonDetailsState.idle());

  Future<void> getPersonDetails(int personId) async {
    emit(const PersonDetailsState.loading());
    final result = await _getPersonDetailsUseCase(personId);
    if (isClosed) return;
    result.when(
      success: (person) => emit(PersonDetailsState.success(person)),
      failure: (error) => emit(PersonDetailsState.error(error)),
    );
  }
}
