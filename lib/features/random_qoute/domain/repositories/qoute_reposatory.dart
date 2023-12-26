import 'package:clean_architecture/Core/error/fialures.dart';
import 'package:clean_architecture/features/random_qoute/domain/entities/qoute.dart';
import 'package:dartz/dartz.dart';

abstract class QouteRepository {
  Future<Either<Failure, Qoute>> getRandomeQoute();
}
