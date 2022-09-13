import 'dart:convert';

class SearchApiResponse {
  int total;
  int totalHits;
  List<SearchResults>? searchResults;

  SearchApiResponse(
      {required this.searchResults,
      required this.total,
      required this.totalHits});

  factory SearchApiResponse.fromJson(String str) =>
      SearchApiResponse.fromJson(json.decode(str));

  factory SearchApiResponse.fromMap(
          Map<String, dynamic> json) =>
      SearchApiResponse(
          searchResults: json['hits'] == null
              ? null
              : List<SearchResults>.from(
                  json['hits'].map((x) => SearchResults.fromMap(x))),
          total: json['total'],
          totalHits: json['totalHits']);
}

class SearchResults {
  int? id;
  String? previewUrl;
  String? webformatURL;
  String? largeUrl;

  SearchResults(
      {required this.largeUrl,
      required this.id,
      required this.previewUrl,
      required this.webformatURL});

  factory SearchResults.fromMap(Map<String, dynamic> json) => SearchResults(
      id: json["id"] == null ? null : json['id'],
      previewUrl: json["previewURL"] == null ? null : json['previewURL'],
      largeUrl: json["largeImageURL"] == null ? null : json['largeImageURL'],
      webformatURL: json["webformatURL"] == null ? null : json['webformatURL']);
}
