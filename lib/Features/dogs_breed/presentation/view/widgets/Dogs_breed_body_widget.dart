import 'package:dogs_images/Features/dogs_breed/presentation/view/widgets/app_bar_widget.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view/widgets/breed_and_sub_buttons_widget.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view/widgets/breed_buttons_widget.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view/widgets/choose_breed_widget.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view/widgets/choose_sub_breed_widget.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view/widgets/image_rand_widget.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view/widgets/images_grid_widget.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view/widgets/shimmer_images_widget.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view_model/dogs_breed/DogBreeds_cubit.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view_model/dogs_breed/dogbreeds_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class DogBreedsBody extends StatefulWidget {
  const DogBreedsBody({super.key});

  @override
  State<DogBreedsBody> createState() => _DogBreedsBodyState();
}

class _DogBreedsBodyState extends State<DogBreedsBody> {
  TextEditingController breedNameController = TextEditingController();
  TextEditingController subBreedNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //var mediaQuery = MediaQuery.of(context);
    return CustomScrollView(
      slivers: [
        const AppBarWidget(),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ChooseBreedWidget(
                  breedNameController: breedNameController, name: "Breed"),
              const SizedBox(
                height: 10,
              ),
              ChooseSubBreedWidget(
                  subBreedNameController: subBreedNameController,
                  name: "Sub Breed"),
              const SizedBox(
                height: 25,
              ),
              BreedButtons(breedNameController: breedNameController),
              const SizedBox(
                height: 20,
              ),
              BreedAndSubBreedButtons(
                  breedNameController: breedNameController,
                  subBreedNameController: subBreedNameController),
              const SizedBox(height: 20),
              BlocBuilder<DogBreedsCubit, DogBreedsState>(
                builder: (context, state) {
                  if (state is ImagesByBreedAndSubBreedLoading ||
                      state is ImagesByBreedLoading ||
                      state is RandomImageByBreedAndSubBreedLoading ||
                      state is RandomImageByBreedLoading) {
                    return const ShimmerImages();
                  } else if (state is ImagesByBreedAndSubBreedFail ||
                      state is ImagesByBreedFail ||
                      state is RandomImageByBreedAndSubBreedFail ||
                      state is RandomImageByBreedFail) {
                    return const Center(
                      child: Text("Failed get image"),
                    );
                  } else {
                    if (state is RandomImageByBreedAndSubBreedSuccess ||
                        state is RandomImageByBreedSuccess) {
                      return const ImageRandWidget();
                    } else if (state is ImagesByBreedAndSubBreedSuccess ||
                        state is ImagesByBreedSuccess) {
                      return const ImagesGridWidget();
                    } else {
                      return const SizedBox();
                    }
                  }
                },
              ),
            ],
          ),
        ))
      ],
    );
  }
}
