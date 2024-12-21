part of 'reservation_cubit.dart';

@immutable
sealed class ReservationState {}

final class ReservationInitial extends ReservationState {}

class ChangeIsReservedState extends ReservationState {}

class ChangeIsNotReservedState extends ReservationState {}

class ChangePriceState extends ReservationState {}

class ChangeDateState extends ReservationState {}

class ClearSortData extends ReservationState {}

class ChangeLocationState extends ReservationState {}

class ChangeIsFilterReserved extends ReservationState {}

class ClearFilterData extends ReservationState {}
