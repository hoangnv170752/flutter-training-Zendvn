void main() {
  List<int> arr = [5, 2, 2, 7, 3, 9, 8, 2, 12, 82, 10];
  if (arr.lastIndexOf(2) > 0) {
    arr[arr.lastIndexOf(2)] = 5;
  }
  print(arr);
}
