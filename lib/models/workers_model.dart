import 'package:equatable/equatable.dart';

class Worker extends Equatable {
  final String id;
  final String imageUrl;
  final String firstName;
  final String lastName;
  final String emailName;
  final String skill;
  final String contactNumber;
  final double rating;

  const Worker({
    required this.id,
    required this.imageUrl,
    required this.firstName,
    required this.lastName,
    required this.emailName,
    required this.skill,
    required this.contactNumber,
    required this.rating,
  });

  static List<Worker> workers = [
    const Worker(
      id: '1',
      imageUrl:
          'https://static.wixstatic.com/media/57a5a4_b7ac5689a8674b2b8aec56e6366aaae2~mv2.jpg/v1/crop/x_1,y_0,w_475,h_475/fill/w_320,h_320,al_c,q_80,usm_0.66_1.00_0.01/42085900_1451796954951212_77735404137380.jpg',
      firstName: 'Steven',
      lastName: 'Banning',
      emailName: 'sbannging@gmail.com',
      skill: 'Carpenter',
      contactNumber: '8765719235',
      rating: 4.5,
    ),
    const Worker(
      id: '1',
      imageUrl:
          'https://static.wixstatic.com/media/57a5a4_b7ac5689a8674b2b8aec56e6366aaae2~mv2.jpg/v1/crop/x_1,y_0,w_475,h_475/fill/w_320,h_320,al_c,q_80,usm_0.66_1.00_0.01/42085900_1451796954951212_77735404137380.jpg',
      firstName: 'Junior',
      lastName: 'Owens',
      emailName: 'jowens@gmail.com',
      skill: 'Painter',
      contactNumber: '8765501190',
      rating: 3.5,
    ),
    const Worker(
      id: '1',
      imageUrl:
          'https://static.wixstatic.com/media/57a5a4_b7ac5689a8674b2b8aec56e6366aaae2~mv2.jpg/v1/crop/x_1,y_0,w_475,h_475/fill/w_320,h_320,al_c,q_80,usm_0.66_1.00_0.01/42085900_1451796954951212_77735404137380.jpg',
      firstName: 'Mark',
      lastName: 'Watson',
      emailName: 'mwatson@gmail.com',
      skill: 'Plumber',
      contactNumber: '8765501190',
      rating: 4.5,
    ),
  ];

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        firstName,
        lastName,
        emailName,
        skill,
        contactNumber,
        rating,
      ];
}
