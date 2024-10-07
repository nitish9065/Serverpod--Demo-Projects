import 'package:serverpod/serverpod.dart';
import 'package:todopod_server/src/extensions/nullable_extension.dart';
import 'package:todopod_server/src/generated/protocol.dart';
import 'package:todopod_server/src/services/auth_service.dart';

class TaskEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<Task>> fetchTask(Session session,
      {required int limit, required int offset}) async {
    try {
      final currentUserId = await AuthService.currentUserId(session);
      final tasks = await Task.db.find(
        session,
        where: (taskRow) => taskRow.createdBy.equals(
          currentUserId,
        ),
        limit: limit,
        offset: offset,
        orderBy: (t) => t.createdAt,
        orderDescending: true,
      );
      return tasks;
    } on AppException catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      throw AppException(
        readableMessage: 'Error occurred while fetching tasks.',
        serverMessage: error.toString(),
        statusCode: 500,
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<int> createTask(Session session,
      {required String title, String? desc, required int categoryId}) async {
    try {
      final currentUserId = await AuthService.currentUserId(session);
      var task = Task(
        title: title,
        description: desc ?? '',
        categoryId: categoryId,
        createdBy: currentUserId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      task = await Task.db.insertRow(session, task);
      return task.id.orElseThrow(
        readableMessage: 'Error occurred while creating tasks.',
        serverMessage: 'Id not found after creating task',
        statusCode: 500,
      );
    } on AppException catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      throw AppException(
        readableMessage: 'Error occurred while creating tasks.',
        serverMessage: error.toString(),
        statusCode: 500,
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<bool> updateTask(Session session,
      {required int taskId,
      required String title,
      String? desc,
      required int categoryId}) async {
    try {
      final currentUserId = await AuthService.currentUserId(session);
      var task = await findById(session, taskId);
      if (task.createdBy != currentUserId) {
        throw AppException(
          readableMessage: 'Not Authorized to update this task.',
          serverMessage: 'Tried to update someone else task model',
          statusCode: 403,
        );
      }
      await Task.db.updateRow(
        session,
        task.copyWith(
          title: title,
          description: desc,
          categoryId: categoryId,
        ),
      );

      return true;
    } on AppException catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      throw AppException(
        readableMessage: 'Error occurred while updating task with id $taskId.',
        serverMessage: error.toString(),
        statusCode: 500,
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<bool> deleteTask(Session session, int taskId) async {
    try {
      final userId = await AuthService.currentUserId(session);
      final task = await findById(session, taskId);
      if (task.createdBy != userId) {
        throw AppException(
          readableMessage: 'Not Authorized to delete this task.',
          serverMessage: 'Tried to delete someone else task model',
          statusCode: 403,
        );
      }
      await Task.db.deleteRow(session, task);
      return true;
    } on AppException catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      throw AppException(
        readableMessage: 'Error occurred while deleting task with id $taskId.',
        serverMessage: error.toString(),
        statusCode: 500,
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<Task> findById(Session session, int id) async {
    final task = await Task.db.findById(session, id);

    return task.orElseThrow(
      readableMessage: 'Failed to fetch task with id $id',
      serverMessage: 'Task model not found in db with given id $id',
      statusCode: 404,
    );
  }
}
