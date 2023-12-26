import 'package:clean_architecture/Core/UseCase/use_cases.dart';
import 'package:clean_architecture/Core/error/fialures.dart';
import 'package:clean_architecture/features/random_qoute/domain/entities/qoute.dart';
import 'package:clean_architecture/features/random_qoute/domain/repositories/qoute_reposatory.dart';
import 'package:dartz/dartz.dart';

class GetRandomeQuote implements UseCase<Qoute, NoParam> {
  final QouteRepository qouteRepository;

  GetRandomeQuote({required this.qouteRepository});
  @override
  Future<Either<Failure, Qoute>> call(NoParam param) {
    return qouteRepository.getRandomeQoute();
  }
}
