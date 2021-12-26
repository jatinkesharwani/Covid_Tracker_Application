import 'package:covid19_tracker/Bloc/navigation_bloc.dart';
import 'package:covid19_tracker/screens/Home_Screen_Pages/home_page.dart';
import 'package:covid19_tracker/screens/SideBar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideBarLayout extends StatelessWidget {
  const SideBarLayout({Key key}) : super(key: key);

  NavigationStates get initialState => const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(initialState),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            const SideBar(),
          ],
        ),
      ),
    );
  }
}
