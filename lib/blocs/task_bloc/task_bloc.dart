import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:todo_list_firebase/models/task.dart';

part 'task_state.dart';
part 'task_event.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  FutureOr<void> _onAddTask(
    AddTask event,
    Emitter<TaskState> emit,
  ) async {
    final state = this.state;
    emit(
      TaskState(
        allTasks: List.from(state.allTasks)..add(event.task),
        removedTasks: state.removedTasks,
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

    emit(TaskState(
      allTasks: allTasks,
      removedTasks: state.removedTasks,
    ));
  }

  FutureOr<void> _onDeleteTask(
    DeleteTask event,
    Emitter<TaskState> emit,
  ) async {
    final task = event.task;

    emit(TaskState(
      allTasks: List.from(state.allTasks)..add(task.copyWith(isDeleted: false)),
      removedTasks: List.from(state.removedTasks)..remove(task),
    ));
  }

  FutureOr<void> _onRemoveTask(
    RemoveTask event,
    Emitter<TaskState> emit,
  ) {
    emit(
      TaskState(
        allTasks: List.from(state.allTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true)),
      ),
    );
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) => TaskState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(TaskState state) => state.toMap();
}
