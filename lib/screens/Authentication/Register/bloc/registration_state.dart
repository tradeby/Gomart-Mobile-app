part of 'registration_cubit.dart';


class RegistrationState extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  final String? phoneNumber;
  final String? photoUrl;

  const RegistrationState({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.phoneNumber,
    this.photoUrl,
  });

  factory RegistrationState.initial() {
    return const RegistrationState();
  }

  RegistrationState copyWith({
    String? firstName,
    String? lastName,
    String? dateOfBirth,
    String? phoneNumber,
    String? photoUrl,
  }) {
    return RegistrationState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  RegistrationState clearPhotoUrl() {
    return RegistrationState(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      phoneNumber: phoneNumber,
      photoUrl: null,
    );
  }

  @override
  List<Object> get props => [
        firstName.toString(),
        lastName.toString(),
        dateOfBirth.toString(),
        phoneNumber.toString(),
        photoUrl.toString(),
      ];

  @override
  String toString() {
    return 'BagState{bagProductsLoadInProgress: ';
  }
}
