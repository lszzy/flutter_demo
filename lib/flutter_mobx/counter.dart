import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class Counter = CounterBase with _$Counter;

abstract class CounterBase with Store {
  final Observable<int> count = Observable(0);

  @observable
  int another = 0;

  @computed
  int get total => (count.value + another);

  @action
  void incrementAnother() {
    another++;
  }
}
