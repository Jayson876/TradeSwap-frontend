import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:tradeswap_front/models/client_model.dart';
import 'package:tradeswap_front/models/parish_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tradeswap_front/services/client_api.dart';
import 'package:tradeswap_front/services/networkHandler.dart';
import 'package:tradeswap_front/pages/home/homepage.dart';

class ClientSignup extends StatefulWidget {
  const ClientSignup({super.key});

  @override
  State<ClientSignup> createState() => _ClientSignupState();
}

class _ClientSignupState extends State<ClientSignup> {
  int currentStep = 0;
  final formKey = GlobalKey<FormState>();
  final ClientService clientAPI = ClientService();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final emailVal = TextEditingController();
  final usernameVal = TextEditingController();
  final passwordVal = TextEditingController();
  final confirmPass = TextEditingController();
  final cellNum = TextEditingController();
  // final parishID = TextEditingController();
  // final roleID = TextEditingController();
  String first_name = '';
  String last_name = '';
  String email = '';
  String username = '';
  String password = '';
  String parishID = '';
  String roleID = '';
  String error = '';
  // final profilePic = TextEditingController();
  // final bio = TextEditingController();
  // final idUpload = TextEditingController();
  // final hrlyRate = TextEditingController();

  String? parishOpts = 'parish 1';

  List<String> parishes = [
    'parish 1',
    'parish 2',
    'parish 3',
    'parish 4',
    'parish 5',
    'parish 6',
    'parish 7',
    'parish 8',
    'parish 9',
    'parish 10',
    'parish 11',
    'parish 12',
    'parish 13',
    'parish 14',
  ];

  List<dynamic> _Parishes = [];
  String? parishString = '';
  bool isParishSelected = false;
  String parishSelect = '63556f9ddf6e9c413ef6bf5d';
  late Future<List<Parish>> parishList;

  Future<List<Parish>> getParishes() async {
    var resp = await http
        .get(Uri.parse('https://trade-swap-backend.vercel.app/api/v1/parish'));
    if (resp.statusCode == 200) {
      var jsonData = jsonDecode(resp.body)['data'];
      List parList = jsonData;
      return parList.map((ele) {
        return Parish.fromJson(ele);
      }).toList();
    } else {
      return [];
    }
  }

