import 'querySection.dart';
import 'sort.dart';
import 'sortDirection.dart';

class Pagination implements QuerySection {
  int page;
  int size;
  List<Sort> sortBy;

  Pagination() {
    page = 0;
    size = 10;
    sortBy = [];
  }

  Pagination.PageAndSize(int page, int size) {
    this.page = page;
    this.size = size;
    sortBy = [];
  }

  Pagination setPage(int page) {
    this.page = page;
    return this;
  }

  Pagination setSize(int size) {
    this.size = size;
    return this;
  }

  Pagination addSortBy(String fieldAlias, SortDiretion diretion) {
    sortBy.add(Sort(fieldAlias, diretion));
    return this;
  }

  Pagination removeSortBy(String fieldAlias) {
    sortBy = sortBy.where((sort) => sort.key != fieldAlias);
    return this;
  }

  @override
  String toQueryString() {
    var queryString = [];

    if (page >= 0) {
      queryString.add('page=' + page.toString());
    }
    if (size > 0) {
      queryString.add('size=' + size.toString());
    }
    if (sortBy.isNotEmpty) {
      var sortQuery = sortBy.map((sort) => sort.toQueryString());
      queryString.add(sortQuery.join('&'));
    }

    return queryString.join('&');
  }
}
