import 'package:flutter/material.dart';
import 'job.dart';

class JobProvider with ChangeNotifier {
  List<Job> _jobs = [];

  List<Job> get jobs => _jobs;

  void addJob(Job job) {
    _jobs.add(job);
    notifyListeners();
  }

  void removeJob(int index) {
    _jobs.removeAt(index);
    notifyListeners();
  }
}