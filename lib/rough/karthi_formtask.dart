import 'package:flutter/material.dart';

class Formtask extends StatefulWidget {
  const Formtask({super.key});

  @override
  State<Formtask> createState() => _FormtaskState();
}

class _FormtaskState extends State<Formtask> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageContoller = TextEditingController();
  TextEditingController _rollnoController = TextEditingController();

  List<Map<String, String>> registerData = [];
  var formKey = GlobalKey<FormState>();

  submitForm() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    print("Sunmit form triggered");
    String name = _nameController.text;
    String rollNo = _rollnoController.text;
    String age = _ageContoller.text;

    setState(() {
      registerData.add({
        "Name": name,
        "Age": age,
        "Roll No": rollNo,
      });
      _nameController.clear();
      _rollnoController.clear();
      _ageContoller.clear();
    });
  }

  void _edit(int Index) {
    showDialog(
        context: context,
        builder: (BuildContext Context) {
          return AlertDialog(
            title: Text("Edit"),
            actions: [
              FloatingActionButton(onPressed: () {
                Navigator.of(context).pop();
              })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Form",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                validator: (val) {
                  if (val!.length == 0) {
                    return "required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                  label: Text("Name"),
                  hintText: "Enter Your Name",
                ),
                keyboardType: TextInputType.text,
                // validator: (value) {
                //   if (value!.isNotEmpty){
                //     return null;
                //   }
                //   else ("required");
                // },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              TextFormField(
                controller: _rollnoController,
                validator: (val) {
                  if (val!.length == 0) {
                    return "required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                  label: Text("RollNo"),
                  hintText: "Enter Your Roll Number",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              TextFormField(
                controller: _ageContoller,
                validator: (val) {
                  if (val!.length == 0) {
                    return "required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                  label: Text("Age"),
                  hintText: "Enter Your Age",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ElevatedButton(
                  onPressed: () {
                    submitForm();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Center(
                    child: Text(
                      "Insert",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16),
                    ),
                  )),
              Expanded(
                  child: ListView.builder(
                      itemCount: registerData.length,
                      itemBuilder: (BuildContext Context, int index) {
                        return GestureDetector(
                          onTap: () => _edit(index),
                          child: Card(
                            child: ListTile(
                                title: Text(registerData[index]["Name"] ?? " "),
                                subtitle: Column(
                                  children: [
                                    Text(registerData[index]["Roll No"] ?? " "),
                                    Text(registerData[index]["Age"] ?? " "),
                                  ],
                                )),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
