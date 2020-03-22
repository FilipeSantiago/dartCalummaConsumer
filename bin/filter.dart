import 'querySection.dart';
import 'filterOperation.dart';

class Filter implements QuerySection {
  String key;
  FilterOperation operation;
  String value;

  Filter(String key, FilterOperation operation, String value) {
    this.key = key;
    this.operation = operation;
    this.value = value;
  }

  @override
  String toQueryString() {
    return key + operatorToString() + value;
  }

  String operatorToString() {
    switch (operation) {
      case FilterOperation.EQUALITY:
        return '__eq__';
        break;
      case FilterOperation.NEGATION:
        return '__ne__';
        break;
      case FilterOperation.GREATER_THAN:
        return '__gt__';
        break;
      case FilterOperation.LESS_THAN:
        return '__lt__';
        break;
      case FilterOperation.LIKE:
        return '__like__';
        break;
      case FilterOperation.IN:
        return '__in__';
        break;
    }

    return '__eq__';
  }
}
