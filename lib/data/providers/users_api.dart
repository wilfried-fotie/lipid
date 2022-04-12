import 'package:dio/dio.dart';
import 'package:lipid/data/models/user.dart';

class UsersApi {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://lipidadmin.com/api", headers: {
    'Content-Type': 'application/json',
    'Accept': "application/json",
  }));

  Future<Map<String, dynamic>> create({required User user}) async {
    Map<String, dynamic> retrivedUser = {};

    try {
      Response response = await _dio.post(
        '/users',
        data: user.toMap(),
      );

      retrivedUser = response.data;

      print(retrivedUser);
    } on DioError {
      throw Exception("data error");
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrivedUser;
  }

  Future<Map<String, dynamic>> login(
      {required Map<String, dynamic> map}) async {
    Map<String, dynamic> retrivedUser = {};

    try {
      Response response = await _dio.post(
        '/auth/login',
        data: map,
      );

      retrivedUser = response.data;
    } on DioError {
      throw Exception("data error");
    } catch (e) {
      throw Exception("data error");
    }

    return retrivedUser;
  }

  Future<Map<String, dynamic>> read() async {
    dynamic retrivedUser;

    try {
      Response response = await _dio.get(
        '/users',
      );

      retrivedUser = response.data;

      print(retrivedUser);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrivedUser;
  }

  Future<User?> update({
    required User user,
    required String id,
  }) async {
    User? updatedUser;

    try {
      Response response = await _dio.put(
        '/users',
        data: user.toJson(),
      );

      print('User updated: ${response.data}');

      updatedUser = User.fromJson(response.data);
    } catch (e) {
      print('Error updating user: $e');
    }

    return updatedUser;
  }

  Future<void> delete({required String id}) async {
    try {
      await _dio.delete('/users/$id');
      print('User deleted!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _dio.post('/auth/login');
      print('User deleted!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
