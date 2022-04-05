import 'package:dio/dio.dart';
import 'package:lipid/data/models/account.dart';

class AccountsApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://http://154.12.224.72/accounts',
      connectTimeout: 10000,
      receiveTimeout: 6000,
    ),
  );

  Future<Account?> read({required int id}) async {
    Account? retrivedAccount;

    try {
      Response response = await _dio.get<Account>(
        "/users/$id",
      );

      retrivedAccount = Account.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrivedAccount;
  }

  Future<Account?> create({required Account account}) async {
    Account? retrivedAccount;

    try {
      Response response = await _dio.post<Account>(
        '/users',
        data: account.toJson(),
      );

      retrivedAccount = Account.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrivedAccount;
  }

  Future<Account?> update({
    required Account account,
    required String id,
  }) async {
    Account? updatedUser;

    try {
      Response response = await _dio.put(
        '/users/$id',
        data: account.toJson(),
      );

      print('User updated: ${response.data}');

      updatedUser = Account.fromJson(response.data);
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
