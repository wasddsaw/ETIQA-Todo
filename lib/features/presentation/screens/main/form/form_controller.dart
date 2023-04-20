import 'package:etiqa_todo_mobile_app/core/database/dao/todo_dao.dart';
import 'package:etiqa_todo_mobile_app/core/database/database_util.dart';
import 'package:etiqa_todo_mobile_app/core/database/table/todo/todo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class FormController extends GetxController {
  TodoDao? todoDao;

  TextEditingController titleController = TextEditingController(text: '');
  Rxn<DateTime> selectedStartDate = Rxn<DateTime>();
  Rxn<DateTime> selectedEndDate = Rxn<DateTime>();

  RxBool isLoading = RxBool(false);

  @override
  Future<void> onInit() async {
    super.onInit();

    todoDao = DatabaseUtil().getTodoDao();
    todoDao ??= await DatabaseUtil().getTodoDaoAsync();
  }

  Future<void> createNewTodo() async {
    isLoading(true);
    await todoDao
        ?.insertTodo(
      Todo(
        null,
        titleController.text,
        Jiffy(selectedStartDate.string).format('yyyy-MM-dd'),
        Jiffy(selectedEndDate.string).format('yyyy-MM-dd'),
        'Incomplete',
      ),
    )
        .then((_) {
      // String message = 'Successfully add new task!';
      // Get.showSnackbar(
      //   GetSnackBar(
      //     message: message,
      //     duration: const Duration(seconds: 1),
      //   ),
      // );
      isLoading(false);
    });
  }
}
