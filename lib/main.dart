import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oga_bassey/blocs/auth_bloc/authentication_bloc.dart';
import 'package:oga_bassey/blocs/cart_bloc/cart_bloc.dart';
import 'package:oga_bassey/blocs/like_product_bloc/like_product_bloc.dart';
import 'package:oga_bassey/blocs/location_bloc/location_bloc.dart';
import 'package:oga_bassey/blocs/payment_bloc/payment_bloc.dart';
import 'package:oga_bassey/blocs/theme_cubit/theme_cubit.dart';
import 'package:oga_bassey/screens/checkout_screen.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/screens/auth/auth_flow_screen.dart';
import 'package:oga_bassey/screens/cart_screen.dart';
import 'package:oga_bassey/screens/favourite_screen.dart';
import 'package:oga_bassey/screens/forgot_password/components/email_notication.dart';
import 'package:oga_bassey/screens/forgot_password/forgot_password.dart';
import 'package:oga_bassey/screens/home/home_screen.dart';
import 'package:oga_bassey/screens/login_screen.dart';
import 'package:oga_bassey/screens/new_password/new_password.dart';
import 'package:oga_bassey/screens/product_screen/product_screen.dart';
import 'package:oga_bassey/screens/signup_screen.dart';
import 'package:oga_bassey/screens/splash/IntroScreen.dart';
import 'package:oga_bassey/services/push_notification.dart';
import 'package:oga_bassey/theme/app_theme.dart';
import 'blocs/product_bloc/product_bloc.dart';
import 'firebase_options.dart';

// @pragma('vm:entry-point')

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {

  

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Push notification
  await FirebasePushNotification().initNotifications();
  

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => LikedProductBloc(),
        ),
        BlocProvider(
          create: (context) => LocationBloc(),
        ),
        BlocProvider(
          create: (context) => PaymentBloc(context),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext   context) {
    return BlocBuilder<ThemeCubit, ThemeModeState>(
      builder: (context, state) {
        final appTheme = state.themeMode == ThemeMode.light
            ? AppTheme.lightTheme
            : AppTheme.darkTheme;
        return MaterialApp(
          title: 'GADGETZ',
          debugShowCheckedModeBanner: false,
          themeMode: state.themeMode,
          theme: appTheme,
          darkTheme: appTheme,
          initialRoute: AuthenticationFlowScreen.id,
          routes: {
            IntroScreen.id: (context) => const IntroScreen(),
            ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
            EmailNotifierScreen.id: (context) => const EmailNotifierScreen(),
            NewPasswordScreen.id: (context) => const NewPasswordScreen(),
            HomeScreen.id: (context) => const HomeScreen(),
            ProductScreen.id: (context) => const ProductScreen(),
            AuthenticationFlowScreen.id: (context) => const AuthenticationFlowScreen(),
            LoginScreen.id: (context) => const LoginScreen(),
            SignupBody.id: (context) => const SignupBody(),
            FavouriteScreen.id: (context) => const FavouriteScreen(),
            CartScreen.id: (context) => const CartScreen(),
          },
        );
      },
    );
  }
}

