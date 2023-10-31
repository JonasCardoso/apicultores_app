part of 'wi_fi_connection_bloc.dart';

sealed class WiFiConnectionEvent extends Equatable {
  const WiFiConnectionEvent();

  @override
  List<Object> get props => [];
}

final class WiFiConnectionFetched extends WiFiConnectionEvent {}

final class WiFiConnectionTurnedOn extends WiFiConnectionEvent {}

final class WiFiConnectionTurnedOff extends WiFiConnectionEvent {}
