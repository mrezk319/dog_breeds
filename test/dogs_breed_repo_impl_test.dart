import 'package:dartz/dartz.dart';
import 'package:dogs_images/Core/utils/api_service.dart';
import 'package:dogs_images/Features/dogs_breed/data/repos/dogs_breed_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dogs_breed_repo_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late DogBreedsRepoImpl dogBreedsRepo;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    dogBreedsRepo = DogBreedsRepoImpl(mockApiService);
  });

  {
    const responseRanImage = {
      'message': 'https://example.com/image.jpg',
      'status': 'success',
    };
    const listOfImages = {
      'message': ['https://example.com/image.jpg'],
      'status': 'success',
    };
    test('should return a random hound dog image URL', () async {
      when(mockApiService.getData(endPoint: "breed/hound/images/random"))
          .thenAnswer((_) async {
        return Future.value(responseRanImage);
      });

      final result =
          await dogBreedsRepo.fetchRandomImageByBreed(breedName: "hound");

      expectRandImage(result.fold((l) => l, (r) => r),
          Right((responseRanImage["message"].toString())));
    });
    test('should return a random afghan hound dog image URL', () async {
      when(mockApiService.getData(endPoint: "breed/hound/afghan/images/random"))
          .thenAnswer((_) async {
        return Future.value(responseRanImage);
      });

      final result = await dogBreedsRepo.fetchImageByBreedAndSubBreed(
          breedName: "hound", subBreedName: "afghan");

      expectRandImage(result.fold((l) => l, (r) => r),
          Right((responseRanImage["message"].toString())));
    });

    test('should return a list of afghan hound dog images URL', () async {
      when(mockApiService.getData(endPoint: "breed/hound/afghan/images"))
          .thenAnswer((_) async {
        return Future.value(listOfImages);
      });

      final result = await dogBreedsRepo.fetchImagesByBreedAndSubBreed(
          breedName: 'hound', subBreedName: "afghan");

      expectListImages(result.fold((l) => l, (r) => r),
          Right((listOfImages["message"] as List<String>)));
    });
    test('should return a list of hound dog images URL', () async {
      when(mockApiService.getData(endPoint: "breed/hound/images"))
          .thenAnswer((_) async {
        return Future.value(listOfImages);
      });

      final result = await dogBreedsRepo.fetchImagesByBreed(breedName: 'hound');

      expectListImages(result.fold((l) => l, (r) => r),
          Right((listOfImages["message"] as List<String>)));
    });
  }
}

void expectRandImage(result, Right<dynamic, String> right) {
  expect(result, right.value);
}

void expectListImages(result, Right<dynamic, List<String>> right) {
  expect(result, right.value);
}
