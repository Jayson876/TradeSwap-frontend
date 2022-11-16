import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:tradeswap_front/models/category_model.dart';
import 'dart:convert';
import 'package:tradeswap_front/models/parish_model.dart';
import 'package:tradeswap_front/services/networkHandler.dart';
import 'package:tradeswap_front/pages/home/homepage.dart';

class TradesmanSignup extends StatefulWidget {
  const TradesmanSignup({super.key});

  @override
  State<TradesmanSignup> createState() => _TradesmanSignupState();
}

class _TradesmanSignupState extends State<TradesmanSignup> {
  int currentStep = 0;
  final formKey = GlobalKey<FormState>();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final emailVal = TextEditingController();
  final passwordVal = TextEditingController();
  // final confirmPass = TextEditingController();
  // final cellNum = TextEditingController();
  // final profilePic = TextEditingController();
  // final bio = TextEditingController();
  // final idUpload = TextEditingController();
  // final hrlyRate = TextEditingController();

  String first_name = '';
  String last_name = '';
  String email = '';
  String username = '';
  String password = '';
  String parishID = '';
  String categoryID = '';
  String roleID = '';
  String error = '';

  String? skillOpts = 'Select a Skill';

  List<String> tradeSkills = [
    'Select a Skill',
    'Skill 1',
    'Skill 2',
    'Skill 3',
    'Skill 4',
    'Skill 5',
    'Skill 6',
    'Skill 7',
    'Skill 8',
    'Skill 9',
    'Skill 10',
  ];

  bool? checkBoxValue = true;
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

  List<dynamic> _Category = [];
  String? categoryString = '';
  String categorySelect = '63557069df6e9c413ef6bf79';
  late Future<List<Category>> catList;

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

  Future<List<Category>> getCategories() async {
    var resp = await http.get(
        Uri.parse('https://trade-swap-backend.vercel.app/api/v1/category'));
    if (resp.statusCode == 200) {
      var jsonData = jsonDecode(resp.body)['data'];
      List categoryList = jsonData;
      return categoryList.map((ele) {
        return Category.fromJson(ele);
      }).toList();
    } else {
      return [];
    }
  }

