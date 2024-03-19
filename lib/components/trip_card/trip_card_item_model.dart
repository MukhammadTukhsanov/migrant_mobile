// tripCart model
class TripCardItemModel {
  final String price;
  final String startDate;
  final String endDate;
  final String startLocation;
  final String endLocation;
  final String user;
  final String countOfFreeSeats;

  TripCardItemModel(
      {required this.price,
      required this.startDate,
      required this.endDate,
      required this.startLocation,
      required this.endLocation,
      required this.user,
      required this.countOfFreeSeats});
}
