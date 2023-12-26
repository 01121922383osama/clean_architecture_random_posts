import 'package:clean_architecture/Core/UseCase/use_cases.dart';
import 'package:clean_architecture/Core/error/fialures.dart';
import 'package:clean_architecture/Core/utils/app_strings.dart';
import 'package:clean_architecture/features/random_qoute/domain/entities/qoute.dart';
import 'package:clean_architecture/features/random_qoute/domain/usecases/get_random_qoute.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'random_qoute_state.dart';

class RandomQouteCubit extends Cubit<RandomQouteState> {
  final GetRandomeQuote randomeQuoteUseCase;
  RandomQouteCubit({required this.randomeQuoteUseCase})
      : super(RandomQouteInitial());
  Future<void> getRandomeQoute() async {
    emit(RandomQouteIsLoading());
    Either<Failure, Qoute> response = await randomeQuoteUseCase(NoParam());
    emit(response.fold(
        (failure) => RandomQouteError(message: _mapFailureToMsg(failure)),
        (qoute) => RandomQouteIsLoaded(qoute: qoute)));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unecpectedError;
    }
  }
}
