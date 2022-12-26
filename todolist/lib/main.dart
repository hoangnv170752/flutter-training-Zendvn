import 'package:flutter/material.dart';
import 'package:todolist/modal/items.dart';
import 'package:todolist/widget/card_body_widget.dart';
import 'package:todolist/widget/card_modal_button.dart';

/**
 * BT1: khi thêm xong thì phải đóng modal thêm - bổ sung Navigator.pop(context) vào hàm handle Add
 * BT2: khi thêm task yêu cầu người dùng phải nhập trên 5 kí tự - bổ sung validation vào
 * BT3: khi nhấn vào đã có id -> gọi tới phương thức mở modal này lên, duyệt qua vòng lặp chứa các phần tử, lấy phần tử có id bằng với id của phần tử được nhấn -> đổ nội dung vào text input
 * BT4: số đếm ở AppBar để đếm số task đang có - bổ sung biến đếm task count
 */
void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = [];
  int taskCount = 0;
  void _handleAddTask (String name) {
    final newItem = DataItems(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(newItem);
      taskCount += 1;
      Navigator.pop(context);
    });
  }
  void _handleDeleteTask (String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
      taskCount -= 1;
    });
  }
  void _handleEditTask (String id) {
    setState(() {
      var item = items.firstWhere((item) => item.id == id);
      print(item);
      showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext content) {
          return ModalBottom(editTask: _handleEditTask, addTask: () => {},);
        },
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Note app - ${taskCount}', style: TextStyle(fontSize: 30, color: Colors.black),),
        backgroundColor: Colors.amber
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: items
              .map((item) => CardBody(
                index : items.indexOf(item),
                item: item ,
                handleDelete: _handleDeleteTask,
                handleEdit: _handleEditTask,
              ))
                .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: (){
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext content) {
                return ModalBottom(addTask : _handleAddTask, editTask: () => {}, );
              },
          );
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}