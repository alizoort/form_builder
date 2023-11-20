// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emrc-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EMRCServiceDTO _$EMRCServiceDTOFromJson(Map<String, dynamic> json) =>
    EMRCServiceDTO(
      documentAssociationMap:
          Map<String, String>.from(json['documentAssociationMap'] as Map),
    );

Map<String, dynamic> _$EMRCServiceDTOToJson(EMRCServiceDTO instance) =>
    <String, dynamic>{
      'documentAssociationMap': instance.documentAssociationMap,
    };
