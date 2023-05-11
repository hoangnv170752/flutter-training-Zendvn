void main(List<String> args) {
  List<int> numbers = [2, 3, 4, 5, 7, 8];
  int count = numbers.length;
  for (int j = 0; j < count; j++) {
    for (int m = j + 1; m < count; m++) {
      if (numbers[m] + numbers[j] == 9) {
        print("${numbers[m]} cong voi ${numbers[j]} tong la 9");
      }
    }
  }
}
