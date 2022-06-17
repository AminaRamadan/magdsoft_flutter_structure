import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/shared.dart';


class UserDataScreen extends StatelessWidget {

  final AccountModel accountModel ;

  const UserDataScreen({Key? key,  required this.accountModel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(

        create: (context) => GlobalCubit(),
        child: BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context,state) {
            if(state is LoginSuccessState){

            }
          },
          builder: (context,state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColor.blue,
                title: const Text(
                  'User Data',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 125),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Name : ${accountModel.account![0].name} ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        'Email : ${accountModel.account![0].email}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        'Phone : ${accountModel.account![0].phone}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      Center(
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
                  ),
                ),
              ),
            );
          },
        )
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