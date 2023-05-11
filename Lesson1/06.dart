void main(List<String> args) {
  List<int> numbers = [3, 6, 8, 1, 2, 12, 22, 5, 11];
  numbers.sort();
  var result = numbers.firstWhere((element) => element > 8);
  print(result);
}
