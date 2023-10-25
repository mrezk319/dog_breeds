import 'package:dogs_images/Core/utils/styles.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view_model/dogs_breed/DogBreeds_cubit.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view_model/dogs_breed/dogbreeds_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedButtons extends StatelessWidget {
  const BreedButtons({
    super.key,
    required this.breedNameController,
  });

  final TextEditingController breedNameController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogBreedsCubit, DogBreedsState>(
        builder: (context, state) {
      if (BlocProvider.of<DogBreedsCubit>(context).breedName.isEmpty) {
        return const SizedBox();
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              BlocProvider.of<DogBreedsCubit>(context)
                  .getBreedImages(breedName: breedNameController.text);
            },
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.45),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.green.shade800,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                "${BlocProvider.of<DogBreedsCubit>(context).breedName} Images",
                style: Styles.textStyle
                    .copyWith(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<DogBreedsCubit>(context)
                  .getBreedRandomImage(breedName: breedNameController.text);
            },
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.45),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(5),
                color: Colors.green.shade800,
              ),
              child: Text(
                "${BlocProvider.of<DogBreedsCubit>(context).breedName} Random Image",
                style: Styles.textStyle
                    .copyWith(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      );
    });
  }
}
