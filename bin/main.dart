import 'filterOperation.dart';
import 'queryRequest.dart';
import 'sortDirection.dart';
import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) async {
  var base_url = 'http://localhost:8080/';
  var request = QueryRequest('tourmarketplace');

  request.addFilter('id', FilterOperation.EQUALITY, '1')
         .addFilter('title', FilterOperation.LIKE, 'açucar')
         .addProjections(['id', 'title', 'description']);

  request.removeFilter('id');
  request.addSortBy('title', SortDiretion.ASC);

  var requestMaker = await HttpClient().getUrl(Uri.parse(base_url + request.toStringQuery()));
  var response = await requestMaker.close(); 

  await for (var contents in response.transform(Utf8Decoder())) {
    print(contents);
  }
}
