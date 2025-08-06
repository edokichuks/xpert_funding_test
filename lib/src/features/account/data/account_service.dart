// Project imports:
import 'package:xpert_funding_test/src/features/account/domain/models/account_model.dart';

class AccountService {
  static List<AccountModel> getDummyAccounts() {
    return [
      AccountModel(
        id: "123456789FD",
        createdAt: DateTime(2025, 3, 20),
        balance: 6340,
        equity: 7000,
        accountName: "Two Step Challenge",
        currentPhase: 1,
        numPhases: 2,
        size: 5000,
        active: true,
        isProAccount: true,
      ),
      AccountModel(
        id: "987654321AB",
        createdAt: DateTime(2025, 3, 20),
        balance: 6340,
        equity: 8000,
        accountName: "Two Step Challenge",
        currentPhase: 0,
        numPhases: 2,
        size: 25000,
        active: true,
        isProAccount: true,
      ),
      AccountModel(
        id: "1122334455CC",
        createdAt: DateTime(2025, 3, 20),
        balance: 6340,
        equity: 9000,
        accountName: "Two Step Challenge",
        currentPhase: 0,
        numPhases: 2,
        size: 10000,
        active: true,
        isProAccount: true,
      ),
    ];
  }
}
