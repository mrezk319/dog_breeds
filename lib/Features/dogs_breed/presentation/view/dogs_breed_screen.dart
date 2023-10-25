import 'package:dogs_images/Features/dogs_breed/presentation/view/widgets/dogs_breed_body_widget.dart';
import 'package:flutter/material.dart';

class DogBreedsScreen extends StatelessWidget {
  const DogBreedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DogBreedsBody(),
    );
  }
}