  Future<bool> register(String first_name, String last_name, String email,
      String username, String parishID, String roleID, String password) async {
    try {
      Map registerStatus = jsonDecode(await NetworkHandler.post("/users", {
        "first_name": first_name,
        "last_name": last_name,
        "email": email,
        "username": email,
        "password": password,
        "parishID": parishSelect,
        "roleID": '636e855c7addb6c8cd013c46'
      }));

      if (registerStatus["status"] == 201) {
        signupCompleted(context);
        print("User created");
        print(registerStatus);
        return true;
      } else {
        print(registerStatus["error"]);
      }
    } catch (err) {
      print(err);
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    parishList = getParishes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Registration",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),

      //BODY
      body: Form(
        // autovalidateMode: AutovalidateMode.disabled,
        key: formKey,
        child: SingleChildScrollView(
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                    primary: Color.fromARGB(255, 0, 53, 102))),

            //STEPPER FORM
            child: Stepper(
              steps: getSteps(),
              currentStep: currentStep,

              //STEP TAP FUNCTION
              onStepTapped: (step) {
                formKey.currentState!.validate();

                if (formKey.currentState!.validate() == false) {
                  setState(() {
                    currentStep = currentStep;
                  });
                } else {
                  setState(() {
                    currentStep = step;
                  });
                }
              },

              //NEXT STEP FUNCTION
              onStepContinue: () {
                final isLastStep = currentStep == getSteps().length - 1;
                bool isDetailValid = isDetailComplete();

                if (formKey.currentState!.validate() == false) {
                  setState(() {
                    currentStep = currentStep;
                  });
                } else if (isLastStep) {
                  register(first_name, last_name, email, parishID, roleID,
                      username, password);
                } else {
                  setState(() => currentStep += 1);
                }

                // if (isDetailValid) {}
              },

              //STEP BACK FUCTION
              onStepCancel: () {
                currentStep <= 0 ? null : setState(() => currentStep -= 1);
              },

              //CUSTUM FORM CONTROLS
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                final isLastStep = currentStep == getSteps().length - 1;
                return Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    children: [
                      //CONTINUE / SUBMIT BUTTON
                      Expanded(
                        child: TextButton(
                            onPressed: details.onStepContinue,
                            style: TextButton.styleFrom(
                              elevation: 4,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              backgroundColor:
                                  Color.fromARGB(255, 255, 214, 10),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                            ),
                            child: Text(isLastStep ? 'Submit' : 'Continue')),
                      ),

                      //HORIZONTAL SPACER
                      if (currentStep != 0)
                        const SizedBox(
                          width: 20.0,
                        ),

                      //BACK BUTTON
                      if (currentStep != 0)
                        Expanded(
                          child: TextButton(
                              onPressed: details.onStepCancel,
                              style: TextButton.styleFrom(
                                // elevation: 4,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                // backgroundColor: Color.fromARGB(255, 255, 214, 10),
                                backgroundColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                              ),
                              child: Text('Back')),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  bool isDetailComplete() {
    if (currentStep == 0) {
      if (first_name.isEmpty ||
          last_name.isEmpty ||
          email.isEmpty ||
          username.isEmpty ||
          password.isEmpty ||
          parishID.isEmpty ||
          roleID.isEmpty) {
        return false;
      } else {
        return true;
      }
    }
    // else if (currentStep == 1) {
    //   if ()
    // }
    return false;
  }

  //FORM STEPS LIST
  List<Step> getSteps() => [
        //FORM STEP 1
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text("Account Information"),

          //STEP 1 FORM FIELDS
          content: Column(
            children: [
              //FIRST AND LAST NAME ROW
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  children: [
                    //FIRST NAME FORM FIELD
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        controller: firstName,
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          errorText: 'First name required',
                        ),
                        // controller: firstName,
                        onChanged: (value) {
                          setState(() {
                            first_name = value;
                          });
                        },

                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Enter your first name.';
                        //   }
                        //   return null;
                        // },
                      ),
                    )),

                    //LAST NAME FORM FIELD
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        controller: lastName,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                          errorText: 'Last name required',
                        ),
                        // controller: lastName,
                        onChanged: (value) {
                          setState(() {
                            last_name = value;
                          });
                        },
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Enter your last name.';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                    )),
                  ],
                ),
              ),

              //EMAIL FORM FIELD
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                child: TextField(
                  controller: emailVal,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    errorText: 'Email required',
                  ),
                  // controller: email,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Your email address is required.';
                  //   } else if (value != null &&
                  //       !EmailValidator.validate(value)) {
                  //     return 'Invalid email address.';
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
              ),

              //PASSWORD FORM FIELD
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                child: TextField(
                  controller: passwordVal,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    errorText: 'Password required',
                  ),
                  // controller: password,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Password is required.';
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
              ),

              //CONFIRM PASSWORD FORM FIELD
              // Padding(
              //   padding: const EdgeInsets.only(top: 10.0, right: 10.0),
              //   child: TextField(
              //     keyboardType: TextInputType.visiblePassword,
              //     decoration:
              //         const InputDecoration(labelText: 'Confirm Password'),
              //     // controller: confirmPass,
              //     onChanged: (value) {},
              //     // validator: (value) {
              //     //   if (value == null || value.isEmpty) {
              //     //     return 'Passwords dont match.';
              //     //   } else {
              //     //     return null;
              //     //   }
              //     // },
              //   ),
              // ),

              //CELL NUMBER FORM FIELD
              // Padding(
              //   padding: const EdgeInsets.only(top: 10.0, right: 10.0),
              //   child: TextField(
              //     keyboardType: TextInputType.phone,
              //     decoration: const InputDecoration(labelText: 'Cell Number'),
              //     // controller: cellNum,
              //     onChanged: (value) {},
              //     // validator: (value) {
              //     //   if (value == null || value.isEmpty) {
              //     //     return 'Your mobile number is required.';
              //     //   } else {
              //     //     return null;
              //     //   }
              //     // },
              //   ),
              // ),
            ],
          ),
        ),

        //FORM STEP 2
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: const Text("Location"),
            content: FutureBuilder<List<Parish>>(
                future: parishList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                      child: DropdownButtonFormField<String>(
                        hint: const Text('Select a parish'),
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {});
                        },
                        value: snapshot.data![0].id.toString(),
                        items: snapshot.data!.map((par) {
                          return DropdownMenuItem<String>(
                            value: par.id,
                            child: Text(par.parish_name),
                            onTap: () {
                              setState(() {
                                parishSelect = par.id;
                                print(parishSelect);
                              });
                            },
                          );
                        }).toList(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })),
      ];

  Future<void> signupCompleted(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(''),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Center(child: Text('Registration Complete')),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
              )
            ],
          );
        });
  }
}
