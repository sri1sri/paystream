
import 'package:flutter/cupertino.dart';
import 'package:paystream/services/validators.dart';
import 'package:paystream/firebase/auth.dart';

class SignUpModel with RegisterAccountValidator, ChangeNotifier {
  SignUpModel({
    @required this.auth,

    this.username = '',
    this.phoneNumber = '',
    this.isLoading = false ,
    this.submitted = false
  });

  final AuthBase auth;


  String username;
  String phoneNumber;
  bool isLoading;
  bool submitted;

  Future <void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
      print('username --> ${this.username}');

    } catch (e) {
      rethrow;
    } finally {
      updateWith(isLoading: false);
    }
  }

  void updateUsername(String username) => updateWith(username: username);

  void updatePhoneNumber(String phoneNumber) => updateWith(phoneNumber: phoneNumber);

  bool get canSubmit{
    return usernameValidator.isValid(username)
        && !isLoading;
  }

  void updateWith({
    String phoneNumber,
    String username,

    bool isLoading,
    bool submitted,

  }) {


    this.username = username ?? this.username;
    this.phoneNumber = phoneNumber ?? this.phoneNumber;

    this.isLoading = isLoading ?? this.isLoading;
    this.submitted = submitted ?? this.submitted;

    notifyListeners();
  }
}