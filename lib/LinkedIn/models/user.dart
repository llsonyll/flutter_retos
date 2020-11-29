class User {
  final String photo;
  final String name;
  final String ocupation;
  final String location;
  final List<Activity> activity;
  final int connections;
  final int profile;

  const User({
    this.photo,
    this.name,
    this.ocupation,
    this.activity,
    this.location,
    this.connections,
    this.profile,
  });
}

class Activity {
  final String name;
  final String title;
  final String description;
  final String image;
  final String date;

  const Activity({
    this.name,
    this.title,
    this.description,
    this.image,
    this.date,
  });
}

const user = User(
  name: 'Josep Jairo Rojas',
  photo: 'assets/',
  location: 'Cusco, Peru',
  connections: 990,
  profile: 64,
  ocupation: 'Flutter learning',
  activity: const [
    Activity(
      name: 'About',
      description: 'Hola, yo soy Josep',
    ),
    Activity(
      name: 'Learning',
      title: 'WorldConnect > App Learning',
      description: 'Trabajando ando',
      date: '1 minute ago',
      image: 'assets/linked_in/images/learning.png',
    ),
    Activity(
      name: 'Gaming',
      title: 'VideoGames > MMO',
      description: 'De chill jugando',
      date: '1 hour ago',
      image: 'assets/linked_in/images/gaming.jpg',
    ),
    Activity(
      name: 'Studies',
      title: 'UAC - EPIS',
      description: 'Estudiando ando',
      date: '2015-2020',
      image: 'assets/linked_in/images/education.jpg',
    )
  ],
);
