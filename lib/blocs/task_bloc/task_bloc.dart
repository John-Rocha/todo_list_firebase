import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_firebase/blocs/task_bloc/task_event.dart';
import 'package:todo_list_firebase/models/task.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
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
    final state = this.state;
    final task = event.task;

    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.add(task.copyWith(isDone: true))
        : allTasks.add(task.copyWith(isDone: false));

    emit(TaskState(allTasks: allTasks));
  }

  FutureOr<void> _onDeleteTask(
    DeleteTask event,
    Emitter<TaskState> emit,
  ) async {}
}
