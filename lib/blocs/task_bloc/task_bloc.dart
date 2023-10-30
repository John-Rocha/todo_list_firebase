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
    on<FavoriteTask>(_onFavoriteTask);
  }

  FutureOr<void> _onAddTask(
    AddTask event,
    Emitter<TaskState> emit,
  ) async {
    final state = this.state;
    emit(
      TaskState(
        pendingTasks: List.from(state.pendingTasks)..add(event.task),
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: state.removedTasks,
      ),
    );
  }

  FutureOr<void> _onUpdateTask(
    UpdateTask event,
    Emitter<TaskState> emit,
  ) async {
    final task = event.task;

    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favoriteTasks = state.favoriteTasks;

    task.isDone == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(task),
            favoriteTasks = List.from(favoriteTasks)..remove(task),
            completedTasks = List.from(completedTasks)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            completedTasks = List.from(completedTasks)..remove(task),
            favoriteTasks = List.from(favoriteTasks)..remove(task),
            pendingTasks = List.from(pendingTasks)
              ..insert(0, task.copyWith(isDone: false)),
          };

    emit(TaskState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      favoriteTasks: state.favoriteTasks,
      removedTasks: state.removedTasks,
    ));
  }

  FutureOr<void> _onDeleteTask(
    DeleteTask event,
    Emitter<TaskState> emit,
  ) async {
    final task = event.task;

    emit(TaskState(
      pendingTasks: List.from(state.pendingTasks)
        ..add(task.copyWith(isDeleted: false)),
      completedTasks: state.completedTasks,
      favoriteTasks: state.favoriteTasks,
      removedTasks: List.from(state.removedTasks)..remove(task),
    ));
  }

  FutureOr<void> _onRemoveTask(
    RemoveTask event,
    Emitter<TaskState> emit,
  ) {
    emit(
      TaskState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        completedTasks: List.from(state.completedTasks)..remove(event.task),
        favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true)),
      ),
    );
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) => TaskState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(TaskState state) => state.toMap();

  FutureOr<void> _onFavoriteTask(
    FavoriteTask event,
    Emitter<TaskState> emit,
  ) {
    final state = this.state;
    emit(
      TaskState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: List.from(state.favoriteTasks)..add(event.task),
        removedTasks: state.removedTasks,
      ),
    );
  }
}
