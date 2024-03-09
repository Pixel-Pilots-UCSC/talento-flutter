class Job {
  final String title;
  final String company;
  final String location;
  final String salary;
  final String imageUrl;
  final bool bookmarked;
  final String jobType;

  const Job({
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.imageUrl,
    this.bookmarked = false, // Set default value for bookmarked
    required this.jobType,
  });
}