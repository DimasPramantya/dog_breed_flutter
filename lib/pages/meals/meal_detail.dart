import 'package:flutter/material.dart';

class MealDetail extends StatefulWidget{
  final String id;
  
  const MealDetail({super.key, required this.id});

  @override
  State<MealDetail> createState()=>_MealDetailState();
}

class _MealDetailState extends State<MealDetail>{
  @override
  Widget build(BuildContext context){
    return Container();
  }
}