import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:madmon_task/core/resources/color_manager.dart';
import 'package:madmon_task/presentation/reservation/model/reservation_item_action_btn_model.dart';
import 'package:meta/meta.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());
  final List<ReservationItemActionBtnModel> reservationBtns = [
    ReservationItemActionBtnModel("New", ColorManager.primaryColor,
        Colors.white, ColorManager.primaryColor),
    ReservationItemActionBtnModel(
        "Contract Signed", Colors.white, Colors.green, Colors.green),
    ReservationItemActionBtnModel("No Answer", Colors.white,
        ColorManager.redColor, ColorManager.redColor),
    ReservationItemActionBtnModel("Commission", Colors.white,
        ColorManager.greyColor2, ColorManager.greyColor2),
    ReservationItemActionBtnModel(
        "Meeting schaduled", Colors.white, Colors.blue, Colors.blue),
    ReservationItemActionBtnModel(
        "Follow Up",
        Colors.white,
        ColorManager.primaryColor.withOpacity(.6),
        ColorManager.primaryColor.withOpacity(.6)),
  ];

  bool isReserved = false;
  changeIsReserved(bool value) {
    isReserved = value;
    emit(ChangeIsReservedState());
  }

  bool isNotReserved = false;
  changeIsNotReserved(bool value) {
    isNotReserved = value;
    emit(ChangeIsNotReservedState());
  }

  ////////////////////////Price/////////////////////
  bool isHigh = false;
  changeIsHigh(bool value) {
    isHigh = value;
    emit(ChangePriceState());
  }

  bool isLow = false;
  changeIsLow(bool value) {
    isLow = value;
    emit(ChangePriceState());
  }

  ////////////////////////Date/////////////////////
  bool isNewest = false;
  changeIsNewest(bool value) {
    isNewest = value;
    emit(ChangeDateState());
  }

  bool isOldest = false;
  changeIsOldest(bool value) {
    isOldest = value;
    emit(ChangeDateState());
  }

  clearSortData() {
    isReserved = false;
    isNotReserved = false;
    isNewest = false;
    isOldest = false;
    isHigh = false;
    isLow = false;
    emit(ClearSortData());
  }

  ////////////////////////Location///////////////////////
  bool isZayed = false;
  changeIsZayed(bool value) {
    isZayed = value;
    emit(ChangeLocationState());
  }

  bool isFifht = false;
  changeIsFifht(bool value) {
    isFifht = value;
    emit(ChangeLocationState());
  }

  /////////////////////////////FilterStatus///////////
  bool isFilterReserved = false;
  changeIsFilterReserved(bool value) {
    isFilterReserved = value;
    emit(ChangeIsFilterReserved());
  }

  bool isFilterNotReserved = false;
  changeIsNotFilterReserved(bool value) {
    isFilterNotReserved = value;
    emit(ChangeIsFilterReserved());
  }

  clearFilterData() {
    isFilterReserved = false;
    isFilterNotReserved = false;

    isZayed = false;
    isFifht = false;
    emit(ClearFilterData());
  }
}
