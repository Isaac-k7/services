import 'package:achilleservice/blocs/bloc.dart';
import 'package:achilleservice/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    Size mediaSize = MediaQuery.of(context).size;
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, authState) {
        if (authState is AuthenticationStateAuthenticated) {
          return Stack(
            fit: StackFit.loose,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: mediaSize.height,
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                ),
                child: Column(
                  children: [
                    Container(
                      height: mediaSize.height * .6,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/male.png'),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
              ),
              Container(
                height: mediaSize.height * .5,
                width: mediaSize.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(mediaSize.height * .07),
                      topRight: Radius.circular(mediaSize.height * .07),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        '${authState.user.firstName} ${authState.user.lastName}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Rubik',
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        authState.user.username!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Rubik',
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: mediaSize.width*.49,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  t.phone,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  authState.user.phone??'',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          customDivider(height: 50),
                          SizedBox(
                            width: mediaSize.width*.50,
                            child: Column(
                              children: const [
                                Text(
                                  'status',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Non inscrit',
                                  style: TextStyle(
                                    fontSize: 14,
                                    
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: mediaSize.width*.49,
                            child: Column(
                              children: [
                                const Text(
                                  'ville',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  authState.user.cityId??'',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          customDivider(height: 50),
                          SizedBox(
                            width: mediaSize.width*.50,
                            child: Column(
                              children: const [
                                Text(
                                  'status',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Non inscrit',
                                  style: TextStyle(
                                    fontSize: 14,
                                    
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: mediaSize.width*.49,
                            child: Column(
                              children: const [
                                Text(
                                  'ville',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Abidjan',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          customDivider(height: 50),
                          SizedBox(
                            width: mediaSize.width*.50,
                            child: Column(
                              children: const [
                                Text(
                                  'status',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Non inscrit',
                                  style: TextStyle(
                                    fontSize: 14,
                                    
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: mediaSize.width*.49,
                            child: Column(
                              children: const [
                                Text(
                                  'ville',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Abidjan',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          customDivider(height: 50),
                          SizedBox(
                            width: mediaSize.width*.50,
                            child: Column(
                              children: const [
                                Text(
                                  'status',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Non inscrit',
                                  style: TextStyle(
                                    fontSize: 14,
                                    
                                    fontFamily: 'Rubik',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.only(left: mediaSize.width*.15, right: mediaSize.width*.15),
                        child: CustomOutlinedButton(
                            label: const Text("Modifier"),
                            onPressed: (){},
                          ),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return Stack(
          fit: StackFit.loose,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: mediaSize.height,
              decoration: BoxDecoration(
                color: Colors.red.shade100,
              ),
              child: Column(
                children: [
                  Container(
                    height: mediaSize.height * .6,
                  )
                ],
              ),
            ),
            Container(
              height: mediaSize.height * .5,
              width: mediaSize.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(mediaSize.height * .07),
                    topRight: Radius.circular(mediaSize.height * .07),
                  )),
              child: Column(
                children: const [
                  SizedBox(height: 15),
                  Text(
                    'Bienvenue',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Rubik',
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Veuillez créer un compte',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Rubik',
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
  customDivider({double height = 10}){
    return Container(
      color: Colors.grey,
      height: height, 
      width: 1,
    );
  }
}
