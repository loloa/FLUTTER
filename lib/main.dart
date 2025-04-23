import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 158, 243),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromRGBO(125, 5, 79, 1),
);

void main() {
  runApp(
    MaterialApp(
      // DARK
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          bodyMedium: TextStyle(
            fontSize: 16,
            color: kDarkColorScheme.onSecondaryContainer,
            fontWeight: FontWeight.normal,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kDarkColorScheme.onPrimaryContainer,
            fontSize: 40,
          ),
        ),
      ),
      // LIGHT
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.secondaryContainer,
          ),
        ),
        // changes for all ui tetxs widgets by default
        textTheme: ThemeData().textTheme.copyWith(
          bodyMedium: TextStyle(
            fontSize: 16,
            color: kColorScheme.onSecondaryContainer,
            fontWeight: FontWeight.normal,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onPrimaryContainer,
            fontSize: 40,
          ),
        ),
      ),

      home: Expenses(),
    ),
  );
}
