// ignore: must_be_immutable
import 'package:dogs_images/Core/utils/styles.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view/widgets/custom_crop_down_shimmer.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view/widgets/custom_drop_down.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view_model/dogs_breed/DogBreeds_cubit.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view_model/dogs_breed/dogbreeds_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ChooseSubBreedWidget extends StatelessWidget {
  ChooseSubBreedWidget(
      {super.key, required this.subBreedNameController, required this.name});

  TextEditingController subBreedNameController;
  String name;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogBreedsCubit, DogBreedsState>(
      builder: (context, state) {
        if (state is AllSubBreedsFail) {
          return Center(
            child: Text(state.errMess, style: Styles.errTextStyle),
          );
        } else if (state is AllSubBreedsLoading) {
          return const CustomDropdownShimmer();
          // return const Center(
          //   child: CircularProgressIndicator(),
          // );
        } else {
          if (BlocProvider.of<DogBreedsCubit>(context).allSubBreeds.isEmpty) {
            return const SizedBox();
          } else {
            return CustomDropdown(
              name: name,
              values: BlocProvider.of<DogBreedsCubit>(context).allSubBreeds,
              val: subBreedNameController,
            );
          }
        }
      },
    );
  }
}
