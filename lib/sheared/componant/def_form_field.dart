import 'package:flutter/material.dart';

Widget myTextFormField({
  required TextEditingController editingController,
  required TextInputType inputType,
  IconData? suffix,
  GestureTapCallback? tap,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 7.0),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: Icon(suffix,color: Colors.grey[500],),
          filled: true,
          fillColor: Colors.grey[350],
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        controller: editingController,
        keyboardType: inputType,
        onTap: tap,
      ),
    );
