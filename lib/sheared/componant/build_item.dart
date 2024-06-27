import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/modules/favourite_tasks/favourite_tasks.dart';
import 'package:todo/sheared/bloc/todo_cubit.dart';
import '../constant/colors.dart';

Widget itemBuilder(
  context, {
  required List<String> choices,
  required PopupMenuItemSelected? onSelectPopButton,
  required Map model,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.teal,
        width: 2.0,
      ),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(15.0),
      ),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: mainColor,
          child: Text(
            '${model['date']}',
            style: GoogleFonts.arvo(
              color: Black,
              fontSize: 15.0,
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model["title"]}',
                style: GoogleFonts.arvo(
                  color: Black,
                  fontSize: 19.0,
                ),
              ),
              Text(
                '${model["sTime"]} - ${model["eTime"]}',
                style: GoogleFonts.arvo(
                  color: Grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 35.0,
          height: 35.0,
          decoration: BoxDecoration(
            color: model['favourite'] == "favourite"
                ? Colors.red[400]
                : Colors.grey,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              if (model['favourite'] == "notFavourite") {
                TodoCubit.get(context)
                    .favouriteTask(favourite: "favourite", id: model['id']);
              }else if(model['favourite'] == "favourite")
              {
                TodoCubit.get(context)
                    .favouriteTask(favourite: "notFavourite", id: model['id']);
              }
            },
            icon: const Icon(
              Icons.favorite_border_outlined,
              size: 22,
              color: Colors.white,
            ),
          ),
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_horiz_rounded),
          onSelected: onSelectPopButton,
          iconSize: 25.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          color: Colors.white60,
          itemBuilder: (context) {
            return choices.map((choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    ),
  );
}


Widget itemBuilderWithMenu(
    context, {
      required Map model,
    }) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.teal,
        width: 2.0,
      ),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(15.0),
      ),
    ),
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: mainColor,
          child: Text(
            '${model['date']}',
            style: GoogleFonts.arvo(
              color: Black,
              fontSize: 15.0,
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model["title"]}',
                style: GoogleFonts.arvo(
                  color: Black,
                  fontSize: 19.0,
                ),
              ),
              Text(
                '${model["sTime"]} - ${model["eTime"]}',
                style: GoogleFonts.arvo(
                  color: Grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 35.0,
          height: 35.0,
          decoration: BoxDecoration(
            color: model['favourite'] == "favourite"
                ? Colors.red[400]
                : Colors.grey,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              if (model['favourite'] == "notFavourite") {
                TodoCubit.get(context)
                    .favouriteTask(favourite: "favourite", id: model['id']);
              }else if(model['favourite'] == "favourite")
              {
                TodoCubit.get(context)
                    .favouriteTask(favourite: "notFavourite", id: model['id']);
              }
            },
            icon: const Icon(
              Icons.favorite_border_outlined,
              size: 22,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
