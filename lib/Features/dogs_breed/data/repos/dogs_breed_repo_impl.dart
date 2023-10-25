import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dogs_images/Core/errors/error.dart';
import 'package:dogs_images/Core/utils/api_service.dart';
import 'package:dogs_images/Features/dogs_breed/data/models/images_model.dart';
import 'package:dogs_images/Features/dogs_breed/data/models/random_image_model.dart';
import 'package:dogs_images/Features/dogs_breed/data/repos/dogs_breed_repo.dart';

class DogBreedsRepoImpl implements DogBreedsRepo {
  ApiService apiService;
  DogBreedsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> fetchRandomImageByBreed(
      {String? breedName}) async {
    try {
      var data =
          await apiService.getData(endPoint: 'breed/$breedName/images/random');
      log(data.toString());
      return right(RandomImageModel.fromJson(data).message.toString());
    } catch (e) {
      if (e is DioError) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> fetchImageByBreedAndSubBreed(
      {String? breedName, String? subBreedName}) async {
    try {
      var data = await apiService.getData(
          endPoint: 'breed/$breedName/$subBreedName/images/random');
      return right(RandomImageModel.fromJson(data).message);
    } catch (e) {
      if (e is DioError) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> fetchImagesByBreed(
      {String? breedName}) async {
    try {
      var data = await apiService.getData(endPoint: 'breed/$breedName/images');
      return right(ListOfModel.fromJson(data).message);
    } catch (e) {
      if (e is DioError) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> fetchImagesByBreedAndSubBreed(
      {String? breedName, String? subBreedName}) async {
    try {
      var data = await apiService.getData(
          endPoint: 'breed/$breedName/$subBreedName/images');
      return right(ListOfModel.fromJson(data).message);
    } catch (e) {
      if (e is DioError) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> fetchSubBreed(
      {String? breedName}) async {
    try {
      var data = await apiService.getData(endPoint: 'breed/$breedName/list');
      return right(ListOfModel.fromJson(data).message);
    } catch (e) {
      if (e is DioError) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<dynamic>>> fetchBreeds() async {
    try {
      var data = await apiService.getData(endPoint: 'breeds/list/all');
      return right((data['message'] as Map).keys.toList());
    } catch (e) {
      if (e is DioError) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
