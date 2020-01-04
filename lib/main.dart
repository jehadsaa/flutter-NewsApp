import 'package:flutter/material.dart';
import 'Screens/onboarding.dart';
import 'Screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utilities/app_theme.dart';
main () async { //مع كلمة ساينك تعني ان هناك خطان للمعالجة في داخل المعالج
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();// كلمة ويت يعنيانه يجب تنفيذ هذا السطر قبل الالنتقال الى الاسفل|| وهذ السطر يعمل على انشاء ملف دائم في البرنامج يخزن فيه اما true Or false نستفاد منها للتحكم بظهور شاشة اونبوردنك
  bool seen = prefs.getBool('seen');// هنا يخزن قيمة البريفس في المفتاح سيين
  Widget _screen;

  if(seen == null || seen ==false ){
    _screen = OnBoarding();
  }
  else{
    _screen= HomeScreen();
  }
  runApp(NewsApp(_screen));

}
class NewsApp extends StatelessWidget{
  final Widget _screen;
  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(primaryColor: Colors.red),
      theme: AppTheme.appTheme ,
      home: this._screen,
    );
  }

}