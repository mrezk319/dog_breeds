import 'package:dartz/dartz.dart';
import 'package:dogs_images/Core/errors/error.dart';

abstract class DogBreedsRepo {
  Future<Either<Failure, List<String>>> fetchSubBreed({String breedName});
  Future<Either<Failure, List<dynamic>>> fetchBreeds();

  Future<Either<Failure, String>> fetchRandomImageByBreed({String breedName});
  Future<Either<Failure, List<String>>> fetchImagesByBreed({String breedName});

  Future<Either<Failure, String>> fetchImageByBreedAndSubBreed(
      {String breedName, String subBreedName});
  Future<Either<Failure, List<String>>> fetchImagesByBreedAndSubBreed(
      {String breedName, String subBreedName});
}
