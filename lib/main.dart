import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/product_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsService(), lazy: false)
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: "home",
      routes: {
        "login": (_) => LoginScreen(),
        "home": (_) => HomeScreen(),
        "product": (_) => productScreen(),
      },
      theme: ThemeData.light().copyWith(
          primaryTextTheme:
              TextTheme(headline6: TextStyle(color: Colors.black)),
          scaffoldBackgroundColor: Colors.grey[200],
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.greenAccent,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.indigo,
            elevation: 0,
          )),
    );
  }
}
