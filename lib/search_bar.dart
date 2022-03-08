import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: true,
      right: true,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 12),
        padding: EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Cari menu favoritmu",
            hintStyle: GoogleFonts.montserrat(color: Colors.grey, fontSize: 14),
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
