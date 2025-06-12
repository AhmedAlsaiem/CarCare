int convertStringNumbersToOneIntNumber({
  required String n1,
  required String n2,
  required String n3,
  required String n4,
}) {
  int stringToInt({required String number}) {
    print('ggggggggggggooooooooooooolllllllll$number');
    if (number.isNotEmpty) {
      return int.parse(number);
    } else {
      return 1;
    }
  }

  int one, two = 0, three = 0, four = 0;

  one = stringToInt(number: n1);
  two = stringToInt(number: n2);
  three = stringToInt(number: n3);
  four = stringToInt(number: n4);

  int number;
  number = one * 1000 + two * 100 + three * 10 + four;
  return number;
}
