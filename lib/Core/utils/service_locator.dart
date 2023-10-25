import 'package:dio/dio.dart';
import 'package:dogs_images/Core/utils/api_service.dart';
import 'package:dogs_images/Features/dogs_breed/data/repos/dogs_breed_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<DogBreedsRepoImpl>(
      DogBreedsRepoImpl(getIt.get<ApiService>()));
}
