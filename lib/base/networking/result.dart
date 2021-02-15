/// createdby Daewu Bintara
/// Friday, 1/22/21

// To parse this JSON data, do
//
//     final result = resultFromMap(jsonString);

import 'dart:convert';

class Result<T> {
  Result({
    this.status,
    this.rc,
    this.text,
    this.messages,
    this.isError = false,
  });

  bool status;
  bool isError;
  var rc;
  String text;
  String messages;

  /// TO PARSE INTO MODEL USE .fromMap()
  T body;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    status: json["status"] == null ? null : json["status"],
    rc: json["rc"] == null ? null : json["rc"],
    text: json["text"] == null ? null : json["text"],
    messages: json["messages"] == null ? null : json["messages"],
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "rc": rc == null ? null : rc,
    "text": text == null ? null : text,
    "messages": messages == null ? null : messages,
  };
}
