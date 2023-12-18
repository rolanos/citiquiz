part of 'qr_bloc.dart';

@immutable
sealed class QrState {}

class QrInitial extends QrState {
  final String? qr;

  QrInitial({this.qr});
}
