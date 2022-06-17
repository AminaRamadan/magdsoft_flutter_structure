import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/shared.dart';


class UserDataScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = GlobalCubit.get(context).accountModel;


        return Scaffold(
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 90,
                color: AppColor.blue,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'User Data',
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 20.0
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 80),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Name: ',
                            style: TextStyle(
                              color: AppColor.blue,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '${model.account![0].name}',
                            style: TextStyle(
                              color: AppColor.blue,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(
                            'Email: ',
                            style: TextStyle(
                              color: AppColor.blue,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '${model.account![0].email}',
                            style: TextStyle(
                              color: AppColor.blue,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(
                            'Phone: ',
                            style: TextStyle(
                              color: AppColor.blue,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '${model.account![0].phone}',
                            style: TextStyle(
                              color: AppColor.blue,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 296,),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: defaultButton(
                                radius:15,
                                onPressed: () {
                                  signOut(context);
                                },
                                text: 'Log Out',
                                width: 115,
                                background: AppColor.red
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  
  
}

void signOut(context){
  CacheHelper.removeData(key: "id").then((value) {
    if(value){
      Navigator.pushNamed(context, Routes.loginRoute);
    }
  });
}