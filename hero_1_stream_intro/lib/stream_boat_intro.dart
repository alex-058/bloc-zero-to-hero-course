int calculate() {
  return 6 * 7;
}

// async* generates asnychronous data
Stream<int> streamBoats() async* {
  for (var i = 0; i < 10; i++) {
    print('Send ship no: $i into the stream!');
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
