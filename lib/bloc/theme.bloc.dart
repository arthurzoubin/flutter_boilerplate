import 'package:bloc/bloc.dart';

abstract class ThemeEvent {}

class ChangeTheme extends ThemeEvent {
  @override
  String toString() => "ChangeTheme";
}

class ThemeBloc extends Bloc<ChangeTheme, bool> {
  @override
  bool get initialState => true;

  @override
  Stream<bool> mapEventToState(ThemeEvent event) async* {
    if (event is ChangeTheme) {
      yield !currentState;
    }
  }
}