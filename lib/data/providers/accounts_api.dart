import 'package:dio/dio.dart';
import 'package:lipid/data/models/user.dart';

class AccountsApi {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://lipidadmin.com/api", headers: {
    'Content-Type': 'application/json',
    'Accept': "application/json",
  }));

  Future<Map<String, dynamic>> create({required User user}) async {
    Map<String, dynamic> retrivedUser = {};

    try {
      Response response = await _dio.post(
        '/accounts',
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

  Future<Map<String, dynamic>> read() async {
    dynamic retrivedUser;

    try {
      Response response = await _dio.get(
        '/accounts',
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
        '/accounts',
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
      await _dio.delete('/accounts/$id');
      print('User deleted!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
