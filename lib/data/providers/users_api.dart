import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lipid/data/models/user.dart';
import 'package:lipid/option.dart';

class UsersApi {
  final Dio _dio = Dio();
  final Options _options = Options(headers: AppOption.params);

  // Future<User?> read({required int id}) async {
  //   User? retrivedUser = await _dio.get(
  //       "/users/$id",
  //     );

  //     retrivedUser = User.fromJson(response.data);
  //   } catch (e) {
  //     print('Error creating user: $e');
  //   }

  //   return retrivedUser;
  // }

  Future<dynamic> read() async {
    dynamic retrivedUser;

    try {
      Response response =
          await _dio.get('http://154.12.224.72/api/users', options: _options);

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
}
