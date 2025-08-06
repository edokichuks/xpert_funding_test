// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:xpert_funding_test/src/core/utils/theme/theme_notifier/theme_notifier_state.dart';

class ThemeNotifier extends StateNotifier<ThemeNotifierState> {
  ThemeNotifier() : super(ThemeNotifierState.initialState());
  setCurrentTheme({required bool isDarkMode}) {
    state = state.copyWith(
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }

  void resetTheme() {
    state = state.copyWith(
      themeMode: ThemeMode.system,
    ); // Reset to initial state
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeNotifierState>(
  (ref) => ThemeNotifier(),
);
