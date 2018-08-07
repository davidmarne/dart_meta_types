part of models;

@EnumClass(Signal)
abstract class $ProtocolState {
  static const Waiting waiting = Waiting();
  static const Talking talking = Talking();
}

abstract class Signal {
  ProtocolState get signal;
}

class Waiting implements Signal {
  const Waiting();
  ProtocolState get signal => ProtocolState.waiting;
}

class Talking implements Signal {
  const Talking();
  ProtocolState get signal => ProtocolState.talking;
}
