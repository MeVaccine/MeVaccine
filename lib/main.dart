import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mevaccine/screen/appointment/mainstep_screen.dart';
import 'package:provider/provider.dart';

import './screen/symptom_form_screen.dart';
import './screen/register_Screen.dart';
import './screen/register_detail_screen.dart';
import './screen/verification_screen.dart';
import './screen/landing_screen.dart';
import './screen/appointment/step1_screen.dart';
import './screen/appointment/step2_screen.dart';
import './screen/appointment/step3_screen.dart';
import './screen/appointment/step4_screen.dart';
import './screen/person_screen.dart';
import './screen/AddPerson/addPerson_screen.dart';
import './screen/AddPerson/AddPersonRegister_screen.dart';
import './screen/AddPerson/verification_addperson.dart';
import './screen/historyVaccinate_screen.dart';
import './screen/Setting/setting_screen.dart';
import './screen/Setting/hospital_setting_screen.dart';
import 'config/color.dart';
import './screen/Setting/number_setting_screen.dart';
import './screen/Login_screen.dart';
import './provider/authenicateProvider.dart';
import './provider/personProvider.dart';
import './provider/userProvider.dart';
import './screen/Setting/verification_changeNumber.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthenicateProvider(),
        ),
        ChangeNotifierProxyProvider<AuthenicateProvider, PersonProvider>(
            create: (ctx) =>
                PersonProvider(token: '', name_en: '', name_th: ''),
            update: (ctx, auth, prev) => PersonProvider(
                token: auth.token,
                name_en: auth.userInfo.firstname_en,
                name_th: auth.userInfo.firstname_th)),
        ChangeNotifierProxyProvider<AuthenicateProvider, UserProvider>(
            create: (ctx) => UserProvider(token: ''),
            update: (ctx, auth, prev) => UserProvider(
                  token: auth.token,
                )),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Prompt',
          primaryColor: primary01,
        ),
        //หน้าแรกสุด
        home: LoginScreen(),
        // Routes เอาไว้ ตอนไปหน้าอื่นก็จะมา assign routeName เอ่ไว้ตรงนี้ เพื่อบอกว่า routeName นี้ไปไหน
        routes: {
          VerificationChangeNumber.routeName:(ctx)=>VerificationChangeNumber(),
          SymptomFormScreen.routeName: (ctx) => SymptomFormScreen(),
          NumberSettingScreen.routeName: (ctx) => NumberSettingScreen(),
          HospitalSettingScreen.routeName: (ctx) => HospitalSettingScreen(),
          SettingScreen.routeName: (ctx) => SettingScreen(),
          HistoryVaccinateScreen.routeName: (ctx) => HistoryVaccinateScreen(),
          VerificationAddPerson.routeName: (ctx) => VerificationAddPerson(),
          AddPersonRegister.routeName: (ctx) => AddPersonRegister(),
          Step1.routeName: (ctx) => Mainstep(),
          AddPerson.routeName: (ctx) => AddPerson(),
          RegisterScreen.routeName: (ctx) => RegisterScreen(),
          RegisterDetailScreen.routeName: (ctx) => RegisterDetailScreen(),
          VerificationScreen.routeName: (ctx) => VerificationScreen(),
          LandingScreen.routeName: (ctx) => LandingScreen(),
          PersonScreen.routeName: (ctx) => PersonScreen(),
          Step2.routeName: (ctx) => Step2(),
          Step3.routeName: (ctx) => Step3(),
          Step4.routeName: (ctx) => Step4(),
        },
      ),
    );
  }
}
