void main(List<String> args) {
  List<int> arr = [5, 2, 2, 7, 3, 9, 8, 2, 12, 82, 10];
  List<int> replacement = [2, 2];
  print(arr.length);
  arr.replaceRange(arr.length - 2, arr.length, replacement);
  print(arr);
}
