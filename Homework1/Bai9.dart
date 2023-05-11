void main(List<String> args) {
  var object1 = [
    {'name': 'Nguyen van A'},
    {'name': 'Nguyen van B'},
    {'name': 'Nguyen van C'}
  ];
  var object2 = [
    {'name': 'Nguyen van C'},
    {'name': 'Nguyen van D'},
    {'name': 'Nguyen van E'}
  ];
  print(object1.length);
  for (int i = 0; i < object1.length; i++) {
    for (int j = 0; j < object2.length; j++) {
      if (object1[i]['name'] == object2[j]['name']) {
        print("${object1[i]} " +
            'vi tri ${i} day 1' +
            ' giong voi ' +
            "${object2[j]} " +
            'vi tri ${j} day 2');
      }
    }
  }
}
