class Futsal {
  String imageUrl;
  String name;
  String textLocation;
  int ratings;
  int price;
  List location;

  Futsal({
    this.imageUrl,
    this.name,
    this.textLocation,
    this.ratings,
    this.price,
    this.location
  });
}

List<Futsal> futsals = [
  Futsal(
    imageUrl: 'https://i.pinimg.com/236x/6a/a0/06/6aa00618b05dde30d1bcb27d9cdf12c3--fc-barcelona-logo-barcelona-soccer.jpg',
    name: 'Shooters',
    textLocation: 'Suryabinayak, Bhaktapur',
    ratings: 4,
    price: 1000,
    location:[27.666625, 85.426620],
  ),
  Futsal(
    imageUrl: 'https://previews.123rf.com/images/captainvector/captainvector1601/captainvector160116330/51707955-football-club-logo.jpg',
    name: 'Khwopa Futsal and Training Center',
    textLocation: 'Pandubazar, Bhaktapur',
    ratings: 5,
    price: 900,
    location: [27.664560, 85.422078],
  ),
  Futsal(
    imageUrl: 'https://qph.fs.quoracdn.net/main-qimg-82741eac29dda5436f1334d8f6faf69f.webp',
    name: 'Khwopa Futsal',
    textLocation: 'Liwali, Bhaktapur',
    ratings: 3,
    price: 800,
    location: [27.671037, 85.441011],
  ),
  Futsal(
    imageUrl: 'https://c8.alamy.com/comp/MC23PM/manchester-city-football-club-logo-MC23PM.jpg',
    name: 'Glory Futsal',
    textLocation: 'Shrijana-nagar, Bhaktapur',
    ratings: 3,
    price: 1200,
    location: [27.662268, 85.423466],
  )
];
