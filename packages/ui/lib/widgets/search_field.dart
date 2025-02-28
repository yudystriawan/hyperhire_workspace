import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const SearchField({
    super.key,
    required this.controller,
    this.hintText = '검색어를 입력하세요',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.0.w,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 12.0, color: Color(0xFF868686)),
          suffixIcon: Icon(Icons.search, color: Color(0xFF3E3CD5)),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
      ),
    );
  }
}
