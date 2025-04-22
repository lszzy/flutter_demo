// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Counter on CounterBase, Store {
  Computed<int>? _$totalComputed;

  @override
  int get total => (_$totalComputed ??=
          Computed<int>(() => super.total, name: 'CounterBase.total'))
      .value;

  late final _$anotherAtom =
      Atom(name: 'CounterBase.another', context: context);

  @override
  int get another {
    _$anotherAtom.reportRead();
    return super.another;
  }

  @override
  set another(int value) {
    _$anotherAtom.reportWrite(value, super.another, () {
      super.another = value;
    });
  }

  late final _$CounterBaseActionController =
      ActionController(name: 'CounterBase', context: context);

  @override
  void incrementAnother() {
    final _$actionInfo = _$CounterBaseActionController.startAction(
        name: 'CounterBase.incrementAnother');
    try {
      return super.incrementAnother();
    } finally {
      _$CounterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
another: ${another},
total: ${total}
    ''';
  }
}