  Future<bool> register(
    String first_name,
    String last_name,
    String email,
    String username,
    String password1,
    String parishID,
    String categoryID,
    String roleID,
  ) async {
    try {
      Map registerStatus = jsonDecode(await NetworkHandler.post("/users", {
        "first_name": first_name,
        "last_name": last_name,
        "email": email,
        "username": email,
        "password": password,
        "parishID": parishSelect,
        "categoryID": categorySelect,
        "roleID": '636e862044bed1477f01219e'
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
    catList = getCategories();
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
              onStepTapped: (step) {
                formKey.currentState!.validate();
                setState(() {
                  currentStep = step;
                });
              },

              //NEXT STEP FUNCTION
              onStepContinue: () {
                final isLastStep = currentStep == getSteps().length - 1;
                formKey.currentState!.validate();
                bool isDetailValid = isDetailComplete();

                if (isDetailValid) {}

                if (isLastStep) {
                  register(first_name, last_name, email, parishID, roleID,
                      username, password, categoryID);
                } else {
                  setState(() => currentStep += 1);
                }
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
                                  const Color.fromARGB(255, 255, 214, 10),
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
                              child: const Text('Back')),
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
          categoryID.isEmpty ||
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
                        decoration: const InputDecoration(
                            labelText: 'First Name',
                            errorText: 'First name required'),
                        controller: firstName,
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
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            labelText: 'Last Name',
                            errorText: 'Last name required'),
                        controller: lastName,
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'Email', errorText: 'Email address required'),
                  controller: emailVal,
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
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                      labelText: 'Password', errorText: 'password required'),
                  controller: passwordVal,
                  onChanged: (value) {
                    setState(() {
                      password = value;
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
              // Padding(
              //   padding: const EdgeInsets.only(top: 10.0, right: 10.0),
              //   child: TextField(
              //     controller: passwordVal,
              //     keyboardType: TextInputType.visiblePassword,
              //     decoration: const InputDecoration(
              //       labelText: 'Password',
              //       errorText: 'Password required',
              //     ),
              //     // controller: password,
              //     onChanged: (value) {
              //       setState(() {
              //         password1 = value;
              //       });
              //     },
              //     // validator: (value) {
              //     //   if (value == null || value.isEmpty) {
              //     //     return 'Password is required.';
              //     //   } else {
              //     //     return null;
              //     //   }
              //     // },
              //   ),
              // ),

              //CONFIRM PASSWORD FORM FIELD
              // Padding(
              //   padding: const EdgeInsets.only(top: 10.0, right: 10.0),
              //   child: TextField(
              //     keyboardType: TextInputType.visiblePassword,
              //     decoration:
              //         const InputDecoration(labelText: 'Confirm Password'),
              //     controller: confirmPass,
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Passwords dont match.';
              //       } else {
              //         return null;
              //       }
              //     },
              //   ),
              // ),

              //CELL NUMBER FORM FIELD
              // Padding(
              //   padding: const EdgeInsets.only(top: 10.0, right: 10.0),
              //   child: TextField(
              //     keyboardType: TextInputType.phone,
              //     decoration: const InputDecoration(labelText: 'Cell Number'),
              //     controller: cellNum,
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Your mobile number is required.';
              //       } else {
              //         return null;
              //       }
              //     },
              //   ),
              // ),
            ],
          ),
        ),

        //FORM STEP 2
        // Step(
        //   state: currentStep > 1 ? StepState.complete : StepState.indexed,
        //   isActive: currentStep >= 1,
        //   title: const Text("Profile"),
        //   content: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       PROFILE PICTURE FIELD
        //       Padding(
        //         padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
        //         child: TextField(
        //           keyboardType: TextInputType.url,
        //           decoration: const InputDecoration(labelText: 'Profile Photo'),
        //           controller: profilePic,
        //           validator: (value) {
        //             if (value == null || value.isEmpty) {
        //               return 'Upload a photo of yourself.';
        //             } else {
        //               return null;
        //             }
        //           },
        //         ),
        //       ),

        //       //CIRCLE PROFILE PHOTO
        //       CircleAvatar(
        //         radius: 80.0,
        //         backgroundColor: Color.fromARGB(255, 255, 214, 10),
        //       ),

        //       //ABOUT TRADESMAN
        //       const Padding(
        //         padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
        //         child: Text("Tell us about yourself"),
        //       ),

        //       //ABOUT TRADESMAN TEXT AREA
        //       Padding(
        //         padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
        //         child: TextField(
        //           // minLines: 1,
        //           maxLines: 3,
        //           decoration: const InputDecoration(
        //             // labelText: 'Tell us about yourself',
        //             border: OutlineInputBorder(
        //                 borderRadius: BorderRadius.all(Radius.circular(5))),
        //           ),
        //           // controller: bio,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        //FORM STEP 3
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: const Text("Skills"),
            content: FutureBuilder<List<Category>>(
                future: catList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(children: [
                      //SKILL SELECTION DROPDOWN
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 10.0, bottom: 10.0),
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          onChanged: (value) {
                            // skillOpts = value;
                            setState(() {});
                          },
                          value: snapshot.data![0].id.toString(),
                          items: snapshot.data!.map((skill) {
                            return DropdownMenuItem(
                                value: skill.id,
                                child: Text(skill.category_name),
                                onTap: () {
                                  setState(() {
                                    categorySelect = skill.id;
                                    print(categorySelect);
                                  });
                                });
                          }).toList(),
                        ),
                      ),

                      // HOURLY RATE AND NEGOTIABLE OPTION CHECKBOX ROW
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //RATE FORM FIELD
                            // Expanded(
                            //     child: Padding(
                            //   padding: const EdgeInsets.only(right: 10.0),
                            //   child: TextField(
                            //     keyboardType: TextInputType.number,
                            //     decoration:
                            //         const InputDecoration(labelText: 'Rate'),
                            // controller: hrlyRate,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Enter your hourly rate.';
                            //   }
                            //   return null;
                            // },
                            //   ),
                            // )),

                            //CHECKBOX AND LABEL ROW
                            Row(
                              children: <Widget>[
                                //CHECKBOX
                                // Checkbox(
                                //     shape: const RoundedRectangleBorder(
                                //         borderRadius: BorderRadius.all(
                                //             Radius.circular(3))),
                                //     value: checkBoxValue,
                                //     activeColor: const Color(0xFF040F44),
                                //     checkColor: Colors.white,
                                //     onChanged: (bool? value) {
                                //       setState(() {
                                //         checkBoxValue = value;
                                //       });
                                //     }),

                                //LABEL
                                // const Text(
                                //   'Neg.?',
                                //   style: TextStyle(
                                //     color: Color(0xFF040F44),
                                //     fontWeight: FontWeight.w600,
                                //     fontSize: 14,
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]);
                  } else if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.hasError}"));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })),

        //FORM STEP 4
        Step(
            state: currentStep > 3 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 3,
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

        //FORM STEP 5
        // Step(
        //   isActive: currentStep >= 4,
        //   title: const Text("Verification"),
        //   content: Column(
        //     children: [
        //       //ID UPLOAD FIELD
        //       Padding(
        //         padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
        //         child: TextField(
        //           keyboardType: TextInputType.url,
        //           decoration: const InputDecoration(labelText: 'ID Upload'),
        //           controller: idUpload,
        //           validator: (value) {
        //             if (value == null || value.isEmpty) {
        //               return 'Upload an image of your ID.';
        //             } else {
        //               return null;
        //             }
        //           },
        //         ),
        //       ),

        //       //SELFIE UPLOAD FIELD
        //       Padding(
        //         padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
        //         child: TextField(
        //           keyboardType: TextInputType.url,
        //           decoration: const InputDecoration(labelText: 'Selfie Upload'),
        //           controller: idUpload,
        //           validator: (value) {
        //             if (value == null || value.isEmpty) {
        //               return 'Upload an image of yourself.';
        //             } else {
        //               return null;
        //             }
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
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
