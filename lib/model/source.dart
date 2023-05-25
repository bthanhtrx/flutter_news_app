import 'package:freezed_annotation/freezed_annotation.dart';

part 'source.freezed.dart';
part 'source.g.dart';

@freezed
class Source with _$Source{
  // final int? id;
  // final String? name;

  factory Source({required int? id, required String? name}) = _Source;
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);


}
