enum Side implements Comparable<Side> {
  front(title: 'Front 9', lastHole: 9),
  back(title: 'Back 9', lastHole: 18);

  const Side({
    required this.title,
    required this.lastHole,
  });

  final String title;
  final int lastHole;

  @override
  int compareTo(Side other) => lastHole - other.lastHole;
}
