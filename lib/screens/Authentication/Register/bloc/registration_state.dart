part of 'registration_cubit.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();
  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}
class SetProfilePhotoState extends RegistrationState {
  final String imagePath;
  const SetProfilePhotoState({required this.imagePath});
  @override
  List<Object> get props => [imagePath];
}

