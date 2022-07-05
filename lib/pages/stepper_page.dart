import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class AlumniStepperPage extends StatefulWidget {
  AlumniStepperPage({Key? key}) : super(key: key);

  @override
  State<AlumniStepperPage> createState() => _AlumniStepperPageState();
}

class _AlumniStepperPageState extends State<AlumniStepperPage> {
  int activeStep = 0;
  int upperBound = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            IconStepper(
              icons: const [
                Icon(Icons.person),
                Icon(Icons.supervised_user_circle),
              ],
              activeStep: activeStep,
              enableNextPreviousButtons: false,
              enableStepTapping: false,
              activeStepBorderWidth: 0,
              activeStepBorderColor: Colors.transparent,
              activeStepColor: Theme.of(context).colorScheme.surface,
              lineColor: Theme.of(context).colorScheme.primary,
              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
              },
            ),
            if (activeStep < upperBound)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    activeStep++;
                  });
                },
                child: Text('Next'),
              ),
            if (activeStep > 0)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    activeStep--;
                  });
                },
                child: Text('Back'),
              ),
            if (activeStep == upperBound)
              ElevatedButton(
                onPressed: () {},
                child: Text('Save'),
              ),
          ],
        ),
      ),
    );
  }
}
