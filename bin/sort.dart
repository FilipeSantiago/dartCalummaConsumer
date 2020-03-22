import 'sortDirection.dart';

class Sort {
  String key;
  SortDiretion sortDirection;

  Sort(String key, SortDiretion sortDirection) {
    this.key = key;
    this.sortDirection = sortDirection;
  }

  String toStringQuery() {
    return 'sort=' + key + ',' + sortDiretionToString();
  }

  String sortDiretionToString() {
    if (sortDirection == SortDiretion.ASC) {
      return 'ASC';
    }
    return 'DESC';
  }
}
