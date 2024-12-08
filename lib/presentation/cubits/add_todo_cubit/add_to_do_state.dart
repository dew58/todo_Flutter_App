part of 'add_to_do_cubit.dart';

sealed class AddToDoState extends Equatable {
  const AddToDoState();

  @override
  List<Object> get props => [];
}

final class AddToDoInitial extends AddToDoState {}

final class AddToDoSuccess extends AddToDoState {}

final class AddToDoDummy extends AddToDoState {}

final class AddToDoSuccessAdding extends AddToDoState {}

// ignore: must_be_immutable
final class AddToDoFailer extends AddToDoState {
  String error;
  AddToDoFailer({required this.error});
}
