import 'package:flutter/material.dart';

import '../services/service_class.dart';
import 'data_model.dart';

class DataClass extends ChangeNotifier {
  late List<DataModel?> post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = (await getCategory())!;
    loading = false;

    notifyListeners();
  }
}
