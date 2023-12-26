part of 'random_qoute_cubit.dart';

abstract class RandomQouteState extends Equatable {
  const RandomQouteState();

  @override
  List<Object> get props => [];
}

class RandomQouteInitial extends RandomQouteState {}

class RandomQouteIsLoading extends RandomQouteState {}

class RandomQouteIsLoaded extends RandomQouteState {
  final Qoute qoute;

  const RandomQouteIsLoaded({required this.qoute});
  @override
  List<Object> get props => [qoute];
}

class RandomQouteError extends RandomQouteState {
  final String message;

  const RandomQouteError({required this.message});
  @override
  List<Object> get props => [message];
}
