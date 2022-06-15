import 'package:future_ex/constants/todo_enum.dart';

class TodoModel {
  final int id;
  final String name;
  final String detail;
  final String priority;
  final String dead_line;
  final String status;
  final String created_at;
  final String updated_at;

  const TodoModel(
      {required this.id,
      required this.name,
      required this.detail,
      required this.priority,
      required this.dead_line,
      required this.status,
      required this.created_at,
      required this.updated_at});

      factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      name: json['name'],
      detail: json['detail'],
      priority: json['priority'],
      dead_line: json['dead_line'],
      status: json['status'],
      created_at: json['created_at'],
      updated_at: json['created_at']

    );
  }
}
