import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintText: 'Hint text',
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2.0)
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0)
  )
);