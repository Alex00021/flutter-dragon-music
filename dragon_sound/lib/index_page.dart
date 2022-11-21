import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: const [
              // PageViewIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}


/*
Container(
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        height: 200,
                        child: Column(
                          children: [
                            Form( //Form表单校验验证码输入
                              key: phoneNumberKey,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              child: TextFormField(
                                //当Form表单调用保存方法Save时，回调的函数
                                onSaved: (val) {
                                  phoneNumber = val;
                                },
                                autofocus: false,
                                autocorrect: false,
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
                                enabled: true,
                                decoration: InputDecoration(
                                  //背景颜色，必须结合filled: true,才有效
                                  fillColor: Colors.white24,
                                  filled: true,
                                  //初始状态的输入框样式
                                  // border: InputBorder.none,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 0.9),
                                  ),
                                  prefixIcon:
                                  const Icon(Icons.account_circle),
                                  labelText: "账号",
                                  labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
                                  //编辑状态下的输入框样式
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(30),
                                  ),
                                  //不可编辑状态下的输入框样式
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.white24),
                                  ),
                                  //报错状态下的输入框样式
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 0.8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.white24),
                                  ),
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.auto,
                                ),
                              ),
                            ),
                            const SizedBox(height: 23,),
                            Stack(
                              children: [
                                Container(
                                  child: Form( //Form表单校验验证码输入
                                      key: verificationCodeKey,
                                      autovalidateMode: AutovalidateMode
                                          .onUserInteraction,
                                      child: TextFormField(
                                        onSaved: (val) {
                                          verificationCode = val;
                                        },
                                        autofocus: false,
                                        autocorrect: false,
                                        controller: codeController,
                                        keyboardType:
                                        TextInputType.phone,
                                        enabled: true,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white24,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 0.9),
                                          ),
                                          prefixIcon:
                                          const Icon(Icons.lock),
                                          labelText: "验证码",
                                          labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
                                          //编辑状态下的输入框样式
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(30),
                                          ),
                                          //不可编辑状态下的输入框样式
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                                color: Colors.white24),
                                          ),
                                          //报错状态下的输入框样式
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 0.8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                                color: Colors.white24),
                                          ),
                                          floatingLabelBehavior:
                                          FloatingLabelBehavior
                                              .auto,
                                        ),
                                      )),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 6,
                                  child:  FlatButton(
                                    disabledTextColor: Colors.grey,
                                    splashColor: Colors.transparent,
                                    highlightColor:
                                    Colors.transparent,
                                    onPressed: () {
                                      // forgotPassword();
                                      getVerificationCode();
                                    },
                                    padding: const EdgeInsets.only(top: 0),
                                    textColor: count < 61
                                        ? Colors.grey
                                        : Colors.black,
                                    child: Text(getCodeText, style: const TextStyle(fontSize: 13)),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                    ),
 */