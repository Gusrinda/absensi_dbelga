// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../utils/constants/nums.dart';
import '../../../utils/constants/strings.dart';

class BreakingNewsRequest {
  final String apiKey;
  final String country;
  final String category;
  final int page;
  final int pagesize;

  BreakingNewsRequest({
    this.apiKey = defaultApiKey,
    this.country = 'us',
    this.category = 'general',
    this.page = 1,
    this.pagesize = defaultPageSize,
  });

  BreakingNewsRequest copyWith({
    String? apiKey,
    String? country,
    String? category,
    int? page,
    int? pagesize,
  }) {
    return BreakingNewsRequest(
      apiKey: apiKey ?? this.apiKey,
      country: country ?? this.country,
      category: category ?? this.category,
      page: page ?? this.page,
      pagesize: pagesize ?? this.pagesize,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apiKey': apiKey,
      'country': country,
      'category': category,
      'page': page,
      'pagesize': pagesize,
    };
  }

  factory BreakingNewsRequest.fromMap(Map<String, dynamic> map) {
    return BreakingNewsRequest(
      apiKey: map['apiKey'] as String,
      country: map['country'] as String,
      category: map['category'] as String,
      page: map['page'] as int,
      pagesize: map['pagesize'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BreakingNewsRequest.fromJson(String source) => BreakingNewsRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BreakingNewsRequest(apiKey: $apiKey, country: $country, category: $category, page: $page, pagesize: $pagesize)';
  }

  @override
  bool operator ==(covariant BreakingNewsRequest other) {
    if (identical(this, other)) return true;
  
    return 
      other.apiKey == apiKey &&
      other.country == country &&
      other.category == category &&
      other.page == page &&
      other.pagesize == pagesize;
  }

  @override
  int get hashCode {
    return apiKey.hashCode ^
      country.hashCode ^
      category.hashCode ^
      page.hashCode ^
      pagesize.hashCode;
  }
}
