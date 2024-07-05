import 'package:flutter/material.dart';
import 'package:todos_app/themes/todo_colors.dart';
import 'package:todos_app/themes/todo_typography.dart';

enum AddOrEditType {
  add,
  edit,
}

class AddOrEditPage extends StatelessWidget {
  final TextEditingController textControler;
  final AddOrEditType addOrEditType;
  final Function(String?)? callback;

  const AddOrEditPage({
    super.key,
    required this.textControler,
    required this.addOrEditType,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    String textOnChanged = '';
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: addOrEditType == AddOrEditType.add ? 'Add' : 'Edit',
                  style: TodoTypoGraphy.textHeader(context),
                ),
                TextSpan(
                  text: 'Todo',
                  style: TodoTypoGraphy.textHeader(context)
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
          )),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Form(
                key: formKey,
                child: TextFormField(
                  cursorColor: TodoColors.primary.shade600,
                  controller: textControler,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    textOnChanged = value;
                  },
                  validator: (value) {
                    if (value == '' || value!.isEmpty) {
                      return 'Please enter some text';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    floatingLabelStyle: TodoTypoGraphy.textBold(context),
                    labelText: "Your task",
                    labelStyle: TodoTypoGraphy.textMedium(context).copyWith(
                      color: TodoColors.primary.shade300,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      callback?.call(textOnChanged);
                    }
                  },
                  child: Text(
                    addOrEditType == AddOrEditType.add ? 'Add' : 'Edit',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
