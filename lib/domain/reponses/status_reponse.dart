class StatusResponse {
  final bool? error;
  final int? code;
  final String? type;
  final dynamic message;

  StatusResponse({this.error, this.code, this.type, this.message});

  factory StatusResponse.fromJson(Map<String, dynamic> json) {
    return StatusResponse(
      error: json['error'] != null ? json['error'] as bool : null,
      code: json['code'] != null ? json['code'] as int : null,
      type: json['type'] != null ? json['type'] as String : null,
      message: json['message'] != null ? json['message'] as dynamic : null,
    );
  }
}
