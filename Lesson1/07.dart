void main(List<String> args) {
  List<int> arr = [5, 2, 7, 3, 9, 8];

  arr.sort((num1, num2) => num2.compareTo(num1));
  List<int> result = arr.map((i) => i * 2).toList();
  print(result);
}
