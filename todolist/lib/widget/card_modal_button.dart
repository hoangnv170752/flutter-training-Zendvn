import 'package:flutter/material.dart';

class ModalBottom extends StatefulWidget {
  ModalBottom({Key? key, required this.addTask,  required this.editTask,}) : super(key: key);

  final Function addTask;
  final Function editTask;
  // final String item ;
  @override
  State<ModalBottom> createState() => _ModalBottomState();
}

class _ModalBottomState extends State<ModalBottom> {
  //TextEditingController controller = TextEditingController(text: item ? item.name : '');
  TextEditingController controller = TextEditingController();
  static get item => null;


  void _handleOnclick() {
    final name = controller.text;
    widget.addTask(name);
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please write some things';
                  }
                  if (value.length <= 5) {
                    return 'Type more than 5 characters';
                  }
                  return null;
                },
                controller: controller,
                cursorColor: Colors.black87,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "My task is ..."
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _handleOnclick();
                    }
                  },
                  child: Text("Add Task"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, textStyle: TextStyle(color: Colors.black87)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
