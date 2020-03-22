import 'filter.dart';
import 'filterOperation.dart';
import 'pagination.dart';
import 'sortDirection.dart';

class QueryRequest {

  String endpoint;
  List<Filter> filters;
  List<String> projections;
  Pagination pagination;

  QueryRequest(String endpoint) {
    this.endpoint = endpoint;
    filters = [];
    projections = [];
    pagination = Pagination();
  }

  QueryRequest addFilter(String key, FilterOperation operation, String value) {
    filters.add(Filter(key, operation, value));
    return this;
  }

  QueryRequest addFilters(List<Filter> filters) {
    filters.addAll(filters);
    return this;
  }

  QueryRequest removeFilter(String key) {
    filters = filters.where((filter) => filter.key != key).toList();
    return this;
  }

  QueryRequest addProjection(String fieldAlias) {
    projections.add(fieldAlias);
    return this;
  }

  QueryRequest addProjections(List<String> fieldsAlias) {
    projections.addAll(fieldsAlias);
    return this;
  }

  QueryRequest removeProjection(String fieldAlias) {
    projections =
        projections.where((projection) => projection != fieldAlias).toList();
    return this;
  }

  QueryRequest setPage(int page) {
    pagination.setPage(page);
    return this;
  }

  QueryRequest setSize(int size) {
    pagination.setSize(size);
    return this;
  }

  QueryRequest addSortBy(String fieldAlias, SortDiretion diretion) {
    pagination.addSortBy(fieldAlias, diretion);
    return this;
  }

  QueryRequest removeSortBy(String fieldAlias) {
    pagination.removeSortBy(fieldAlias);
    return this;
  }

  String toStringQuery() {
    var queryFilters = filters.map((filter) => filter.toQueryString());

    var filter = queryFilters.join(' and ');
    var projection = projections.join(',');
    var queryParams = [];

    if (filter.isNotEmpty) {
      queryParams.add('filters=' + filter);
    }
    if (projection.isNotEmpty) {
      queryParams.add('projection=' + projection);
    }
    if (pagination != null) {
      queryParams.add(pagination.toQueryString());
    }

    if (queryParams.isNotEmpty) {
      return endpoint + '/query?' + queryParams.join('&');
    }

    return endpoint + '/query';
  }

}
