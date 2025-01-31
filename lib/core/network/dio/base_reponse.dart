class BaseResponse {
  BaseResponse({this.statusCode, this.message, this.data});

  final int? statusCode;
  final String? message;
  final dynamic data;

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        statusCode: json['statusCode'],
        message: json['message'],
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'message': message,
        'data': data,
      };
}