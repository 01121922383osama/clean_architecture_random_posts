import '../../../../Core/UseCase/use_cases.dart';
import '../../../../Core/error/fialures.dart';
import '../repositories/lang_repository.dart';
import 'package:dartz/dartz.dart';

class GetSaveLangUseCase implements UseCase<String?, NoParam> {
  final LangRepository langRepository;

  GetSaveLangUseCase({required this.langRepository});
  @override
  Future<Either<Failure, String?>> call(NoParam param) async {
    return await langRepository.getSavedLang();
  }
}
