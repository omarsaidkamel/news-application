import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/components/dio_helper.dart';
import 'package:newsapp/cubit/status.dart';
import 'package:newsapp/screens/business.dart';
import 'package:newsapp/screens/science.dart';
import 'package:newsapp/screens/sports.dart';

class NewsAppCubit extends Cubit<NewsAppStates>{
 NewsAppCubit() : super(NewsInitialAppStates());

 static NewsAppCubit get(context) => BlocProvider.of(context);
 int currentScreen = 0;
 bool dark = false;
 List<dynamic> business = [];
 List<dynamic> sports = [];
 List<dynamic> science = [];
 List<Widget> screens = [
  BusinessScreen(),
  ScienceScreen(),
  SportsScreen(),
 ];
 void changeScreen(int index){
  if(index == 0) getBusiness();
  if(index == 1) getScience();
  if(index == 2) getSports();
  currentScreen = index;
  emit(NewsAppNavStates());
 }

 void getBusiness(){
  emit(NewsLoadingBusinessStates());

  DioHelper.getData(
   path: 'v2/top-headlines',
   query: {
   'country':'eg',
   'category':'business',
   'apiKey':'f3eb60510b7746369b553969d9f842c7',
   },
  ).then((value) {
   business = value.data['articles'];
   print(business[0]['title']);
   emit(NewsGetBusinessStates());
  }).catchError((e){
   print(e);
   emit(NewsErrorBusinessStates(e));
  });
 }
 void getScience(){
  emit(NewsLoadingScienceStates());

  DioHelper.getData(
   path: 'v2/top-headlines',
   query: {
   'country':'eg',
   'category':'science',
   'apiKey':'f3eb60510b7746369b553969d9f842c7',
   },
  ).then((value) {
   science = value.data['articles'];
   print(science[0]['title']);
   emit(NewsGetScienceStates());
  }).catchError((e){
   print(e);
   emit(NewsErrorScienceStates(e));
  });
 }
 void getSports(){
  emit(NewsLoadingSportsStates());

  DioHelper.getData(
   path: 'v2/top-headlines',
   query: {
   'country':'eg',
   'category':'sport',
   'apiKey':'f3eb60510b7746369b553969d9f842c7',
   },
  ).then((value) {
   sports = value.data['articles'];
   print(sports[0]);
   emit(NewsGetSportsStates());
  }).catchError((e){
   print(e);
   emit(NewsErrorSportsStates(e));
  });
 }
 void changeTheme(){
  dark = !dark ;
  emit(NewsChangeThemeStates());
 }

}