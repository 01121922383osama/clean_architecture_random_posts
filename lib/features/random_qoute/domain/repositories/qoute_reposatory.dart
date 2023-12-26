import '../../../../Core/error/fialures.dart';
import '../entities/qoute.dart';
import 'package:dartz/dartz.dart';

abstract class QouteRepository {
  Future<Either<Failure, Qoute>> getRandomeQoute();
}
