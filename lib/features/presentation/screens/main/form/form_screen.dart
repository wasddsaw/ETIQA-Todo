import 'package:etiqa_todo_mobile_app/features/presentation/components/shared/shared.dart';
import 'package:etiqa_todo_mobile_app/features/presentation/screens/main/form/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormScreen extends GetView<FormController> {
  const FormScreen({super.key});

  static const routeName = '/form';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new To-Do List'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomInput(
                label: 'To-Do Title',
                placeholder: 'Please key in your To-Do title here',
                controller: controller.titleController,
                withHorizontalPadding: true,
                isInputArea: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(
                () => CustomDatePicker(
                  initialDate: controller.selectedStartDate.value,
                  lastDate: DateTime(2050, 1, 1),
                  label: 'Start Date',
                  value: controller.selectedStartDate.value,
                  onDateSelected: (selectedDate) {
                    controller.selectedStartDate.value = selectedDate;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(
                () => CustomDatePicker(
                  initialDate: controller.selectedEndDate.value,
                  lastDate: DateTime(2050, 1, 1),
                  label: 'Estimate End Date',
                  value: controller.selectedEndDate.value,
                  onDateSelected: (selectedDate) {
                    controller.selectedEndDate.value = selectedDate;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => CustomButton(
          label: 'Create Now',
          height: 60,
          onPressed: () {
            controller.createNewTodo().then((_) {
              Get.back();
            });
          },
          isLoading: controller.isLoading.value,
        ),
      ),
    );
  }
}
