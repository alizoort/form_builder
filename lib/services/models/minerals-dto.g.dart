// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minerals-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MineralsDTO _$MineralsDTOFromJson(Map<String, dynamic> json) => MineralsDTO(
      arabicName: json['arabicName'] as String,
      englishName: json['englishName'] as String,
      documentAssociationMap:
          Map<String, String>.from(json['documentAssociationMap'] as Map),
    );

Map<String, dynamic> _$MineralsDTOToJson(MineralsDTO instance) =>
    <String, dynamic>{
      'documentAssociationMap': instance.documentAssociationMap,
      'arabicName': instance.arabicName,
      'englishName': instance.englishName,
    };
