void main(List<String> args) {
  List<int> arr = [2, 3, 2, 2, 5, 2, 6, 7, 2, 10, 221];

  final result = arr.where((item) => (item == 2)).toList();

  print("Số lần xuấtt hiện của số 2 là: ${result.length}");
}
