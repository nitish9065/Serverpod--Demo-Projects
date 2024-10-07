import 'package:serverpod/serverpod.dart';
import 'package:todopod_server/src/extensions/nullable_extension.dart';
import 'package:todopod_server/src/generated/protocol.dart';
import 'package:todopod_server/src/services/auth_service.dart';

class CategoryEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<int> createCategory(
    Session session, {
    required String name,
    String? desc,
  }) async {
    try {
      final userId = await AuthService.currentUserId(session);
      var category = Category(
        name: name,
        createdBy: userId,
        createdAt: DateTime.now(),
      );
      category = await Category.db.insertRow(session, category);

      return category.id.orElseThrow(
        readableMessage: 'Failed to create category.',
        serverMessage: 'Category insertion to db failed.',
        statusCode: 500,
      );
    } on AppException catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      throw AppException(
        readableMessage: 'Error occurred while creating category.',
        serverMessage: error.toString(),
        statusCode: 500,
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<Category> findById(Session session, int id) async {
    final category = await Category.db.findById(session, id);

    return category.orElseThrow(
      readableMessage: 'Failed to fetch category with id $id',
      serverMessage: 'Category model not found in db with given id $id',
      statusCode: 404,
    );
  }

  Future<bool> deleteCategory(Session session, int categoryId) async {
    try {
      final userId = await AuthService.currentUserId(session);
      final category = await findById(session, categoryId);
      if (category.createdBy != userId) {
        throw AppException(
          readableMessage: 'Not Authorized to delete this category.',
          serverMessage: 'Tried to delete someone else category model',
          statusCode: 403,
        );
      }
      await Category.db.deleteRow(session, category);
      return true;
    } on AppException catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      throw AppException(
        readableMessage: 'Error occurred while deleting category.',
        serverMessage: error.toString(),
        statusCode: 500,
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<List<Category>> fetchCategoriesByUserId(Session session) async {
    try {
      final userId = await AuthService.currentUserId(session);
      return await Category.db.find(
        session,
        where: (catRow) => catRow.createdBy.equals(
          userId,
        ),
      );
    } on AppException catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      throw AppException(
        readableMessage: 'Error occurred while creating category.',
        serverMessage: error.toString(),
        statusCode: 500,
        stackTrace: stackTrace.toString(),
      );
    }
  }
}
