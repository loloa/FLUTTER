import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Expense({required this.title, required this.amount, required this.date})
    : id = uuid.v4();

  @override
  String toString() {
    return 'Expense(id: $id, title: $title, amount: $amount, date: $date, category: $category)';
  }
}
