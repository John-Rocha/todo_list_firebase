// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  bool? isDone;
  bool? isDeleted;

  Task({
    required this.title,
    this.isDone = false,
    this.isDeleted = false,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "title": title,
      "isDone": isDone,
      "isDeleted": isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map["title"] ?? '',
      isDone: map["isDone"] ?? false,
      isDeleted: map["isDeleted"] ?? false,
    );
  }

  @override
  String toString() =>
      'Task(title: $title, isDone: $isDone, isDeleted: $isDeleted)';

  Task copyWith({
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [title, isDone, isDeleted];
}
