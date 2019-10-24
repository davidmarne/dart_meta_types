import 'package:meta_types/meta_types.dart';
import 'package:meta_types_redux/meta_types_redux.dart';

part 'example.g.dart';

@DataClass()
abstract class $Counter {
  int get count => 0;
}

// $Counter tells the generator the state to use for the
// reducer and middlwarehandler code should be of type Counter
@Actions($Counter)
@SealedClass()
abstract class $CounterActions {
  int get increment;
  int get decrement;
}

void main() {
  final store = MetaTypesStore<Counter, CounterActions>(
    reducer: myReducer,
    initialState: Counter(),
    metaMiddleware: [myMiddleware],
    syncStream: true,
  );

  store.onChange.listen((state) => print(state.count));

  store.dispatch(CounterActions.incrementFactory(1));
  // increment mw: 1
  // 1
  store.dispatch(CounterActions.incrementFactory(4));
  // increment mw: 4
  // 5
  store.dispatch(CounterActions.decrementFactory(1));
  // decrement mw: 1
  // 4
}

final myReducer = (Counter c, CounterActions a) => a.reduce(
      c,
      increment: _increment,
      decrement: _decrement,
    );

Counter _increment(Counter state, int val) =>
    state.clone(count: state.count + val);

Counter _decrement(Counter state, int val) =>
    state.clone(count: state.count - val);

final myMiddleware = (
  MiddlewareApi<Counter, CounterActions> api,
  MetaNextDispatcher next,
  CounterActions a,
) =>
    a.handleMiddleware(
      api,
      next,
      increment: _incrementHandler,
      decrement: _decrementHandler,
    );

void _incrementHandler(MiddlewareApi<Counter, CounterActions> api,
    MetaNextDispatcher next, int val) {
  print('increment mw: $val');
  next();
}

void _decrementHandler(MiddlewareApi<Counter, CounterActions> api,
    MetaNextDispatcher next, int val) {
  print('decrement mw: $val');
  next();
}
