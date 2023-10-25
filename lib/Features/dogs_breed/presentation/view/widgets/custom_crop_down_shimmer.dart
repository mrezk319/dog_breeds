import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart'; // Import the shimmer package

class CustomDropdownShimmer extends StatefulWidget {
  const CustomDropdownShimmer({super.key});

  @override
  _CustomDropdownShimmerState createState() => _CustomDropdownShimmerState();
}

class _CustomDropdownShimmerState extends State<CustomDropdownShimmer> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        // Wrap your DropdownButton with Shimmer.fromColors
        baseColor: Colors.grey[300]!, // Base color of the shimmer effect
        highlightColor:
            Colors.grey[100]!, // Highlight color of the shimmer effect
        child: DropdownButton<String>(
            isExpanded: true,
            dropdownColor: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            hint: Text('Choose...',
                style: GoogleFonts.inter(color: Colors.white54)), // Hint text
            value: _selectedOption,
            onChanged: (String? newValue) {
              // widget.val.text = newValue!;
              setState(() {
                _selectedOption = newValue;
              });
            },
            isDense: false,
            underline: const SizedBox(),
            iconEnabledColor: Colors.white,
            icon: const Icon(Icons.arrow_downward, size: 15),
            items: const []),
      ),
    );
  }
}
