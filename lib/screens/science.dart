import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/components/tools.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/status.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,status){},
      builder: (context,status){
        NewsAppCubit cubit = NewsAppCubit.get(context);
        return cubit.science.length > 0?
        ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index){
            return listItems(context,cubit.science[index]);
          },
          separatorBuilder: (context,index) => Padding(padding: EdgeInsets.all(3)),
          itemCount: cubit.science.length,
        )
            :
        Center(child: CircularProgressIndicator());
      },
    );
  }
}