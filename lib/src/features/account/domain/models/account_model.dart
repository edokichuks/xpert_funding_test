import 'package:equatable/equatable.dart';

class AccountModel extends Equatable {
  final dynamic id;
  final dynamic createdAt;
  final dynamic balance;
  final dynamic equity;
  final dynamic accountName;
  final dynamic currentPhase;
  final dynamic numPhases;
  final dynamic size;
  final dynamic active;
  final dynamic isProAccount;

  const AccountModel({
    this.id,
    this.createdAt,
    this.balance,
    this.equity,
    this.accountName,
    this.currentPhase,
    this.numPhases,
    this.size,
    this.active,
    this.isProAccount,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
    id: json['id'] as dynamic,
    createdAt: json['createdAt'] as dynamic,
    balance: json['balance'] as dynamic,
    equity: json['equity'] as dynamic,
    accountName: json['accountName'] as dynamic,
    currentPhase: json['currentPhase'] as dynamic,
    numPhases: json['numPhases'] as dynamic,
    size: json['size'] as dynamic,
    active: json['active'] as dynamic,
    isProAccount: json['isProAccount'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt,
    'balance': balance,
    'equity': equity,
    'accountName': accountName,
    'currentPhase': currentPhase,
    'numPhases': numPhases,
    'size': size,
    'active': active,
    'isProAccount': isProAccount,
  };

  AccountModel copyWith({
    dynamic id,
    dynamic createdAt,
    dynamic balance,
    dynamic equity,
    dynamic accountName,
    dynamic currentPhase,
    dynamic numPhases,
    dynamic size,
    dynamic active,
    dynamic isProAccount,
  }) {
    return AccountModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      balance: balance ?? this.balance,
      equity: equity ?? this.equity,
      accountName: accountName ?? this.accountName,
      currentPhase: currentPhase ?? this.currentPhase,
      numPhases: numPhases ?? this.numPhases,
      size: size ?? this.size,
      active: active ?? this.active,
      isProAccount: isProAccount ?? this.isProAccount,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      createdAt,
      balance,
      equity,
      accountName,
      currentPhase,
      numPhases,
      size,
      active,
      isProAccount,
    ];
  }
}
