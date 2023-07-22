import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/status.dart';
import 'package:newsapp/components/dio_helper.dart';

import 'components/bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const NewsApp());
}


class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsAppCubit()..getBusiness(),
      child: BlocConsumer<NewsAppCubit,NewsAppStates>(
        listener: (context,status){},
        builder: (context,status){
          NewsAppCubit cubit = NewsAppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text('News Screen'),
                actions: [
                  //Icon(Icons.search),
                  IconButton(
                      icon:Icon(Icons.brightness_4_outlined,),
                      onPressed: (){
                    cubit.changeTheme();
                  }),
                ],
              ),
              body: cubit.screens[cubit.currentScreen],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentScreen,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
                  BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
                  BottomNavigationBarItem(icon: Icon(Icons.sports_volleyball_rounded),label: 'Sport'),
                ],
                onTap:(x) => cubit.changeScreen(x),
              ),
            ),
            theme: ThemeData(
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  )
              ),
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrangeAccent,
              ),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black,),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.white,
                ),
                color: Colors.white,
                titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),
                elevation: 0,
              ),
            ),
            darkTheme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold
                )
              ),
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white10,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white,),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: Colors.black,
                ),
                color: Colors.black,
                titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),

              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white10,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrangeAccent,
                unselectedItemColor: Colors.white,
              ),
            ),
            themeMode: cubit.dark?ThemeMode.dark:ThemeMode.light,
          );
        },
      ),
    );
  }
}
