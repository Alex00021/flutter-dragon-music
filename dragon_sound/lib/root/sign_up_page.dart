import 'dart:async';
import 'package:dragon_sound/root/phone_page.dart';
import 'package:flutter/material.dart';


/// 注册界面
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  ///账号及验证码各设置一个监听控制器
  final phoneController = TextEditingController();
  final codeController = TextEditingController();

  ///GlobalKey全局标识
  final GlobalKey<FormState> verificationCodeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneNumberKey = GlobalKey<FormState>();

  ///搜索房间号监听key
  final GlobalKey<FormState> inputRoomNumKey = GlobalKey<FormState>();

  ///是否可点击获取验证码按钮
  bool isButtonEnable = true;

  ///账号
  String? phoneNumber;

  ///短信验证码
  String? verificationCode;

  String getCodeText = "获取验证码";

  ///倒计时总秒数
  int count = 61;

  ///设置计时器
  Timer? countDownTimer;

  bool doLogin = false;

  ///是否勾选协议选择框
  bool _checkboxItemA = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: (){
          // 触摸收起键盘,撤销编辑聚焦
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "注册",
                          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                        SizedBox(height: (MediaQuery.of(context).size.height - 200)/2 - 50,),
                        Container(
                            margin: const EdgeInsets.only(left: 30, right: 30),
                            padding: const EdgeInsets.all(20),
                            height: 240,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    // color: Colors.red,  //底色,阴影颜色
                                    offset: Offset(1, 0.5), //阴影位置,从什么位置开始
                                    blurRadius: 1,  // 阴影模糊层度
                                    spreadRadius: 0,  //阴影模糊大小

                                  )
                                ]
                            ),
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
                                            color: Colors.black),
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
                                            color: Colors.black),
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
                                                    color: Colors.black),
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
                                                    color: Colors.black),
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
                                      child:  TextButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.resolveWith((states) {
                                            //设置按下时的背景颜色
                                            if (states.contains(MaterialState.pressed)) {
                                              return Colors.blue[200];
                                            }
                                            //默认不使用背景颜色
                                            return Colors.white;
                                          }),
                                          //设置水波纹颜色
                                          overlayColor: MaterialStateProperty.all(Colors.yellow),
                                          //设置阴影  不适用于这里的TextButton
                                          elevation: MaterialStateProperty.all(4),
                                          //设置按钮内边距
                                          // padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                                          //设置按钮的大小
                                          minimumSize: MaterialStateProperty.all(const Size(40, 20)),
                                          //设置边框
                                          // side:
                                          // MaterialStateProperty.all(const BorderSide(color: Colors.grey, width: 1)),
                                          //外边框装饰 会覆盖 side 配置的样式
                                          shape: MaterialStateProperty.all(const StadiumBorder()),
                                          //更优美的方式来设置
                                          foregroundColor: MaterialStateProperty.resolveWith(
                                                (states) {
                                              // if (states.contains(MaterialState.focused) &&
                                              //     !states.contains(MaterialState.pressed)) {
                                              //   //获取焦点时的颜色
                                              //   return Colors.blue;
                                              // } else if (states.contains(MaterialState.pressed)) {
                                              //   //按下时的颜色
                                              //   return Colors.deepPurple;
                                              // }
                                              // //默认状态使用灰色
                                              // return Colors.grey;
                                                  count < 61
                                                      ? Colors.grey
                                                      : Colors.blueAccent;
                                            },
                                          ),
                                        ),
                                        onPressed: () {
                                          // forgotPassword();
                                          getVerificationCode();
                                        },

                                        child: Text(getCodeText, style: const TextStyle(fontSize: 13)),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 21,),
                                Expanded(
                                  child: TextButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                                          //设置按下时的背景颜色
                                          if (states.contains(MaterialState.pressed)) {
                                            return Colors.blue[200];
                                          }
                                          //默认不使用背景颜色
                                          return Colors.blue;
                                        }),
                                        //设置水波纹颜色
                                        overlayColor: MaterialStateProperty.all(Colors.yellow),
                                        //设置阴影  不适用于这里的TextButton
                                        elevation: MaterialStateProperty.all(4),
                                        //设置按钮内边距
                                        // padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                                        //设置按钮的大小
                                        minimumSize: MaterialStateProperty.all(const Size(130, 56)),
                                        //设置边框
                                        side:
                                        MaterialStateProperty.all(const BorderSide(color: Colors.grey, width: 1)),
                                        //外边框装饰 会覆盖 side 配置的样式
                                        shape: MaterialStateProperty.all(const StadiumBorder()),
                                      ),
                                      onPressed: (){
                                        // inputLogin();
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPages()));
                                      },
                                      child: const Text(
                                        "注册",
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),)),
                                )

                              ],
                            )
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
                    ),
                  ),
                )
            ),
            // 返回
            Positioned(
                left: 20,
                top: 20,
                child: Container(
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  decoration:  BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.0, color: Colors.black12),
                      boxShadow: const [BoxShadow( offset: Offset(1.0, 1.0),    blurRadius: 1.0, spreadRadius: 1.0) ],
                  ),
                  child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.arrow_back_ios, size: 28,)),
                )
            )
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }


  /// 获取短信验证码
  getVerificationCode() async {
    //取消倒计时
    countDownTimer?.cancel();
    countDownTimer = null;
    countDownTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      count--;
      setState(() {
        if ((count == 0)) {
          //倒计时结束取消定时器
          countDownTimer?.cancel();
          isButtonEnable = true;

          //重置倒计时间
          count = 61;

          //再次恢复获取验证码按钮
          getCodeText = "获取验证码";
        } else {
          isButtonEnable = false;

          //更新倒计时内秒数
          getCodeText = "    ${count}s";
        }

        if (count == 52) {
          forgotPassword();
          countDownTimer?.cancel();
          // getCodeText = "获取验证码";
        }
      });
    });
  }

  forgotPassword() {
    String emailField = phoneController.text;
    if (emailField == "520520") {
      // process api here
      alertSample(emailField);
    }
  }

  Future<void> alertSample(email) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Dear Alice,"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Text("发送验证码到 $email"),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("验证码是：52019"),
                    SizedBox(width: 30,),
                    Icon(Icons.favorite_border, color: Colors.red,),
                    SizedBox(width: 12,),
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                doLogin = true;
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> inputLogin() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Text("发送验证码到 $email"),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("是否确定进行登录？\n一旦点击登录，便无法上岸。"),
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("YES"),
              onPressed: () {
                // Navigator.of(context).pop();
                // Navigator.push(context, MaterialPageRoute(builder: (_) => IndexPage()));
                // doLogin = true;
              },
            ),
          ],
        );
      },
    );
  }

}


/*
SafeArea(
      child: Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
                    Text(
                        "注册",
                        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          )
      ),
    )
 */