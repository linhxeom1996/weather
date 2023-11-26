import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final String? id;
  final String? name;
  const Source({
    this.id,
    this.name,
  });
  
  @override
  List<Object?> get props => [id, name];

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  @override
  bool get stringify => true;
}
