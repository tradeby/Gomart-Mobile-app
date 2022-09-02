import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'registration_state.dart';

@Injectable()
class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationState.initial());

  void setProfileImage(croppedImagePath) =>
      emit(state.copyWith(photoUrl: croppedImagePath));

  void removeProfilePhoto() => emit(state.clearPhotoUrl());
}
