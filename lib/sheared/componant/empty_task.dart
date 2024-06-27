import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget emptyTask() => Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Image(image: AssetImage("assets/Frame.png"),),
    const SizedBox(height: 25.0,),
    Text('No Task Found',style: GoogleFonts.arya(fontSize: 25.0,letterSpacing: 3.0),)
  ],
);
