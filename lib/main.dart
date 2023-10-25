import 'package:dogs_images/Core/utils/custom_bloc_observer.dart';
import 'package:dogs_images/Core/utils/service_locator.dart';
import 'package:dogs_images/Features/dogs_breed/data/repos/dogs_breed_repo_impl.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view/dogs_breed_screen.dart';
import 'package:dogs_images/Features/dogs_breed/presentation/view_model/dogs_breed/dogbreeds_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DogBreedsCubit(getIt.get<DogBreedsRepoImpl>())..getBreedsList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dog Breeds',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DogBreedsScreen(),
      ),
    );
  }
}
