abstract class RegisterationState {}

class RegistrationInitialState extends RegisterationState{}

class LoginSuccessState extends RegisterationState{}

class LoginLoadingState extends RegisterationState{}

class LoginInvalidEmailState extends RegisterationState{}

class LoginWrongPasswordState extends RegisterationState{}

class LoginErrorState extends RegisterationState{
  final String error;
  LoginErrorState(this.error);
}

class SignUpSuccessState extends RegisterationState{}

class ForgetPassScreenState extends RegisterationState{}

class resetSuccessState extends RegisterationState{}


class SignUpLoadingState extends RegisterationState{}

class SignUpErrorState extends RegisterationState{
  final String error;
  SignUpErrorState(this.error);
}

class CreateAccountLoadingState extends RegisterationState{

}
class CreateAccountSuccessState extends RegisterationState{
}
class CreateAccountErrorState extends RegisterationState{
  final String error;
  CreateAccountErrorState(this.error);
}

class ChangePasswordVisibiltyState extends RegisterationState{}

class SignUpState extends RegisterationState{}

class AgentSignUpState extends RegisterationState{}

class BackToLoginState extends RegisterationState{}

class ForgetPasswordLoadingState extends RegisterationState{}
class ForgetPasswordSuccessState extends RegisterationState{}
class ForgetPasswordErrorState extends RegisterationState{
  final String error;
  ForgetPasswordErrorState(this.error);
}
//============================Agent States
class AgentRegistrationInitialState extends RegisterationState{}

class AgentLoginSuccessState extends RegisterationState{}

class AgentLoginLoadingState extends RegisterationState{}

class AgentLoginInvalidEmailState extends RegisterationState{}

class AgentLoginWrongPasswordState extends RegisterationState{}

class AgentLoginErrorState extends RegisterationState{
  final String error;
  AgentLoginErrorState(this.error);
}

class AgentSignUpSuccessState extends RegisterationState{}

class AgentSignUpLoadingState extends RegisterationState{}

class AgentSignUpErrorState extends RegisterationState{
  final String error;
  AgentSignUpErrorState(this.error);
}

class AgentCreateAccountLoadingState extends RegisterationState{

}
class AgentCreateAccountSuccessState extends RegisterationState{
}
class AgentCreateAccountErrorState extends RegisterationState{
  final String error;
  AgentCreateAccountErrorState(this.error);
}

class AgentChangePasswordVisibiltyState extends RegisterationState{}

// class SignUpState extends RegisterationState{}

class AgentSignUpScreenState extends RegisterationState{}

class BackToAgentLoginState extends RegisterationState{}

class AgentForgetPasswordLoadingState extends RegisterationState{}
class AgentForgetPasswordSuccessState extends RegisterationState{}
class AgentForgetPasswordErrorState extends RegisterationState{
  final String error;
  AgentForgetPasswordErrorState(this.error);
}

class ChangeUserNameLoadingState extends RegisterationState{}
class ChangeUserNameSuccessState extends RegisterationState{}
class ChangeUserNameErrorState extends RegisterationState{
  final String error;
  ChangeUserNameErrorState(this.error);
}

class ChangePhoneLoadingState extends RegisterationState{}
class ChangePhoneSuccessState extends RegisterationState{}
class ChangePhoneErrorState extends RegisterationState{
  final String error;
  ChangePhoneErrorState(this.error);
}

class UserLogoutLoadingState extends RegisterationState{}
class UserLogoutSuccessState extends RegisterationState{}
class UserLogoutErrorState extends RegisterationState{
  final String error;
  UserLogoutErrorState(this.error);
}
class LoadingDeletedAccountState extends RegisterationState{}

class DeletedAccountSuccessAuthState extends RegisterationState{}

class DeletedAccountErrorState extends RegisterationState{}

class DeletedAccountSuccessCollState extends RegisterationState{}


