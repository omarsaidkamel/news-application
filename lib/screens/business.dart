import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/components/tools.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/status.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,status){},
      builder: (context,status){
        NewsAppCubit cubit = NewsAppCubit.get(context);
         return cubit.business.length > 0?
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context,index){
              return listItems(context,cubit.business[index]);
            },
            separatorBuilder: (context,index) => Padding(padding: EdgeInsets.all(3)),
            itemCount: cubit.business.length,
        )
             :
         Center(child: CircularProgressIndicator());
      },
    );
  }
}