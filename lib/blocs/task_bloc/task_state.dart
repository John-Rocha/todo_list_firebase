part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> allTasks;
  final List<Task> removedTasks;

  const TaskState({
    this.allTasks = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "allTasks": allTasks.map((x) => x.toMap()).toList(),
      "removedTasks": removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      allTasks: List<Task>.from(map["allTasks"].map((x) => Task.fromMap(x))),
      removedTasks:
          List<Task>.from(map["removedTasks"].map((x) => Task.fromMap(x))),
    );
  }
}
