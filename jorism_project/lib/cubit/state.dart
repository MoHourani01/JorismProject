abstract class JorismState{}

class InitialJorismState extends JorismState{}

class JorismChangeBottomNavBarState extends JorismState{}

class HomeJorismState extends JorismState{}

class UploadImageLoadingState extends JorismState{}

class ChooseSubjectImageLoadingState extends JorismState{}
class ChooseSubjectImageSuccessState extends JorismState{}
class ChooseSubjectImageErrorState extends JorismState{
  final String error;
  ChooseSubjectImageErrorState(this.error);
}

class RetrieveLostImageLoadingState extends JorismState{}
class RetrieveLostImageSuccessState extends JorismState{}
class RetrieveLostImageErrorState extends JorismState{}

class UploadImageSuccessState extends JorismState{}

class ImageSuccessState extends JorismState{}
class ImageLoadingState extends JorismState{}

class UploadImageErrorState extends JorismState{
  // final String error;
  // UploadImageErrorState(this.error);
}

class ImageErrorState extends JorismState{
  final String error;
  ImageErrorState(this.error);
}

class AddProductLoadingState extends JorismState{}
class AddProductSuccessState extends JorismState{}
class AddProductErrorState extends JorismState{
  final String error;
  AddProductErrorState(this.error);
}
class AddUserProductLoadingState extends JorismState{}
class AddUserProductSuccessState extends JorismState{}
class AddUserProductErrorState extends JorismState{
  final String error;
  AddUserProductErrorState(this.error);
}

class DateTimeLoadingState extends JorismState{}
class DateTimeSuccessState extends JorismState{}
class DateTimeErrorState extends JorismState{}
