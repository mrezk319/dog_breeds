import 'package:bloc/bloc.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view_model/dogs_breed/dogbreeds_state.dart';

import '../../../data/repos/dogs_breed_repo.dart';

class DogBreedsCubit extends Cubit<DogBreedsState> {
  DogBreedsCubit(this.dogBreedsRepo) : super(DogBreedsInitial());
  DogBreedsRepo dogBreedsRepo;

  List<dynamic> allBreeds = [];
  List<dynamic> allSubBreeds = [];

  List<dynamic> images = [];

  var randImg = StringBuffer();
  var breedName = StringBuffer();
  var subBreedName = StringBuffer();

  changeBreedName(name) {
    breedName.clear();
    emit(ChangeBreedNameState());
    breedName.write(name);
    emit(ChangeBreedNameState());
  }

  changeSubBreedName(name) {
    subBreedName.clear();
    subBreedName.write(name);
    emit(ChangeSubBreedNameState());
  }

  Future<void> getBreedsList() async {
    emit(AllBreedsLoading());
    var result = await dogBreedsRepo.fetchBreeds();
    result.fold((fail) {
      emit(AllBreedsFail(fail.errMessage));
    }, (breeds) {
      allBreeds.addAll(breeds);
      emit(AllBreedsSuccess(breeds));
    });
  }

  Future<void> getSubBreedsList({breedName}) async {
    allSubBreeds = [];
    emit(AllSubBreedsLoading());
    var result = await dogBreedsRepo.fetchSubBreed(breedName: breedName);
    result.fold((fail) {
      emit(AllSubBreedsFail(fail.errMessage));
    }, (breeds) {
      allSubBreeds.addAll(breeds);
      emit(AllSubBreedsSuccess(breeds));
    });
  }

  Future<void> getBreedRandomImage({breedName}) async {
    emit((RandomImageByBreedLoading()));
    var result =
        await dogBreedsRepo.fetchRandomImageByBreed(breedName: breedName);
    result.fold((fail) {
      emit(RandomImageByBreedFail(fail.errMessage));
    }, (breed) {
      randImg.clear();
      randImg.write(breed);
      emit(RandomImageByBreedSuccess(breed));
    });
  }

  Future<void> getBreedAndSubBreedRandomImage({breedName, subBreedName}) async {
    emit((RandomImageByBreedLoading()));
    var result = await dogBreedsRepo.fetchImageByBreedAndSubBreed(
        breedName: breedName, subBreedName: subBreedName);
    result.fold((fail) {
      emit(RandomImageByBreedFail(fail.errMessage));
    }, (breed) {
      randImg.clear();
      randImg.write(breed);
      emit(RandomImageByBreedSuccess(breed));
    });
  }

  Future<void> getBreedAndSubBreedImages({breedName, subBreedName}) async {
    images = [];
    emit((ImagesByBreedAndSubBreedLoading()));
    var result = await dogBreedsRepo.fetchImagesByBreedAndSubBreed(
        breedName: breedName, subBreedName: subBreedName);
    result.fold((fail) {
      emit(ImagesByBreedAndSubBreedFail(fail.errMessage));
    }, (breed) {
      images.addAll(breed);
      emit(ImagesByBreedAndSubBreedSuccess(breed));
    });
  }

  Future<void> getBreedImages({breedName, subBreedName}) async {
    images = [];
    emit((ImagesByBreedLoading()));
    var result = await dogBreedsRepo.fetchImagesByBreed(breedName: breedName);
    result.fold((fail) {
      emit(ImagesByBreedFail(fail.errMessage));
    }, (breed) {
      images.addAll(breed);
      emit(ImagesByBreedSuccess(breed));
    });
  }
}
