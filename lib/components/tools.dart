import 'package:flutter/material.dart';

Widget listItems(context,model){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: MediaQuery.of(context).size.height*0.15,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage('${model['urlToImage']}'),
                fit: BoxFit.fill
              ),
            ),
          ),
          SizedBox(width: 5),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    height: MediaQuery.of(context).size.height*0.115,
                    child: Text(
                      '${model['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                ),

                Text('${model['publishedAt']}',style: Theme.of(context).textTheme.bodyText1,),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}