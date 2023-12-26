import '../../../../Core/UseCase/use_cases.dart';
import '../../../../Core/utils/app_strings.dart';
import '../../domain/usecases/cahnge_local.dart';
import '../../domain/usecases/get_save_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSaveLangUseCase getSaveLangUseCase;
  final ChangeLangUseCases changeLangUseCase;

  LocaleCubit(
      {required this.getSaveLangUseCase, required this.changeLangUseCase})
      : super(const LocaleInitial(Locale(AppStrings.english)));
  String currentLangCode = AppStrings.english;

  Future<void> getSavedLang() async {
    final response = await getSaveLangUseCase.call(NoParam());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = value!;
      emit(LocaleInitial(Locale(currentLangCode)));
    });
  }

  Future<void> _changeLang(String langCode) async {
    final response = await changeLangUseCase.call(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = langCode;
      emit(LocaleInitial(Locale(currentLangCode)));
    });
  }

  void toEnglish() => _changeLang(AppStrings.english);

  void toArabic() => _changeLang(AppStrings.arabic);
}
