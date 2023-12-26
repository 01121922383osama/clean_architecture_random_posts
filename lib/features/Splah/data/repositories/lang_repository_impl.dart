import 'package:clean_architecture/Core/error/exceptions.dart';
import 'package:clean_architecture/Core/error/fialures.dart';
import 'package:clean_architecture/features/Splah/data/datasources/lang_local_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/lang_repository.dart';

class LangRepositoryImpl implements LangRepository {
  final LocalDataSource localDataSource;

  LangRepositoryImpl({required this.localDataSource});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      return Right(await localDataSource.changeLang(langCode: langCode));
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getSavedLang() async {
    try {
      return Right(await localDataSource.getSavedLang());
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
