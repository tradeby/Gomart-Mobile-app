import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gomart/screens/Authentication/Register/bloc/register_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RegistrationCubit extends Cubit<RegisterState> {
  RegistrationCubit() : super(RegisterState.initial());

  void setPhoneNumber(_) => emit(state.copyWith(phoneNumber: sanitizeInput(_)));

  void setFirstName(_) => emit(state.copyWith(firstName: sanitizeInput(_)));

  void setLastName(_) => emit(state.copyWith(lastName: sanitizeInput(_)));

  void setDateOfBirth(_) => emit(state.copyWith(dateOfBirth: _));

  void setFlagCountryCode(_) => emit(state.copyWith(selectedCountry: _));

  void setProfileImage(croppedImagePath) =>
      emit(state.copyWith(photoUrl: croppedImagePath));

  void removeProfilePhoto() => emit(state.copyWith(photoUrl: null));
}

String? sanitizeInput(String? input) {
  if (input?.isEmpty ?? true) return null;
  if (input?.trim().isEmpty ?? true) return null;
  return input?.trim();
}
