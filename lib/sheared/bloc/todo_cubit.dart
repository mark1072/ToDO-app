import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/sheared/bloc/todo_states.dart';

class TodoCubit extends Cubit<TodoStates>{
  TodoCubit():super(InitialState());

  static TodoCubit get(context) => BlocProvider.of(context);

  bool checkValue=false;
  List<bool> boolValues= List.generate(15, (index) => false);

  bool checkboxVal = false;

  void changeCheckbox(value) {
    checkboxVal = !checkboxVal;
    emit(RegisterChangeCheckbox());
  }

  Database ? database;
  void createDatabase() {
    openDatabase(
      "task.db",
      version: 1,
      onCreate: (database, version) {
        print("database created");
        database.execute(
            'CREATE TABLE  tasks (id INTEGER PRIMARY KEY,  title TEXT, date TEXT, sTime TEXT, eTime Text , status TEXT , favourite TEXT)')
            .then((value) => print('table created'))
            .catchError((error) => print('Error'));
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print("database opened");
      },
    ).then((value) {
      database = value;
      emit(CreateDatabaseState());
    });
  }

  void insertDatabase({
    required String? title,
    required String? date,
    required String? sTime,
    required String? eTime,
  }) async {
    await database?.transaction(
          (txn) async {
        await txn
            .rawInsert(
            'INSERT INTO tasks (title, date, sTime, eTime, status, favourite) VALUES("$title", "$date", "$sTime", "$eTime" , "unComplete" , "notFavourite")')
            .then((value) {
          print('$value inserting done');
          emit(InsertDatabaseState());
          getDataFromDatabase(database);
        }).catchError((error) => print('error ${error.toString()}'));
        return null;
      },
    );
  }


  List<Map> unComplete = [];
  List<Map> complete = [];
  List<Map> favourite = [];
  List<Map> allTask = [];

  void getDataFromDatabase(database) async {
    unComplete=[];
    complete=[];
    favourite = [];
    allTask=[];

    emit(GetDatabaseState());
    database!.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        allTask.add(element);
        if (element['status'] == 'unComplete') {
          unComplete.add(element);
        } else if (element['status'] == 'complete'){
          complete.add(element);
        }
        if(element['favourite'] == "favourite"){
          favourite.add(element);
        }
      });
      emit(GetDatabaseState());
    });
  }

  void updateDatabase({
    @required String? status,
    @required int? id,
  }) {
    database?.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      [
        '$status',
        id,
      ],
    ).then((value) {
      emit(UpdateDatabaseState());
      getDataFromDatabase(database);
    });
  }


  void favouriteTask({
    @required String? favourite,
    @required int? id,
  }) {
    database?.rawUpdate(
      'UPDATE tasks SET favourite = ? WHERE id = ?',
      [
        '$favourite',
        id,
      ],
    ).then((value) {
      emit(FavouriteDatabaseState());
      getDataFromDatabase(database);
    });
  }

  void deleteDatabase({
    @required int? id,
  }) {
    database?.rawDelete(
      'DELETE FROM tasks WHERE id = ?',
      [
        id,
      ],
    ).then((value) {
      emit(DeleteDatabaseState());
      getDataFromDatabase(database);
    });
  }

}