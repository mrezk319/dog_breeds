sealed class DogBreedsState {}

final class DogBreedsInitial extends DogBreedsState {}

class RandomImageByBreedLoading extends DogBreedsState {}

// ignore: must_be_immutable
class RandomImageByBreedSuccess extends DogBreedsState {
  String image;
  RandomImageByBreedSuccess(this.image);
}

class RandomImageByBreedFail extends DogBreedsState {
  final String errMess;
  RandomImageByBreedFail(this.errMess);
}

class RandomImageByBreedAndSubBreedLoading extends DogBreedsState {}

// ignore: must_be_immutable
class RandomImageByBreedAndSubBreedSuccess extends DogBreedsState {
  String image;
  RandomImageByBreedAndSubBreedSuccess(this.image);
}

class RandomImageByBreedAndSubBreedFail extends DogBreedsState {
  final String errMess;
  RandomImageByBreedAndSubBreedFail(this.errMess);
}

class AllBreedsLoading extends DogBreedsState {}

// ignore: must_be_immutable
class AllBreedsSuccess extends DogBreedsState {
  List<dynamic> image;
  AllBreedsSuccess(this.image);
}

class AllBreedsFail extends DogBreedsState {
  final String errMess;
  AllBreedsFail(this.errMess);
}

class AllSubBreedsLoading extends DogBreedsState {}

// ignore: must_be_immutable
class AllSubBreedsSuccess extends DogBreedsState {
  List<String> image;
  AllSubBreedsSuccess(this.image);
}

class AllSubBreedsFail extends DogBreedsState {
  final String errMess;
  AllSubBreedsFail(this.errMess);
}

class ImagesByBreedLoading extends DogBreedsState {}

// ignore: must_be_immutable
class ImagesByBreedSuccess extends DogBreedsState {
  List<String> image;
  ImagesByBreedSuccess(this.image);
}

class ImagesByBreedFail extends DogBreedsState {
  final String errMess;
  ImagesByBreedFail(this.errMess);
}

class ImagesByBreedAndSubBreedLoading extends DogBreedsState {}

// ignore: must_be_immutable
class ImagesByBreedAndSubBreedSuccess extends DogBreedsState {
  List<String> image;
  ImagesByBreedAndSubBreedSuccess(this.image);
}

class ImagesByBreedAndSubBreedFail extends DogBreedsState {
  final String errMess;
  ImagesByBreedAndSubBreedFail(this.errMess);
}

class ChangeBreedNameState extends DogBreedsState {}

class ChangeSubBreedNameState extends DogBreedsState {}
