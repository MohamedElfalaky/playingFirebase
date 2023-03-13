import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_firbs/Data/Cubits/AddCar/add_car_cubit.dart';
import 'package:try_firbs/Data/debug/app_bloc_observer.dart';
import 'package:try_firbs/View/AppMain.dart';
import 'package:try_firbs/helpers/CacheHelper.dart';
import 'package:try_firbs/helpers/NotificationHelper.dart';
import 'package:try_firbs/helpers/dio_helper.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp();
  NotificationHelper().showNotificationHeadUp(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//init Firbase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  DioHelper.init();

//

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NotificationHelper notiHelper = NotificationHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // request permisiion //getToken
    notiHelper.requestPermissionAndGetToken();

    // create local notification settings and info
    notiHelper.configLocalNotification();
  }

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

