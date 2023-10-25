import 'package:dogs_images/Features/dogs_breed/presentation/view_model/dogs_breed/DogBreeds_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatefulWidget {
  CustomDropdown(
      {super.key, required this.values, required this.val, required this.name});
  List<dynamic> values;
  TextEditingController val;
  String name;
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green.shade800, borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: DropdownButton<String>(
        isExpanded: true,
        dropdownColor: Colors.green.shade800,
        borderRadius: BorderRadius.circular(10),
        hint: Text('Choose a ${widget.name}...',
            style: GoogleFonts.inter(color: Colors.white)), // Hint text
        value: _selectedOption,
        onChanged: (String? newValue) {
          if (widget.name == "Breed") {
            BlocProvider.of<DogBreedsCubit>(context).changeBreedName(
                newValue![0].toUpperCase() + newValue.substring(1));
            BlocProvider.of<DogBreedsCubit>(context)
                .getSubBreedsList(breedName: newValue);
          } else {
            BlocProvider.of<DogBreedsCubit>(context).changeSubBreedName(
                newValue![0].toUpperCase() + newValue.substring(1));
          }
          setState(() {
            widget.val.text = newValue;
            _selectedOption = newValue;
          });
        },
        isDense: false,
        underline: const SizedBox(),
        menuMaxHeight: MediaQuery.of(context).size.height * 0.4,
        iconEnabledColor: Colors.white,
        icon: const Icon(Icons.arrow_downward, size: 15),
        items: widget.values.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value[0].toUpperCase() + value.substring(1),
                style: GoogleFonts.inter(color: Colors.white)),
          );
        }).toList(),
      ),
    );
  }
}
