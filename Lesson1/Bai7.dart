void main(List<String> args) {
  List<int> numbers = [5, 2, 7, 3, 9, 8];
  numbers.sort((b, a) => a.compareTo(b));
  print(numbers);
  for (int i = 0; i < numbers.length; i++) {
    print(numbers[i] * 2);
  }
}
