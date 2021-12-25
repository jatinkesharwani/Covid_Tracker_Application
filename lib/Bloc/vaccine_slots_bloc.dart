import 'dart:async';
import 'package:rxdart/rxdart.dart';

class Bloc{
  // Declare streams
  final _textController = BehaviorSubject<String>();
  final _textController1 = BehaviorSubject<String>();

  // set Data

  Function(String) get inPinCode => _textController.sink.add;
  Function(String) get inEnterDate => _textController1.sink.add;

  Stream<String> get outPinCode => _textController.stream.transform(pincodeValidator);
  Stream<String> get outEnterDate => _textController1.stream.transform(dateValidator);

  Stream<bool> get submitCheck => Rx.combineLatest2(outPinCode,outEnterDate,(e,p) => true);

  var pincodeValidator = StreamTransformer<String, String>.fromHandlers(

      handleData: (textField, sink) {
        bool phoneValid = RegExp(r'^[0-9]{6,8}$').hasMatch(textField);
        if (phoneValid) {
          sink.add(textField);
        }
        else {
          sink.addError("Field is not valid");
        }
      }
  );
  var dateValidator = StreamTransformer<String, String>.fromHandlers(

      handleData: (textField, sink) {
        bool phoneValid = RegExp(r'^[0-9]{2}$').hasMatch(textField);
        if (phoneValid) {
          sink.add(textField);
        }
        else {
          sink.addError("Field is not valid");
        }
      }
  );

  dispose(){
    _textController.close();
    _textController1.close();
  }

  //Functiions
  submit(){
  }
}