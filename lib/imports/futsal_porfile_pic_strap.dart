import 'package:flutter/material.dart';

List<String> pics =[
  'https://dynaimage.cdn.cnn.com/cnn/q_auto,h_600/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190808205502-23-week-in-photos-0809-restricted.jpg',
  'https://dynaimage.cdn.cnn.com/cnn/q_auto,h_600/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190808205502-23-week-in-photos-0809-restricted.jpg',
  'https://dynaimage.cdn.cnn.com/cnn/q_auto,h_600/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190808205502-23-week-in-photos-0809-restricted.jpg',
  'https://dynaimage.cdn.cnn.com/cnn/q_auto,h_600/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190808205502-23-week-in-photos-0809-restricted.jpg',
  'https://dynaimage.cdn.cnn.com/cnn/q_auto,h_600/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190808205502-23-week-in-photos-0809-restricted.jpg',
  'https://dynaimage.cdn.cnn.com/cnn/q_auto,h_600/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190808205502-23-week-in-photos-0809-restricted.jpg',
  'https://dynaimage.cdn.cnn.com/cnn/q_auto,h_600/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190808205502-23-week-in-photos-0809-restricted.jpg',
  'https://dynaimage.cdn.cnn.com/cnn/q_auto,h_600/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190808205502-23-week-in-photos-0809-restricted.jpg',
  'https://dynaimage.cdn.cnn.com/cnn/q_auto,h_600/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190808205502-23-week-in-photos-0809-restricted.jpg',
  'https://dynaimage.cdn.cnn.com/cnn/q_auto,h_600/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190808205502-23-week-in-photos-0809-restricted.jpg',
];

Widget photo(String url){
  return Container(
    padding: const EdgeInsets.only(right: 10),
    child: Image(
      image: NetworkImage(url),
      fit: BoxFit.cover,
      height: 150,
      width: 150,
    ),
  );
}

class PicStarp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Photos' ,style: TextStyle(fontSize: 25),),
          SizedBox(height: 5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: pics.map((url) => photo(url)).toList()
            ),
          )
        ],
      ),
    );
  }
}