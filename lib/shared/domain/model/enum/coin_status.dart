import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum CoinStatus {
  @JsonValue('BREAK')
  breaking,
  halt,
  trading,
}
