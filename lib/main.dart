import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos_app/presentation/bindings/apps_binding.dart';
import 'package:todos_app/presentation/views/todo_list_view.dart';
import 'package:todos_app/themes/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppsBinding(),
      title: 'Todos App',
      theme: AppTheme.mainTheme,
      home: const ToDoListView(),
    );
  }
}
