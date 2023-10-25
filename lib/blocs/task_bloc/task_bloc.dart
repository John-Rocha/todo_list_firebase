import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:todo_list_firebase/blocs/task_bloc/task_event.dart';
import 'package:todo_list_firebase/models/task.dart';

part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  FutureOr<void> _onAddTask(
    AddTask event,
    Emitter<TaskState> emit,
  ) async {
    final state = this.state;
    emit(
      TaskState(
        allTasks: List.from(state.allTasks)..add(event.task),
      ),
    );
  }

  FutureOr<void> _onUpdateTask(
    UpdateTask event,
    Emitter<TaskState> emit,
  ) async {
    final task = event.task;

    final index = state.allTasks.indexOf(task);

    List<Task> allTasks = [...state.allTasks]..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TaskState(allTasks: allTasks));
  }

  FutureOr<void> _onDeleteTask(
    DeleteTask event,
    Emitter<TaskState> emit,
  ) async {
    final task = event.task;

    emit(TaskState(allTasks: List.from(state.allTasks)..remove(task)));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) => TaskState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(TaskState state) => state.toMap();
}
