import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc() : super(QrInitial()) {
    on<AddQr>((event, emit) {
      emit(QrInitial(qr: event.qr));
    });
  }
}
