import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modules/job)provider.dart';
import 'add_jobs.dart';

class JobListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Opportunities'),
      ),
      body: Consumer<JobProvider>(
        builder: (context, jobProvider, child) {
          return ListView.builder(
            itemCount: jobProvider.jobs.length,
            itemBuilder: (context, index) {
              final job = jobProvider.jobs[index];
              return ListTile(
                title: Text(job.title),
                subtitle: Text('Experience: ${job.experience}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    jobProvider.removeJob(index);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddJobScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}