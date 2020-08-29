class BookingsData{
  String futsalName;
  String date;
  String startingTime;
  String endingTime;

  BookingsData({this.futsalName, this.date, this.startingTime, this.endingTime});
}

List<BookingsData> bookings = [
  BookingsData(
    futsalName: 'Khwopa Futsal and Training Center', 
    date: 'April 2', 
    startingTime: '1:00',
    endingTime: '2:00'
  ),
  BookingsData(
    futsalName: 'Khwopa futsal', 
    date: 'April 5', 
    startingTime: '11:00',
    endingTime: '12:00'
  ),
  BookingsData(
    futsalName: 'Glory Futsal', 
    date: 'April 7', 
    startingTime: '3:00',
    endingTime: '4:00'
  ),
];