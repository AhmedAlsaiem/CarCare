

String handleFilterTyps({required int index}) {
  switch (index) {
    case 1:
      return 'all';
    case 2:
      return 'week';
    case 3:
      return 'month';
    case 4:
      return 'year';

    default:
      return '';
  }
}
