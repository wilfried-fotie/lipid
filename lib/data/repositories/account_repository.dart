import 'package:lipid/data/models/account.dart';
import 'package:lipid/data/providers/accounts_api.dart';

class AccountRepository {
  final AccountsApi api = AccountsApi();

  Future<Account?> getAccount(int id) async {
    Map<String, dynamic> data = await api.read();

    return Account.fromMap(data["data"]);
  }
}
