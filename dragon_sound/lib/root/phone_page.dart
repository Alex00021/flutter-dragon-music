import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/show_toast.dart';

/// 登录页
class LoginPages extends StatefulWidget {
  const LoginPages({Key? key}) : super(key: key);

  @override
  _LoginPagesState createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> with TickerProviderStateMixin {

  /// 分类栏控制器
  TabController? tabController;

  /// 是否隐藏密码
  bool hidePassword = true;

  /// 验证码底文
  String getCodeText = "发送验证码";

  /// 倒计时总秒数
  int count = 61;

  /// 设置计时器
  Timer? countDownTimer;

  /// 是否可点击获取验证码按钮
  bool isButtonEnable = true;

  final GlobalKey<FormState> phoneNumberKey = GlobalKey<FormState>();
  final GlobalKey<FormState> pwdKey = GlobalKey<FormState>();
  final GlobalKey<FormState> codeKey = GlobalKey<FormState>();

  /// 账号及验证码各设置一个监听控制器
  final phoneController = TextEditingController();
  final pwdController = TextEditingController();
  final codeController = TextEditingController();

  /// 账号
  String? phoneNumber;

  /// 密码
  String? pwd;

  /// 验证码
  String? code;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // 全屏宽度和高度
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // 扣除安全区域外的高度（扣掉刘海屏和底部按钮栏高度）
    var padding = MediaQuery.of(context).padding; //GestureDetector
    return Scaffold(
        backgroundColor: CupertinoColors.white,
        // 包裹防止使用键盘输入溢出
        body: new SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: new ConstrainedBox(
              constraints: new BoxConstraints(
                maxHeight: height,
              ),
              child: GestureDetector(
                  onTap: () {
                    // 触摸收起键盘,撤销编辑聚焦
                    FocusScope.of(context).requestFocus(FocusNode()); ///new SingleChildScrollView
                  },
                  child: Stack(alignment: Alignment.topCenter,
                    children: [
                      // image
                      Container(
                        // 装饰
                        decoration: BoxDecoration(
                          // 装饰图片/背景图片
                            image: DecorationImage(
                              image: AssetImage("assets/images/dl.png"),
                              // 图片填充方式
                              fit: BoxFit.cover,
                              // 图片位置
                              alignment: Alignment.topCenter,
                              // 图片平铺方式
                              repeat: ImageRepeat.repeatY,
                            )),
                      ),
                      Positioned(
                        child: Container(
                          width: width,
                          height: height,
                          child: Column(
                            children: [
                              SizedBox(height: 190),
                              Image.asset("assets/images/yr.png", fit: BoxFit.cover, width: 90, height: 90),
                              SizedBox(height: 20),
                              Stack(
                                children: [
                                  Container(
                                      height: 300,
                                      color: Colors.white38,
                                      width: width,
                                      child: Column(
                                          children: [
                                            Container(
                                              child:  TabBar(
                                                  onTap: (index) {
                                                    // 设置监听方法
                                                  },
                                                  // 设置未选中时的字体颜色，tabs里面的字体样式优先级最高
                                                  unselectedLabelColor: Colors.grey,
                                                  // 设置未选中时的字体样式，tabs里面的字体样式优先级最高
                                                  unselectedLabelStyle: TextStyle(fontSize: 20),
                                                  // 设置选中时的字体颜色，tabs里面的字体样式优先级最高
                                                  labelColor: Colors.black,
                                                  // 设置选中时的字体样式，tabs里面的字体样式优先级最高
                                                  labelStyle: TextStyle(fontSize: 20.0),
                                                  // 允许左右滚动
                                                  isScrollable: true,
                                                  // 选中下划线的颜色
                                                  indicatorColor: Colors.black,
                                                  // 选中下划线的长度，label时跟文字内容长度一样，tab时跟一个Tab的长度一样
                                                  // indicatorSize: TabBarIndicatorSize.label,
                                                  //选中下划线的高度，值越大高度越高，默认为2。0
                                                  // indicatorWeight: 6.0,
                                                  controller: tabController,
                                                  tabs: [
                                                    Text("密码登录",style: TextStyle(fontSize: 20.0)),
                                                    Text("快速注册",style: TextStyle(fontSize: 20.0))
                                                  ]),
                                            ),
                                            SizedBox(height: 12),
                                            Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.only(left: 40, right: 40),
                                                  child: TabBarView(
                                                    controller: tabController,
                                                    children: [
                                                      // 密码登录
                                                      pwdLogin(),
                                                      // 快速注册
                                                      getFastRegister(),
                                                    ],
                                                  ),
                                                )
                                            ),
                                            SizedBox(height: 13),
                                          ]
                                      )
                                  )
                                ],
                              ),
                              Spacer(),
                              Container(
                                  margin: EdgeInsets.only(left: 33, right: 33),
                                  child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: new BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(color: Colors.grey, blurRadius: 20.0)
                                                  ],
                                                  color: Colors.orange,
                                                  borderRadius: new BorderRadius.circular((20.0))),
                                              width: 100,
                                              height: 3,
                                            ),
                                            Text("第三方登录"),
                                            Container(
                                              decoration: new BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(color: Colors.grey, blurRadius: 20.0)
                                                  ],
                                                  color: Colors.orange,
                                                  borderRadius: new BorderRadius.circular((20.0))),
                                              width: 100,
                                              height: 3,
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 7,),
                                        Container(
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {

                                                      },
                                                      icon: Image.asset(
                                                          "assets/images/3.0x/icon_facebook3x.png",
                                                          width: 38),
                                                      splashColor: Colors.transparent,
                                                      highlightColor: Colors.transparent),
                                                  IconButton(
                                                      onPressed: () {

                                                      },
                                                      icon: Image.asset(
                                                          "assets/images/3.0x/icon_weibo3x.png",
                                                          width: 38),
                                                      splashColor: Colors.transparent,
                                                      highlightColor: Colors.transparent),
                                                  IconButton(
                                                      onPressed: () {

                                                      },
                                                      icon: Image.asset(
                                                          "assets/images/3.0x/icon_weichat3x.png",
                                                          width: 38),
                                                      splashColor: Colors.transparent,
                                                      highlightColor: Colors.transparent),
                                                ]
                                            )
                                        )
                                      ]
                                  )
                              ),
                              SizedBox(height: 21)
                            ],
                          ),
                        ),
                      )
                    ],
                  )
              ),
            )
        )
    );
  }

  /// 密码登录
  Widget pwdLogin() {
    return Column(
      children: [
        Form(
          key: phoneNumberKey,
          child: Column(
            children: [
              new TextFormField(
                autofocus: false,
                autocorrect: false,
                controller: phoneController,
                keyboardType: TextInputType.phone,
                //当Form表单调用保存方法Save时，回调的函数
                onSaved: (val) {
                  phoneNumber = val;
                },
                // inputFormatters: [
                //   WhitelistingTextInputFormatter.digitsOnly,
                //   LengthLimitingTextInputFormatter(11)
                // ],
                decoration: new InputDecoration(
                    hintText: "请输入您的手机号码",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .accentColor
                                .withOpacity(0.2))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black12)),
                    prefixIcon: Image.asset("assets/images/2.0x/phone_num.png", width: 24, height: 26,)
                ),
              ),
              SizedBox(height: 16),
              Form(
                key: pwdKey,
                child: new TextFormField(
                  controller: pwdController,
                  autofocus: false,
                  autocorrect: false,
                  // inputFormatters: [
                  //   WhitelistingTextInputFormatter.digitsOnly,
                  //   LengthLimitingTextInputFormatter(1000)
                  // ],
                  //当Form表单调用保存方法Save时，回调的函数
                  onSaved: (val) {
                    pwd = val;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(
                      hintText: "请输入密码",
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.2))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black12)),
                      prefixIcon: Image.asset("assets/images/2.0x/pwd.png", width: 26, height: 26,)
                  ),
                ),
              ),
              SizedBox(height: 18),
              FlatButton(
                  minWidth: 300,
                  height: 40,
                  shape: StadiumBorder(),
                  color: Colors.redAccent,
                  onPressed: () {
                    var phoneNumKey = phoneNumberKey.currentState;
                    var pwdNumKey = pwdKey.currentState;
                    if (phoneNumKey!.validate()) {
                      phoneNumKey.save();
                      pwdNumKey!.save();
                      if((phoneNumber?.length == 11) && (pwdController.text == "123456")) {
                        // 跳转到主页
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => MainPage()));
                      } else if (phoneNumber?.length != 11) {
                        ShowToast.show("请先输入正确的手机号");
                      } else if(pwdController.text != "123456") {
                        ShowToast.show("请先输入正确的密码");
                      }
                    }
                  },
                  child: Text("登录",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                      textAlign: TextAlign.center)),
              SizedBox(height: 13),
            ],
          ),
        )
      ],
    );
  }

  /// 快速注册
  Widget getFastRegister() {
    return Column(
      children: [
        Form(
          key: phoneNumberKey,
          child: Column(
            children: [
              new TextFormField(
                autofocus: false,
                autocorrect: false,
                keyboardType: TextInputType.phone,
                controller: phoneController,
                //当Form表单调用保存方法Save时，回调的函数
                onSaved: (val) {
                  phoneNumber = val;
                },
                // inputFormatters: [
                //   WhitelistingTextInputFormatter.digitsOnly,
                //   LengthLimitingTextInputFormatter(11)
                // ],
                decoration: new InputDecoration(
                    hintText: "请输入您的手机号",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .accentColor
                                .withOpacity(0.2))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black12)),
                    prefixIcon: Image.asset("assets/images/2.0x/phone_num.png", width: 24, height: 26,)
                ),
              ),
              SizedBox(height: 12),
              Stack(
                children: [
                  Form(
                    key: codeKey,
                    child: new TextFormField(
                      autofocus: false,
                      autocorrect: false,
                      keyboardType: TextInputType.phone,
                      controller: codeController,
                      //当Form表单调用保存方法Save时，回调的函数
                      onSaved: (val) {
                        code = val;
                      },
                      // inputFormatters: [
                      //   WhitelistingTextInputFormatter.digitsOnly,
                      //   LengthLimitingTextInputFormatter(6)
                      // ],
                      decoration: new InputDecoration(
                        hintText: "请输入验证码",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black12)),
                        prefixIcon: Image.asset("assets/images/2.0x/code.png", width: 24, height: 26,),
                      ),
                    ),
                  ),

                  // 获取 验证码按钮
                  // Positioned(
                  //   right: 1,
                  //   child:  OutlinedButton(
                  //     onPressed: (){
                  //       var numberKey = phoneNumberKey.currentState;
                  //       if (numberKey!.validate()) {
                  //         numberKey.save();
                  //         if (phoneNumber?.length == 11) {
                  //           if (isButtonEnable) {
                  //             getVerificationCode();
                  //             isButtonEnable = false;
                  //           }
                  //         } else {
                  //           return ShowToast.show("请先输入正确的手机号");
                  //         }
                  //       }
                  //
                  //     },
                  //     padding: isButtonEnable == true ? EdgeInsets.all(0) : EdgeInsets.only( right: 14),
                  //     borderSide:new BorderSide(color: Colors.orange, width: 1),
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(28)),
                  //     splashColor: Colors.transparent,
                  //     highlightColor: Colors.transparent,
                  //     textColor: count < 61 ? Colors.grey : Colors.orange,
                  //     child: Text(getCodeText),
                  //   ),
                  // )
                ],
              ),
              SizedBox(height: 12),
              Form(
                key: pwdKey,
                child: new TextFormField(
                  autofocus: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: pwdController,
                  // inputFormatters: [
                  //   WhitelistingTextInputFormatter.digitsOnly,
                  //   LengthLimitingTextInputFormatter(1000)
                  // ],
                  //当Form表单调用保存方法Save时，回调的函数
                  onSaved: (val) {
                    pwd = val;
                  },
                  decoration: new InputDecoration(
                      hintText: "请输入密码",
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.2))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black12)),
                      prefixIcon: Image.asset("assets/images/2.0x/pwd.png", width: 24, height: 26,)
                  ),
                ),
              ),
              SizedBox(height: 18),
              FlatButton(
                  minWidth: 300,
                  height: 40,
                  shape: StadiumBorder(),
                  color: Colors.redAccent,
                  onPressed: () {
                    var phoneNumKey = phoneNumberKey.currentState;
                    var pwdNumKey = pwdKey.currentState;
                    var codeNumKey = codeKey.currentState;
                    if (phoneNumKey!.validate()) {
                      // 保存
                      phoneNumKey.save();
                      pwdNumKey!.save();
                      codeNumKey!.save();
                      // 可随便输入一串数字，只要长度满足11位数即可
                      // 验证码输入长度为6位数
                      // 密码输入设置固定的123456
                      if((phoneNumber!.length == 11) && (code!.length == 6) && (pwdController.text == "123456")) {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => MainPage()));
                      } else if (phoneNumber!.length != 11) {
                        ShowToast.show("请先输入正确的手机号");
                      } else if(code!.length == null) {
                        ShowToast.show("请先输入正确的验证码");
                      } else if(pwdController.text == "123456") {
                        ShowToast.show("请先输入密码");
                      }
                    }},
                  child: Text("注册",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                      textAlign: TextAlign.center)),
              SizedBox(height: 4),
            ],
          ),
        )
      ],
    );
  }

  /// 获取验证码倒计时
  void getVerificationCode() {
    //取消倒计时
    countDownTimer?.cancel();
    countDownTimer = null;
    countDownTimer = new Timer.periodic(new Duration(seconds: 1), (t) {
      count--;
      setState(() {
        if ((count == 0)) {
          //倒计时结束取消定时器
          countDownTimer?.cancel();
          isButtonEnable = true;
          count = 61;
          getCodeText = "发送验证码";
        } else {
          isButtonEnable = false;

          //更新倒计时内秒数
          getCodeText = "    ${count}s";
        }
      });
    });
  }}