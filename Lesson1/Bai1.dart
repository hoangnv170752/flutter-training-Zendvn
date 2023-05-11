void main(List<String> args) {
  List<int> numbers = [100, 20, 30, 40, 50, 88, 22, 12];
  var max = numbers[0];

  for (int i = 0; i < numbers.length; i++) {
    if (max < numbers[i]) {
      max = numbers[i];
    }
  }
  print(max);
}
