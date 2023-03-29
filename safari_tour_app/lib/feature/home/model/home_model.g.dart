// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      count: json['count'] as int?,
      next: json['next'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Tour.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'results': instance.results,
    };
