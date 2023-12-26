import 'package:clean_architecture/Core/API/api_consumer.dart';
import 'package:clean_architecture/Core/API/end_point.dart';
import 'package:clean_architecture/features/random_qoute/data/models/qoute_models.dart';

import '../../../../Core/utils/app_strings.dart';

abstract class RandomeQouteRemoteDataSource {
  Future<QouteModels> getRandomeQoute();
}

class RandomeQouteRemoteDataSourceImpl implements RandomeQouteRemoteDataSource {
  ApiConsumer apiConsumer;
  RandomeQouteRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<QouteModels> getRandomeQoute() async {
    final response =
        await apiConsumer.get(EndPoint.randomeQoute, queryParameters: {
      AppStrings.contentType: AppStrings.applicationJosn,
    });

    return QouteModels.fromJson(response);
  }
}
