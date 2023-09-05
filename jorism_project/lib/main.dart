 // import 'package:firebase_ckore/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jorism_project/cubit/cubit.dart';
import 'package:jorism_project/cubit/state.dart';
import 'package:jorism_project/popups_widgets/username_popup.dart';
import 'package:jorism_project/registration/registration_cubit/registration_cubit.dart';
import 'package:jorism_project/screens/Profile/Profile.dart';
import 'package:jorism_project/screens/splash/splash_screen.dart';
import 'package:jorism_project/shared/Network/Cache_Helper.dart';
import 'package:jorism_project/shared/bloc_observe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/Agencies/Agencies_Screen.dart';
import 'screens/Profile/PaymentMethod_Screen.dart';
import 'screens/agent_details/agent_details_screen.dart';
import 'screens/bottom_nav_bar/bottom_nav_bar_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.cachehelper.initSharedPreferences();
  Bloc.observer=MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => RegistrationCubit(),
        ),
        // BlocProvider(
        //   create: (BuildContext context) => RegistrationAgentCubit(),
        // ),

        BlocProvider(create: (BuildContext context)=> JorismCubit()),
      ],
      child: BlocConsumer<JorismCubit,JorismState>(
        listener: (context, state){},
        builder: (context, state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF072B79)),
              useMaterial3: true,
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
