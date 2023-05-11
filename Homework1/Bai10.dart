void main(List<String> args) {
  List<Map<String, String>> arr = [
    {'name': 'thứ 2'},
    {'name': 'thứ 3'},
    {'name': 'thứ 4'},
    {'name': 'thứ 5'},
    {'name': 'thứ 4'},
    {'name': 'thứ 5'},
    {'name': 'thứ 4'},
    {'name': 'thứ 5'},
    {'name': 'thứ 3'},
  ];
  int length = arr.length;
  print(length);
  for (int i = 0; i < length; i++) {
    if (arr[i]['name'] != 'thứ 2' && arr[i]['name'] != 'thứ 3') {
      arr.removeAt(i);
      length = length - 1;
      i--;
    }
    if (length == i - 1) {
      break;
    }
  }
  print(arr);
}
