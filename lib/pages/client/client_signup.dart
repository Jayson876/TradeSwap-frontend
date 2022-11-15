import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class ClientSignup extends StatefulWidget {
  const ClientSignup({super.key});

  @override
  State<ClientSignup> createState() => _ClientSignupState();
}

class _ClientSignupState extends State<ClientSignup> {
  int currentStep = 0;
  final formKey = GlobalKey<FormState>();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPass = TextEditingController();
  final cellNum = TextEditingController();
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
                  print("Form Submitted!");
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
      if (firstName.text.isEmpty ||
          lastName.text.isEmpty ||
          email.text.isEmpty ||
          password.text.isEmpty ||
          confirmPass.text.isEmpty ||
          cellNum.text.isEmpty) {
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
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration:
                            const InputDecoration(labelText: 'First Name'),
                        controller: firstName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your first name.';
                          }
                          return null;
                        },
                      ),
                    )),

                    //LAST NAME FORM FIELD
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration:
                            const InputDecoration(labelText: 'Last Name'),
                        controller: lastName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your last name.';
                          } else {
                            return null;
                          }
                        },
                      ),
                    )),
                  ],
                ),
              ),

              //EMAIL FORM FIELD
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email'),
                  controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Your email address is required.';
                    } else if (value != null &&
                        !EmailValidator.validate(value)) {
                      return 'Invalid email address.';
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              //PASSWORD FORM FIELD
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(labelText: 'Password'),
                  controller: password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required.';
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              //CONFIRM PASSWORD FORM FIELD
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration:
                      const InputDecoration(labelText: 'Confirm Password'),
                  controller: confirmPass,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Passwords dont match.';
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              //CELL NUMBER FORM FIELD
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: 'Cell Number'),
                  controller: cellNum,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Your mobile number is required.';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ],
          ),
        ),

        //FORM STEP 2
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text("Location"),
          content: Padding(
            padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
            child: DropdownButtonFormField(
              isExpanded: true,
              onChanged: (value) {
                parishOpts = value;
                setState(() {});
              },
              value: parishOpts,
              items: parishes.map((parish) {
                return DropdownMenuItem(value: parish, child: Text(parish));
              }).toList(),
            ),
          ),
        ),
      ];
}
