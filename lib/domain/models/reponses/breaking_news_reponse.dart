// ignore_for_file: public_member_api_docs, sort_constructors_first
//assets/jsons/response_example.json

import 'package:equatable/equatable.dart';

import 'articles.dart';

class BreakingNewsReponse extends Equatable {
  final String? status;
  final int? totalResults;
  final List<Articles>? articles;
  const BreakingNewsReponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  @override
  List<Object?> get props => [status, totalResults, articles];

  factory BreakingNewsReponse.fromMap(Map<String, dynamic> map) {
    return BreakingNewsReponse(
      status: map['status'] != null ? map['status'] as String : null,
      totalResults:
          map['totalResults'] != null ? map['totalResults'] as int : null,
      articles: map['articles'] != null
          ? List<Articles>.from(
              map['articles'].map<Articles?>(
                (x) => Articles.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  @override
  bool get stringify => true;
}
