// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyData _$CompanyDataFromJson(Map<String, dynamic> json) => CompanyData(
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
      companyNationalIdNumber: json['companyNationalIdNumber'] as int,
      taxNumber: json['taxNumber'] as int,
      registrationNumber: json['registrationNumber'] as int,
      registrationDate: json['registrationDate'] as String,
      companyPhoneNumber: json['companyPhoneNumber'] as String,
      representativeType: json['representativeType'] as String,
      representativeName: json['representativeName'] as String,
      representativeIsJordanian: json['representativeIsJordanian'] as bool,
      representativeNationalId: json['representativeNationalId'] as int,
      representativeResidentId: json['representativeResidentId'] as int,
      representativeMobileNumber: json['representativeMobileNumber'] as String,
      companyTypeId: json['companyTypeId'] as int,
    );

Map<String, dynamic> _$CompanyDataToJson(CompanyData instance) =>
    <String, dynamic>{
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'companyNationalIdNumber': instance.companyNationalIdNumber,
      'taxNumber': instance.taxNumber,
      'registrationNumber': instance.registrationNumber,
      'registrationDate': instance.registrationDate,
      'companyPhoneNumber': instance.companyPhoneNumber,
      'representativeType': instance.representativeType,
      'representativeName': instance.representativeName,
      'representativeIsJordanian': instance.representativeIsJordanian,
      'representativeNationalId': instance.representativeNationalId,
      'representativeResidentId': instance.representativeResidentId,
      'representativeMobileNumber': instance.representativeMobileNumber,
      'companyTypeId': instance.companyTypeId,
    };
