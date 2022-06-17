import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/asset_manager.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/shared.dart';


class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var fullNameController = TextEditingController();
    var phoneController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => GlobalCubit(),
      child: BlocConsumer<GlobalCubit,GlobalState>(
        listener: (BuildContext context, state) {

        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            backgroundColor: AppColor.blue,
            body: Container(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(ImgAssets.logo),
                          SizedBox(height: 10,),
                          Container(
                            width: double.infinity,
                            height: 521,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                              color: Colors.white,
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(10.0),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 275,
                                    child: defaultTextFormField(
                                        controller: fullNameController,
                                        type: TextInputType.name,
                                        label: 'Full Name',
                                        validate: (String? value){
                                          if(value!.isEmpty){
                                            return 'Please enter your Name';
                                          }
                                        }

                                    ),
                                  ),
                                  SizedBox(height: 10,),
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
                                  SizedBox(height: 10,),
                                  Container(
                                    width: 275,
                                    child: defaultTextFormField(
                                        controller: phoneController,
                                        type: TextInputType.number,
                                        label: 'Phone',
                                        validate: (String? value){
                                          if(value!.isEmpty){
                                            return 'Please enter your phone number';
                                          }
                                        }
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                              Container(
                                width: 275,
                                child: defaultTextFormField(
                                  controller: passwordController,
                                  type: TextInputType.visiblePassword,
                                  label: 'Password',
                                  suffix: GlobalCubit.get(context).suffix,
                                  validate: (String? value){
                                    if(value!.isEmpty){
                                      return 'Please enter your password';
                                    }
                                  },
                                  isPassword: GlobalCubit.get(context).isPassword,
                                  suffixPressed: () {
                                    GlobalCubit.get(context)
                                        .changePasswordVisibility();
                                  },
                                ),
                              ),
                                  SizedBox(height: 10,),
                              Container(
                                width: 275,
                                child: defaultTextFormField(
                                  controller: confirmPasswordController,
                                  type: TextInputType.visiblePassword,
                                  label: 'Confirm Password',
                                  suffix: GlobalCubit.get(context).suffix,
                                  validate: (String? value){
                                    if(value!.isEmpty){
                                      return 'Please Confirm your password';
                                    }
                                  },
                                  isPassword: GlobalCubit.get(context).isPassword,
                                  suffixPressed: () {
                                    GlobalCubit.get(context)
                                        .changePasswordVisibility();
                                  },
                                ),
                              ),
                                  ),
                                  SizedBox(height: 50,),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: [
                                        defaultButton(
                                            radius:15,
                                            onPressed: () {
                                              if(formKey.currentState!.validate()){
                                                GlobalCubit.get(context).UserRegister(
                                                    name: fullNameController.text,
                                                    email: emailController.text,
                                                    phone: phoneController.text,
                                                    password: passwordController.text,
                                                    confirmPassword: confirmPasswordController.text
                                                );
                                              }
                                              Navigator.pushNamed(context, Routes.userDataRoute);
                                            },
                                            text: 'Register',
                                            width: 115,
                                            background: AppColor.blue
                                        ),
                                        SizedBox(width: 50,),
                                        defaultButton(
                                            radius: 15,
                                            onPressed: () {
                                              Navigator.pushNamed(context, Routes.loginRoute);
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
          );
        },

      ),
    );
  }
}
