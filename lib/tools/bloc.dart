part of '../tools/bloc_provider.dart';



class Bloc {
  BuildContext context;
  StreamController<dynamic> _controller = StreamController<dynamic>.broadcast();
  Stream<dynamic> get stream => _controller.stream;

  Map<String, String> inputs = {};
  bool spinner = false;




  void dispose() {
    //_controller.close();
  }

  void onResume() {}

  void onPause() {}

  void onInactive() {}

  void initState() {
  }

  void notifyChanges([callback]) {
    if (callback != null) {
      callback();
    }
    _controller.sink.add(0);
  }

  Future<dynamic> navigate<T extends Bloc>({@required Widget screen}) async {
    return await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }

  pop([results]) {
    if (results == null) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop(results);
    }
  }

  void popAndNavigate<T extends Bloc>({@required Widget screen}) async {
    // Delayed here assists push the navigator to after state build
    // Otherwise an error will occur if a rebuild is underway
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }

  void popStackAndNavigate<T extends Bloc>({@required Widget screen}) async {
    // Delayed here assists push the navigator to after state build
    // Otherwise an error will occur if a rebuild is underway
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return screen;
      }),
      ModalRoute.withName('/'),
    );
  }

}
