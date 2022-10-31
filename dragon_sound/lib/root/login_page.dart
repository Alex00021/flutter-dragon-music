import 'dart:async';

import 'package:dragon_sound/root/sign_up_page.dart';
import 'package:dragon_sound/widget/social_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/or_divider.dart';





class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  ///是否勾选协议选择框
  bool _checkboxItemA = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: GestureDetector(
          onTap: (){
            // 触摸收起键盘,撤销编辑聚焦
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Stack(alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.black38),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: (){
                                  ///TODO
                                },
                                icon: const Icon(Icons.qr_code_scanner_rounded, color: Colors.white,)),
                            GestureDetector(
                              onTap: (){
                                ///TODO
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpPage()));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                alignment: Alignment.center,
                                width: 36,
                                height: 28,
                                child: const Text("注册", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  margin: const EdgeInsets.only(top: 138),
                  padding: const EdgeInsets.only(top: 108, left: 20, right: 20),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(33), topRight: Radius.circular(33)),
                  ),
                  ///
                  child: Column(
                    children: [
                  FlatButton(
                  minWidth: double.infinity - 50,
                      color: Colors.greenAccent,
                      shape: StadiumBorder(),
                      height: 48,
                      onPressed: (){
                        ///TODO
                      }, child: const Text(
                      "微信登录",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 21,),
                      FlatButton(
                          minWidth: double.infinity - 50,
                          color: Colors.lightBlue,
                          shape: const StadiumBorder(),
                          height: 48,
                          onPressed: (){

                          }, child: const Text(
                          "QQ登录",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 21,),
                      FlatButton(
                          minWidth: double.infinity - 50,
                          color: Colors.blueAccent,
                          shape: const StadiumBorder(),
                          height: 48,
                          onPressed: (){

                          }, child: const Text(
                          "手机登录",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 31,),
                      const OrDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SocialIcon(
                            iconSrc: "assets/icons/facebook.svg",
                            press: () {},
                          ),
                          SocialIcon(
                            iconSrc: "assets/icons/twitter.svg",
                            press: () {},
                          ),
                          SocialIcon(
                            iconSrc: "assets/icons/google-plus.svg",
                            press: () {},
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                              checkColor: Colors.orange,
                              activeColor: Colors.black12,
                              value: _checkboxItemA,
                              onChanged: (value) {
                                setState(() {
                                  _checkboxItemA = value!;
                                });
                              }),
                          const Text(
                              "同意",
                              style: TextStyle(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.bold)),
                          GestureDetector(
                            onTap: (){
                              ///TODO
                            },
                            child: const Text(
                                "《用户协议》",
                                style: TextStyle(color: Colors.lightBlue, fontSize: 14, fontWeight: FontWeight.bold))
                          ),
                          const Text(
                              "和",
                              style: TextStyle(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.bold)),
                          GestureDetector(
                            onTap: (){
                              ///TODO
                            },
                            child: const Text(
                                "《隐私政策》",
                                style: TextStyle(color: Colors.lightBlue, fontSize: 14, fontWeight: FontWeight.bold)),
                          )
                        ],
                      )
                    ],
                  )
                ),
              ),
              Positioned(
                child:  Container(
                  margin: const EdgeInsets.only(top: 89),
                  width: 98,
                  height: 98,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.black38),
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/image_head.jpg"), fit: BoxFit.cover)),
                ),
              ),
            ],
          )
        )
    );
  }
}
