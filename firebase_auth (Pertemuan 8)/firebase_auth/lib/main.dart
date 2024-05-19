import 'package:firebase_auth_09/bloc/login/login_cubit.dart';
import 'package:firebase_auth_09/bloc/register/register_cubit.dart';
import 'package:firebase_auth_09/firebase_options.dart';
import 'package:firebase_auth_09/ui/splash.dart';
import 'package:firebase_auth_09/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp( 
    options: DefaultFirebaseOptions.currentPlatform, 
  ); 
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit())
      ],
      child: MaterialApp(
        title: 'Firebase Auth Prak9',
        debugShowCheckedModeBanner: false, 
        navigatorKey: NAV_KEY, 
        onGenerateRoute: generateRoute, 
        home: SplashScreen(),
      ),
    );
  }
}
