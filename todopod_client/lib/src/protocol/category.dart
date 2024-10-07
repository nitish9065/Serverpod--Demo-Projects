/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Category implements _i1.SerializableModel {
  Category._({
    this.id,
    required this.name,
    this.description,
    required this.createdBy,
    required this.createdAt,
  });

  factory Category({
    int? id,
    required String name,
    String? description,
    required int createdBy,
    required DateTime createdAt,
  }) = _CategoryImpl;

  factory Category.fromJson(Map<String, dynamic> jsonSerialization) {
    return Category(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      createdBy: jsonSerialization['createdBy'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? description;

  int createdBy;

  DateTime createdAt;

  Category copyWith({
    int? id,
    String? name,
    String? description,
    int? createdBy,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'createdBy': createdBy,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CategoryImpl extends Category {
  _CategoryImpl({
    int? id,
    required String name,
    String? description,
    required int createdBy,
    required DateTime createdAt,
  }) : super._(
          id: id,
          name: name,
          description: description,
          createdBy: createdBy,
          createdAt: createdAt,
        );

  @override
  Category copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    int? createdBy,
    DateTime? createdAt,
  }) {
    return Category(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
