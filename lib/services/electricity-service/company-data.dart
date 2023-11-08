import 'package:json_annotation/json_annotation.dart';
part 'company-data.g.dart';
@JsonSerializable()
class CompanyData {
  CompanyData({
    required this.nameAr,
    required this.nameEn,
    required this.companyNationalIdNumber,
    required this.taxNumber,
    required this.registrationNumber,
    required this.registrationDate,
    required this.companyPhoneNumber,
    required this.representativeType,
    required this.representativeName,
    required this.representativeIsJordanian,
    required this.representativeNationalId,
    required this.representativeResidentId,
    required this.representativeMobileNumber,
    required this.companyTypeId
});
  String nameAr;
  String nameEn;
  int companyNationalIdNumber;
  int taxNumber;
  int registrationNumber;
  String registrationDate;
  String companyPhoneNumber;
  String representativeType;
  String representativeName;
  bool representativeIsJordanian;
  int representativeNationalId;
  int representativeResidentId;
  String representativeMobileNumber;
  int companyTypeId;
  factory CompanyData.fromJson(Map<String,dynamic> json)=> _$CompanyDataFromJson(json);
  Map<String,dynamic> toJson()=> _$CompanyDataToJson(this);
}