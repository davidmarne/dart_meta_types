import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DocumentUpdater<D> {
  final Map<String, dynamic> _update = {};

  Map<String, dynamic> get update => _update;

  @protected
  NumberUpdater<T> $numberUpdater<T extends num>(String field) =>
      NumberUpdater((ft) => update[field] = ft);

  @protected
  ListUpdater<T> $listUpdater<T>(String field) =>
      ListUpdater((ft) => update[field] = ft);

  @protected
  MapUpdater<T> $mapUpdater<T>(String field) =>
      MapUpdater((key, value) => update['$field.$key'] = value);

  @protected
  DateTimeUpdater $dateTimeUpdater(String field) =>
      DateTimeUpdater((ft) => update[field] = ft);
}

class MapUpdater<T> {
  void Function(String key, dynamic value) setter;

  MapUpdater(this.setter);

  void operator []=(String key, T value) {
    setter(key, value);
  }

  void delete(String key) {
    setter(key, FieldValue.delete());
  }
}

class ListUpdater<T> {
  void Function(FieldValue) setter;

  ListUpdater(this.setter);

  void arrayRemove(List<T> elements) => setter(
        FieldValue.arrayRemove(elements),
      );

  void arrayUnion(List<T> elements) => setter(
        FieldValue.arrayUnion(elements),
      );
}

class NumberUpdater<T extends num> {
  void Function(FieldValue) setter;

  NumberUpdater(this.setter);

  void increment(T i) => setter(
        FieldValue.increment(i),
      );
}

class DateTimeUpdater {
  void Function(FieldValue) setter;

  DateTimeUpdater(this.setter);

  void serverTimestamp() => setter(
        FieldValue.serverTimestamp(),
      );
}

// class Foo {
//   int y;
//   List<String> z;
//   Bar b;
// }

// class Bar {
//   String x;
// }

// class BarUpdater extends DocumentUpdater<Bar> {
//   set x(int value) {
//     data['x'] = value;
//   }
// }

// class FooUpdater extends DocumentUpdater<Foo> {
//   get y => numberUpdater<int>('y');
//   set y(int value) {
//     data['y'] = value;
//   }

//   get z => listUpdater<String>('z');
//   set z(List<String> value) {
//     data['z'] = value;
//   }

//   var _bar;
//   get bar {
//     if (_bar == null) {
//       _bar = BarUpdater();
//       data['b'] = _bar.data;
//     }
//     return _bar;
//   }

//   set bar(Bar b) => data['b'] = serializers.serialize(bar);
// }

// var a = FooUpdater()
//   ..y = 5
//   ..z = ['h']
//   ..bar = Bar(x: 'sdf');

// var b = FooUpdater()
//   ..y.increment()
//   ..z.arrayUinion('sdf');

// abstract class Baz {
//   int get x;
//   String get y;
// }

// class BazUpdater extends DocumentUpdater<Baz> {
//   get x => numberUpdater<int>('x');
//   set x(int value) {
//     if (data['kind'] != 'x') {
//       data.clear();
//     }
//     data['kind'] = 'x';
//     data['value'] = value;
//   }

//   set y(String value) {
//     if (data['kind'] != 'y') {
//       data.clear();
//     }
//     data['kind'] = 'y';
//     data['value'] = value;
//   }
// }
