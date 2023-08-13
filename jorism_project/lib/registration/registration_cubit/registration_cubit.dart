
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jorism_project/models/user_model.dart';
import 'package:jorism_project/registration/agent_register/agent_register_screen.dart';
import 'package:jorism_project/registration/forget/forget_password.dart';
import 'package:jorism_project/registration/login/login_screen.dart';
import 'package:jorism_project/registration/register/register_screen.dart';
import 'package:jorism_project/registration/registration_cubit/registration_state.dart';
import 'package:jorism_project/shared/components/component.dart';



class RegistrationCubit extends Cubit<RegisterationState> {
  RegistrationCubit() : super(RegistrationInitialState());

  static RegistrationCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  bool showPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibialty() {
    showPassword = !showPassword;
    suffix = showPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibiltyState());
  }



  void signUpScreen(context) {
    navigators.navigateTo(context, RegisterScreen());
    emit(SignUpState());
  }

  void ForgetPassScreen(context) {
    navigators.navigatorWithBack(context, ForgetPasswordScreen());
    emit(ForgetPassScreenState());
  }


  void resetSuccess(context) {
    navigators.navigateTo(context, LoginScreen());
    emit(resetSuccessState());
  }

  void agentSignUpScreen(context) {
    navigators.navigateTo(context, AgentSignUpScreen());
    emit(AgentSignUpState());
  }

  void loginBack(context) {
    navigators.navigateTo(context, LoginScreen());
    emit(BackToLoginState());
  }

  UserModel? userModel;

  // List<UserModel>? userModel;
  // String? password=UserModel.userModel[0][3];
  // UserModel?password;
  void loginToHome({required String email, required String password}) async {
    emit(LoginLoadingState());
    // userName=UserModel.fromJson(userName!.username as Map<String, dynamic>);
    // userModel= await Registration.getUserData();
    // UserModel? login = userModel!.firstWhere(
    //       (user) => user.email == email,
    //   orElse: () => UserModel(
    //     userId: '',
    //     username: '',
    //     email: '',
    //     password: '',
    //     phone: '',
    //   ),
    // );
    // // emit(LoginSuccessState());
    // if (login.password == passwordController) {
    //   // User found and password matches
    //   userName = login;
    //   password = login;
    //
    //   emit(LoginSuccessState());
    // } else {
    //   // User not found or password doesn't match
    //   emit(LoginErrorState());
    // }
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      FirebaseFirestore.instance
          .collection('users')
          .doc(value.user!.uid)
          .get()
          .then((userSnapshot) {
        userModel =
            UserModel.fromJson(userSnapshot.data() as Map<String, dynamic>);
        if(userModel!.isAgent==true){
          emit(AgentLoginSuccessState());
        }
        else
          emit(LoginSuccessState());
      }).catchError((error) {
        if(userModel!.isAgent==true)
          emit(AgentLoginSuccessState());
        else
          emit(LoginErrorState(error.toString()));
      });
      // emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  void createAccount({
    required String email,
    required String password,
    required String name,
    required String phone,
    String? ssc,
  }) {
    emit(CreateAccountLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      signUp(
        email: email,
        password: password,
        name: name,
        phone: phone,
        uId: value.user!.uid,
        ssc: ssc,
      );
      if (ssc != null && ssc.isNotEmpty) {
        userModel!.isAgent = true;
        print('ssc is not empty=> ${value.user!.email}');
        print('ssc is not empty=> ${value.user!.uid}');
        emit(AgentCreateAccountSuccessState());
      } else
        print(value.user!.email);
      print(value.user!.uid);
      emit(CreateAccountSuccessState());
    }).catchError((error) {
      if (ssc == null || ssc.isEmpty)
        emit(CreateAccountErrorState(error.toString()));
      else
        emit(CreateAccountErrorState(error.toString()));
    });
  }

  void signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String uId,
    String? ssc,
  }) {
    emit(SignUpLoadingState());
    // if (password=='123'){
    //   emit(SignUpSuccessState());
    // }
    // else{
    //   emit(SignUpErrorState());
    // }
    userModel = UserModel(
      userId: uId,
      username: name,
      email: email,
      password: password,
      phone: phone,
      ssc: ssc ?? '',
    );
    if (ssc != null && ssc.isNotEmpty) {
      userModel!.isAgent = true; // Set isAgent to true if signing up as an agent
    }
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel!.toJson())
        .then((value) {
      if (ssc != null && ssc.isNotEmpty) {
        userModel!.isAgent = true;
        emit(AgentSignUpSuccessState());
      } else
        emit(SignUpSuccessState());
    }).catchError((error) {
      if (ssc == null || ssc.isEmpty)
        emit(AgentSignUpErrorState(error.toString()));
      else
        emit(SignUpErrorState(error.toString()));
    });
  }

  void forgetPassword(String password) {
    emit(ForgetPasswordLoadingState());
    FirebaseAuth.instance.sendPasswordResetEmail(email: password).then((value) {
      print('Email Sent');
      emit(ForgetPasswordSuccessState());
    }).catchError((error) {
      emit(ForgetPasswordErrorState(error.toString()));
    });
  }
}
