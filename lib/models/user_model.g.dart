// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserModel on _UserModelBase, Store {
  Computed<int> _$ageComputed;

  @override
  int get age => (_$ageComputed ??= Computed<int>(() => super.age)).value;

  final _$nameAtom = Atom(name: '_UserModelBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_UserModelBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$birthdayAtom = Atom(name: '_UserModelBase.birthday');

  @override
  DateTime get birthday {
    _$birthdayAtom.context.enforceReadPolicy(_$birthdayAtom);
    _$birthdayAtom.reportObserved();
    return super.birthday;
  }

  @override
  set birthday(DateTime value) {
    _$birthdayAtom.context.conditionallyRunInAction(() {
      super.birthday = value;
      _$birthdayAtom.reportChanged();
    }, _$birthdayAtom, name: '${_$birthdayAtom.name}_set');
  }
}
