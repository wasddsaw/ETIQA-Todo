import 'package:etiqa_todo_mobile_app/core/database/dao/todo_dao.dart';
import 'package:etiqa_todo_mobile_app/core/database/database_util.dart';
import 'package:etiqa_todo_mobile_app/core/database/table/todo/todo.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TodoDao? todoDao;

  RxList<Todo> todoList = RxList();

  @override
  Future<void> onInit() async {
    super.onInit();

    todoDao = DatabaseUtil().getTodoDao();
    todoDao ??= await DatabaseUtil().getTodoDaoAsync();

    getTodoList();
  }

  void getTodoList() {
    todoDao?.getAllTodo().then((value) {
      todoList.value = value;
    });
  }

  void deleteAllTodoList() {
    todoDao?.deleteAllTodo().then(
          (_) => getTodoList(),
        );
  }

  void updateStatusTodo(Todo todo, String status) {
    todoDao?.updateTodo(Todo(
      todo.id,
      todo.title,
      todo.startDate,
      todo.endDate,
      status,
    ));
  }
}
