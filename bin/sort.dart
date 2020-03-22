import 'querySection.dart';
import 'sortDirection.dart';

class Sort implements QuerySection{
  String key;
  SortDiretion sortDirection;

  Sort(String key, SortDiretion sortDirection) {
    this.key = key;
    this.sortDirection = sortDirection;
  }

  @override
  String toQueryString() {
    return 'sort=' + key + ',' + sortDiretionToString();
  }

  String sortDiretionToString() {
    if (sortDirection == SortDiretion.ASC) {
      return 'ASC';
    }
    return 'DESC';
  }
}
