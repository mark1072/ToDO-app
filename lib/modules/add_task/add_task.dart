import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo/sheared/bloc/todo_cubit.dart';
import 'package:todo/sheared/bloc/todo_states.dart';
import 'package:todo/sheared/constant/colors.dart';
import 'package:todo/sheared/style/icon/icon_broken.dart';

import '../../sheared/componant/def_form_field.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = TextEditingController();
    var deadLine = TextEditingController();
    var startTime = TextEditingController();
    var endTime = TextEditingController();
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:  Icon(
                IconBroken.Arrow___Left_2,
                color: Black,
              ),
            ),
            elevation: 3.0,
            title: Text(
              'Add Task',
              style: GoogleFonts.raleway(
                  color: Black, fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: GoogleFonts.arvo(
                            color: Black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        myTextFormField(
                            editingController: title,
                            inputType: TextInputType.text),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'DeadLine',
                          style: GoogleFonts.arvo(
                            color: Black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        myTextFormField(
                          editingController: deadLine,
                          inputType: TextInputType.datetime,
                          tap: ()
                          {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse("2023-05-25"),
                            ).then((value) {
                              deadLine.text =
                                  DateFormat.Md().format(value!);
                            });
                          }
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Start Time',
                                    style: GoogleFonts.arvo(
                                      color: Black,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  myTextFormField(
                                    editingController: startTime,
                                    inputType: TextInputType.datetime,
                                    suffix: Icons.timelapse_outlined,
                                    tap: (){
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((value) {
                                        startTime.text =
                                            value!.format(context).toString();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'End Time',
                                    style: GoogleFonts.arvo(
                                      color: Black,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  myTextFormField(
                                    editingController: endTime,
                                    inputType: TextInputType.datetime,
                                    suffix: Icons.timelapse_outlined,
                                    tap: (){
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((value) {
                                        endTime.text =
                                            value!.format(context).toString();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    TodoCubit.get(context).insertDatabase(
                      title: title.text,
                      date: deadLine.text,
                      sTime: startTime.text,
                      eTime: endTime.text,
                    );
                    Navigator.pop(context);

                  },
                  color: Colors.teal,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  elevation: 10.0,
                  child: Text(
                    'Create a Task',
                    style: GoogleFonts.arvo(
                      color: Black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
