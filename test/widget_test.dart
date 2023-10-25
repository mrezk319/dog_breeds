import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dogs_images/Core/utils/api_service.dart';
import 'package:dogs_images/Features/dogs_breed/data/repos/dogs_breed_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late DogBreedsRepoImpl dogBreedsRepo;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    dogBreedsRepo = DogBreedsRepoImpl(mockApiService);
  });
  test('should return a random image URL', () async {
    // Arrange
    when(mockApiService.getData(endPoint: "breed/hound/images/random"))
        .thenAnswer((_) async => Future.value({
              'message': 'https://example.com/image.jpg',
              "status": "success"
            })); // Return a Future with a Map

    // Act
    final result =
        await dogBreedsRepo.fetchRandomImageByBreed(breedName: 'hound');

    // Assert
    expect(result, const Right('https://example.com/image.jpg'));
    verify(mockApiService.getData(endPoint: 'breed/golden/images/random'))
        .called(1);
  });

  group('fetchRandomImageByBreed', () {
    // test('should return a failure when DioError occurs', () async {
    //   // Arrange
    //   when(mockApiService.getData(endPoint: anyNamed('endPoint'))).thenThrow(
    //       DioError(
    //           response: Response(data: null, statusCode: 404, requestOptions: null)));

    //   // Act
    //   final result =
    //       await dogBreedsRepo.fetchRandomImageByBreed(breedName: 'nonexistent');

    //   // Assert
    //   expect(
    //       result,
    //       Left(ServerFailure.fromDioError(
    //           DioError(response: Response(data: null, statusCode: 404)))));
    //   verify(mockApiService.getData(
    //           endPoint: 'breed/nonexistent/images/random'))
    //       .called(1);
    // });
  });
}
