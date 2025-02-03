import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'details_weather_cast_screen_event.dart';
part 'details_weather_cast_screen_state.dart';

class DetailsWeatherCastScreenBloc extends Bloc<DetailsWeatherCastScreenEvent, DetailsWeatherCastScreenState> {
  DetailsWeatherCastScreenBloc() : super(DetailsWeatherCastScreenState()) {
    on<DetailsWeatherCastScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
