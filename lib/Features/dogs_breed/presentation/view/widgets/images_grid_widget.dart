import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view/widgets/photo_preview.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view_model/dogs_breed/DogBreeds_cubit.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view_model/dogs_breed/dogbreeds_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagesGridWidget extends StatelessWidget {
  const ImagesGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogBreedsCubit, DogBreedsState>(
      builder: (ctx, state) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 10.0, // Spacing between columns
            mainAxisSpacing: 10.0, // Spacing between rows
          ),
          itemCount: BlocProvider.of<DogBreedsCubit>(context).images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageZoomScreen(
                              img: BlocProvider.of<DogBreedsCubit>(ctx)
                                  .images[index],
                            )));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl:
                      BlocProvider.of<DogBreedsCubit>(context).images[index],
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
