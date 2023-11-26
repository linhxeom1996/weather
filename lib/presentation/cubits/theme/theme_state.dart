import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final ThemeData? _themeData;

  const ThemeState(this._themeData);

  get theme => _themeData;

  @override
  List<Object?> get props => [_themeData];
}
