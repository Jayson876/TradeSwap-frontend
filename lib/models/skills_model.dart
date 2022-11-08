class Skill {
  int id;
  String title;
  String imageURL;

  Skill({
    required this.id,
    required this.title,
    required this.imageURL,
  });
}

List<Skill> skills = [
  Skill(
    id: 1,
    title: 'Painting',
    imageURL: 'assets/icons/painting.png',
  ),
  Skill(
    id: 2,
    title: 'Plumbing',
    imageURL: 'assets/icons/plumbing.png',
  ),
  Skill(
    id: 3,
    title: 'Electrical',
    imageURL: 'assets/icons/electrical.png',
  ),
  Skill(
    id: 4,
    title: 'Pests',
    imageURL: 'assets/icons/pest.png',
  ),
  Skill(
    id: 5,
    title: 'Car & Bike',
    imageURL: 'assets/icons/car.png',
  ),
  Skill(
    id: 6,
    title: 'Applicance',
    imageURL: 'assets/icons/appliance.png',
  ),
  Skill(
    id: 7,
    title: 'Carpentry',
    imageURL: 'assets/icons/saw.png',
  ),
  Skill(
    id: 8,
    title: 'Gadgets',
    imageURL: 'assets/icons/phone.png',
  ),
  Skill(
    id: 9,
    title: 'Beauty',
    imageURL: 'assets/icons/mirror.png',
  ),
];
