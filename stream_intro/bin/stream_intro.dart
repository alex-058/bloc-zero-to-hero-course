import 'package:stream_intro/stream_boat_intro.dart' as stream_intro;

void main(List<String> arguments) {
  print('Stream should now start and listen');

  // Initializing stream
  var testStream = stream_intro.streamBoats();
  // Listen for stream data (which gets yielded in an asynchronous fashion)
  testStream.listen((event) {
    print('Boat ${event.toString()} has arrived');
  });
}
