import 'package:lipid/data/models/account.dart';
import 'package:lipid/data/providers/accounts_api.dart';

class AccountRepository {
  final AccountsApi api = AccountsApi();

  Future<Account?> getAccount(int id) async {
    Account? data = await api.read(id: 1);
    return data;
  }

  Future<Account?> createAccount(Account account) async {
    Account? data = await api.create(account: account);
    return data;
  }
}
