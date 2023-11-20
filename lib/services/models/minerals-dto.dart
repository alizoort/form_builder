import 'package:json_annotation/json_annotation.dart';

import 'emrc-dto.dart';
part 'minerals-dto.g.dart';
@JsonSerializable()
class MineralsDTO extends EMRCServiceDTO{
  String arabicName;
  String englishName;
  MineralsDTO({required this.arabicName,required this.englishName,required Map<String,String> documentAssociationMap}) : super(documentAssociationMap:documentAssociationMap);
  factory MineralsDTO.fromJson(Map<String,dynamic> json)=> _$MineralsDTOFromJson(json);
  @override
  Map<String,dynamic> toJson()=> _$MineralsDTOToJson(this);
}