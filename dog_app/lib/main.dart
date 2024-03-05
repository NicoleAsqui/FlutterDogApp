import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/dog_provider.dart';
import 'views/dog_list_view.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DogProvider()),
      ],
      child: MaterialApp(
        title: 'Dog App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splashScreen',
        routes: {
          '/splashScreen': (context) => SplashScreen(),
          '/dogListView': (context) => DogListView(),
        },
      ),
    );
  }
}
