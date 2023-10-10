import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NumberTrivia extends Equatable {
  @override
  String? text;
  int? number;
  NumberTrivia({required this.text, required this.number});
  // : super([text, number]);

  // TODO: implement props
  List<Object?> get props => [number, text];
}
