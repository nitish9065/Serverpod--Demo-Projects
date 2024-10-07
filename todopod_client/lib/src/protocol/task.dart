/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Task implements _i1.SerializableModel {
  Task._({
    this.id,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Task({
    int? id,
    required String title,
    required String description,
    required int categoryId,
    required int createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TaskImpl;

  factory Task.fromJson(Map<String, dynamic> jsonSerialization) {
    return Task(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      categoryId: jsonSerialization['categoryId'] as int,
      createdBy: jsonSerialization['createdBy'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String description;

  int categoryId;

  int createdBy;

  DateTime createdAt;

  DateTime updatedAt;

  Task copyWith({
    int? id,
    String? title,
    String? description,
    int? categoryId,
    int? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'categoryId': categoryId,
      'createdBy': createdBy,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskImpl extends Task {
  _TaskImpl({
    int? id,
    required String title,
    required String description,
    required int categoryId,
    required int createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          title: title,
          description: description,
          categoryId: categoryId,
          createdBy: createdBy,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Task copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    int? categoryId,
    int? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Task(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
