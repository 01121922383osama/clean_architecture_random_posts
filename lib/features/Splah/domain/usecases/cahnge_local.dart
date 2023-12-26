import 'package:clean_architecture/Core/UseCase/use_cases.dart';
import 'package:clean_architecture/Core/error/fialures.dart';
import 'package:clean_architecture/features/Splah/domain/repositories/lang_repository.dart';
import 'package:dartz/dartz.dart';

class ChangeLangUseCases implements UseCase<bool, String> {
  final LangRepository langRepository;

  ChangeLangUseCases({required this.langRepository});
  @override
  Future<Either<Failure, bool>> call(String param) async {
    return await langRepository.changeLang(langCode: param);
  }
}
