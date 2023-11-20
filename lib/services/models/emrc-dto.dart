import 'package:json_annotation/json_annotation.dart';
part 'emrc-dto.g.dart';
@JsonSerializable()
class EMRCServiceDTO {
  Map<String,String> documentAssociationMap;
  EMRCServiceDTO({required this.documentAssociationMap});
  factory EMRCServiceDTO.fromJson(Map<String,dynamic> json)=> _$EMRCServiceDTOFromJson(json);
  Map<String,dynamic> toJson()=> _$EMRCServiceDTOToJson(this);
}