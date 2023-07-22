import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/components/tools.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/status.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,status){},
      builder: (context,status){
        NewsAppCubit cubit = NewsAppCubit.get(context);
        return cubit.sports.length > 0?
        ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index){
            return listItems(context,cubit.sports[index]);
          },
          separatorBuilder: (context,index) => Padding(padding: EdgeInsets.all(3)),
          itemCount: cubit.sports.length,
        )
            :
        Center(child: CircularProgressIndicator());
      },
    );
  }
}
//https://newsapi.org/v2/top-headlines?country&category=business&apiKey=f3eb60510b7746369b553969d9f842c7
