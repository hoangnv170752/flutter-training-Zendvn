void main(List<String> args) {
  List<int> numbers = [2, 3, 4, 5, 7, 8];
  int sum = 0;
  for (int i = 0; i < numbers.length; i++) {
    sum += numbers[i];
  }
  int count = numbers.length;
  double average = sum / count;
  print(average);
  for (int j = 0; j < count; j++) {
    for (int m = 1; m < count; m++) {
      if (numbers[m] + numbers[j] == 9) {
        print(numbers[m]);
        print("cong voi");
        print(numbers[j]);
        print("tong la 9");
      }
    }
  }
}
