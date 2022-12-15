import 'dart:convert';

import 'package:equatable/equatable.dart';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User extends Equatable {
  const User({
    required this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.phone,
    this.socialProvider,
    this.activated,
    this.avatar,
    this.birthDate,
    this.age,
    this.commercialCampaignsSubscribtion,
    this.cityId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.role,
  });

  final String id;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? email;
  final String? phone;
  final String? socialProvider;
  final int? activated;
  final String? avatar;
  final DateTime? birthDate;
  final int? age;
  final int? commercialCampaignsSubscribtion;
  final String? cityId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? role;

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? phone,
    String? socialProvider,
    int? activated,
    String? avatar,
    DateTime? birthDate,
    int? age,
    int? commercialCampaignsSubscribtion,
    String? cityId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    String? role,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        username: username ?? this.username,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        socialProvider: socialProvider ?? this.socialProvider,
        activated: activated ?? this.activated,
        avatar: avatar ?? this.avatar,
        birthDate: birthDate ?? this.birthDate,
        age: age ?? this.age,
        commercialCampaignsSubscribtion: commercialCampaignsSubscribtion ??
            this.commercialCampaignsSubscribtion,
        cityId: cityId ?? this.cityId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        role: role ?? this.role,
      );

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        socialProvider: json['social_provider'],
        activated: json['activated'],
        avatar: json['avatar'],
        birthDate: json['birth_date'] != null
            ? DateTime.parse(json['birth_date'])
            : null,
        age: json['age'],
        commercialCampaignsSubscribtion:
            json['commercial_campaigns_subscribtion'],
        cityId: json['city_id'],
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null,
        deletedAt: json['deleted_at'] != null
            ? DateTime.parse(json['deleted_at'])
            : null,
        // role: json['role']['slug'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'username': username,
        'email': email,
        'phone': phone,
        'social_provider': socialProvider,
        'activated': activated,
        'avatar': avatar,
        'birth_date': birthDate?.toIso8601String(),
        'age': age,
        'commercial_campaigns_subscribtion': commercialCampaignsSubscribtion,
        'city_id': cityId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt?.toIso8601String(),
        // 'role': role,
      };

  @override
  List<Object> get props => [id];
}
