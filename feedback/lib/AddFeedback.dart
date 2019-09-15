import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFeedback extends StatefulWidget {
  @override
  _AddFeedbackState createState() => _AddFeedbackState();
}

class _AddFeedbackState extends State<AddFeedback> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Feedback'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            formField("Enter Name", "Name", nameController),
            formField("ENter Email", "Email", emailController),
            formField("Feedback", "Feedback", feedbackController),
            RaisedButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text('Submit'),
              onPressed: () async {
                Map<String, dynamic> feedback = Map();
                feedback['name'] = nameController.text;
                feedback['email'] = emailController.text;
                feedback['feedback'] = feedbackController.text;
                await Firestore.instance.collection('feedback').add(feedback);
                setState(() {
                  nameController.clear();
                  emailController.clear();
                  feedbackController.clear();
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget formField(
      String hint, String label, TextEditingController _textController) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
      ),
      controller: _textController,
    );
  }
}
