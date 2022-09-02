import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'registration_state.dart';

@Injectable()
class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  void setProfileImage(croppedImagePath) =>
      emit(SetProfilePhotoState(imagePath: croppedImagePath));

  void removeProfilePhoto() => emit(RegistrationInitial());
}
