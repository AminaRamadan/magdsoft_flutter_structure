import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/asset_manager.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/shared.dart';


class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => GlobalCubit(),
      child: BlocConsumer<GlobalCubit,GlobalState>(
        listener: (BuildContext context, Object? state) {  },
        builder: (BuildContext context, state) {
          return Scaffold(
            backgroundColor: AppColor.blue,
            body: Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(ImgAssets.logo),
                            SizedBox(height: 20,),
                            Container(
                              width: double.infinity,
                              height: 443,
                              decoration:const  BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                ),
                                color: Colors.white,
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 275,
                                      child: defaultTextFormField(
                                        controller: emailController,
                                        type: TextInputType.emailAddress,
                                        label: 'Email',
                                          validate: (String? value){
                                            if(value!.isEmpty){
                                              return 'Please enter your email address';
                                            }
                                          }
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Container(

                                      width: 275,
                                      child: defaultTextFormField(
                                        controller: passwordController,
                                        type: TextInputType.visiblePassword,
                                        label: 'Password',
                                        suffix: Icons.visibility_off,
                                        validate: (String? value){
                                          if(value!.isEmpty){
                                            return 'Password is too short';
                                          }
                                        }
                                      ),
                                    ),
                                    SizedBox(height: 80,),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          defaultButton(
                                              radius:15,
                                              onPressed: () {
                                                Navigator.pushNamed(context, Routes.registerRoute);
                                              },
                                              text: 'Register',
                                              width: 115,
                                              background: AppColor.blue

                                          ),
                                          SizedBox(width: 50,),
                                          defaultButton(
                                              radius: 15,
                                              onPressed: () {

                                                if(formKey.currentState!.validate()){
                                                  GlobalCubit.get(context).UserLogin(
                                                    email: emailController.text,
                                                    password: passwordController.text,
                                                  );
                                                  Navigator.pushNamed(context, Routes.userDataRoute);
                                                }

                                              },
                                              text: 'Login',
                                              width: 115,
                                              background: AppColor.blue
                                          ),

                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),



            ),
          );
        },
      ),
    );
  }
}


