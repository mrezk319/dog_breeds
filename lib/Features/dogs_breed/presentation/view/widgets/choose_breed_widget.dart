// ignore: must_be_immutable
import 'package:dogs_images/Core/utils/styles.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view/widgets/custom_crop_down_shimmer.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view/widgets/custom_drop_down.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view_model/dogs_breed/DogBreeds_cubit.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view_model/dogs_breed/dogbreeds_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ChooseBreedWidget extends StatefulWidget {
  ChooseBreedWidget(
      {super.key, required this.breedNameController, required this.name});

  TextEditingController breedNameController;
  String name;

  @override
  State<ChooseBreedWidget> createState() => _ChooseBreedWidgetState();
}

class _ChooseBreedWidgetState extends State<ChooseBreedWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogBreedsCubit, DogBreedsState>(
      builder: (context, state) {
        if (state is AllBreedsFail) {
          return Center(
            child: Text(state.errMess, style: Styles.errTextStyle),
          );
        } else if (state is AllBreedsLoading) {
          return const CustomDropdownShimmer();
          // return const Center(
          //   child: CircularProgressIndicator(),
          // );
        } else {
          return CustomDropdown(
            name: widget.name,
            values: BlocProvider.of<DogBreedsCubit>(context).allBreeds,
            val: widget.breedNameController,
          );
        }
      },
    );
  }
}
