import '../../../../Core/UseCase/use_cases.dart';
import '../../../../Core/error/fialures.dart';
import '../entities/qoute.dart';
import '../repositories/qoute_reposatory.dart';
import 'package:dartz/dartz.dart';

class GetRandomeQuote implements UseCase<Qoute, NoParam> {
  final QouteRepository qouteRepository;

  GetRandomeQuote({required this.qouteRepository});
  @override
  Future<Either<Failure, Qoute>> call(NoParam param) {
    return qouteRepository.getRandomeQoute();
  }
}
