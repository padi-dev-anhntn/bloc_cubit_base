part of 'app_cubit.dart';

class AppState extends Equatable {
  final LoadStatus loadDataStatus;

  const AppState({
    this.loadDataStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  AppState copyWith({
    LoadStatus? loadDataStatus,
  }) {
    return AppState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
    );
  }
}
