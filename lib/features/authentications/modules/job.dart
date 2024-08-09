class Job {
  final String title;
  final String experience;
  final String applyLink;

  Job({required this.title, required this.experience, required this.applyLink});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json['title'],
      experience: json['experience'],
      applyLink: json['apply_link'],
    );
  }
}
