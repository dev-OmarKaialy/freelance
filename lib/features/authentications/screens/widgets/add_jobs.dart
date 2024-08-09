import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modules/job)provider.dart';
import '../../modules/job.dart';



class AddJobScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _applyLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Job'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Job Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter job title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _experienceController,
                decoration: InputDecoration(labelText: 'Experience'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter experience';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _applyLinkController,
                decoration: InputDecoration(labelText: 'Apply Link'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter apply link';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final job = Job(
                      title: _titleController.text,
                      experience: _experienceController.text,
                      applyLink: _applyLinkController.text,
                    );
                    Provider.of<JobProvider>(context, listen: false).addJob(job);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Job'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}