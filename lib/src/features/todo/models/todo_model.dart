import 'package:flutter/material.dart';

class TodoModel{
  final double id;
  final String title;
  final String data;

  TodoModel({
    required this.id,
    required this.title,
    required this.data,});

  factory TodoModel.fromJson(Map json){
    return TodoModel(
      id: json['id'],
      title: json['title'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['data'] = this.data;
    return data;
  }
}