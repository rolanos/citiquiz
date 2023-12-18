part of 'qr_bloc.dart';

@immutable
sealed class QrEvent {}

class AddQr extends QrEvent {
  final String qr;

  AddQr({required this.qr});
}
