import 'package:etiqa_todo_mobile_app/features/presentation/components/shared/shared.dart';
import 'package:etiqa_todo_mobile_app/features/presentation/screens/main/form/form_screen.dart';
import 'package:etiqa_todo_mobile_app/features/presentation/screens/main/home/home_controller.dart';
import 'package:etiqa_todo_mobile_app/features/presentation/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: AppColors.black,
            ),
            onPressed: () {
              controller.deleteAllTodoList();
            },
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.red,
        onPressed: () {
          Get.toNamed(FormScreen.routeName)?.then(
            (_) {
              controller.getTodoList();
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Column(
              children: (controller.todoList).map(
                (e) {
                  return CustomCard(
                    title: e.title,
                    startDate: Jiffy(e.startDate).format('d MMM yyyy'),
                    endDate: Jiffy(e.endDate).format('d MMM yyyy'),
                    status: e.status,
                    isCompleted: e.status == 'Incomplete' ? false : true,
                    onValueChanged: (val) {
                      if (!val) {
                        controller.updateStatusTodo(e, 'Incomplete');
                      } else {
                        controller.updateStatusTodo(e, 'Completed');
                      }
                      controller.getTodoList();
                    },
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
