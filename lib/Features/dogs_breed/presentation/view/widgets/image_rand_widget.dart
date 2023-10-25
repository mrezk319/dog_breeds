import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view/widgets/photo_preview.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view_model/dogs_breed/DogBreeds_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageRandWidget extends StatelessWidget {
  const ImageRandWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageZoomScreen(
                      img: BlocProvider.of<DogBreedsCubit>(context)
                          .randImg
                          .toString(),
                    )));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          imageUrl: BlocProvider.of<DogBreedsCubit>(context).randImg.toString(),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
