import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_firbs/Data/Cubits/AddCar/add_car_cubit.dart';
import 'package:try_firbs/Data/debug/app_bloc_observer.dart';
import 'package:try_firbs/View/AppMain.dart';
import 'package:try_firbs/helpers/CacheHelper.dart';
import 'package:try_firbs/helpers/dio_helper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  CacheHelper.init();
  DioHelper.init();

//init Firbase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.getInitialMessage();

// request permisiion
  requestNotificationPermission();

//getToken
  getDeviceToken();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddCarCubit>(create: (context) => AddCarCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AppMain(),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
///
///

String? deviceToken;

requestNotificationPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }

  print('User granted permission: ${settings.authorizationStatus}');
}

getDeviceToken() async {
  await FirebaseMessaging.instance.getToken().then((dToken) {
    deviceToken = dToken;
    print("device token is${deviceToken}");
  });
}
