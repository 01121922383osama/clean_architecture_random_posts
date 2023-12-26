import 'package:clean_architecture/Core/Network/network_info.dart';
import 'package:clean_architecture/Core/error/exceptions.dart';
import 'package:clean_architecture/Core/error/fialures.dart';
import 'package:clean_architecture/features/random_qoute/data/datasources/randome_qoute_local_data_sourece.dart';
import 'package:clean_architecture/features/random_qoute/data/datasources/randome_qoute_remote_data_sourece.dart';
import 'package:clean_architecture/features/random_qoute/domain/entities/qoute.dart';
import 'package:clean_architecture/features/random_qoute/domain/repositories/qoute_reposatory.dart';
import 'package:dartz/dartz.dart';

class QouteRepositoryImpl implements QouteRepository {
  final NetworkInfo networkInfo;
  final RandomeQouteLocalDataSource qouteLocalDataSource;
  final RandomeQouteRemoteDataSource qouteRemoteDataSource;

  QouteRepositoryImpl({
    required this.networkInfo,
    required this.qouteLocalDataSource,
    required this.qouteRemoteDataSource,
  });
  @override
  Future<Either<Failure, Qoute>> getRandomeQoute() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandeomQoute =
            await qouteRemoteDataSource.getRandomeQoute();
        qouteLocalDataSource.cacheQoute(remoteRandeomQoute);
        return Right(remoteRandeomQoute);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      try {
        final cacheRandeomQoute =
            await qouteLocalDataSource.getLastRandomeQoute();
        return Right(cacheRandeomQoute);
      } on CacheException {
        return left(CacheFailure());
      }
    }
  }
}
