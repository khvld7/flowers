import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskflower/components/custom_button.dart';
import 'package:taskflower/components/custom_textfield.dart';
import 'package:taskflower/components/input_formatter.dart';

class ConfirmWidget extends StatefulWidget {
  const ConfirmWidget({super.key});

  @override
  State<ConfirmWidget> createState() => _ConfirmWidgetState();
}

class _ConfirmWidgetState extends State<ConfirmWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  bool checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          margin: EdgeInsets.only(left: 25),
          child: RawMaterialButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/icons/back_button.svg',
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Оформление',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF-Pro-Display'),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Color.fromRGBO(137, 106, 219, 1),
        toolbarHeight: 100,
      ),
      body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: 10, bottom: 50),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextfield(
                      prefixIcon: SvgPicture.asset(
                        'assets/icons/user_icon.svg',
                      ),
                      name: 'Ваше имя',
                      onChanged: (value) {
                        value = nameController.value.text;
                      },
                      hintText: 'Как к вам обратиться',
                      keyboardType: TextInputType.text,
                      controller: nameController,
                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextfield(
                      prefixIcon:
                          SvgPicture.asset('assets/icons/phone_icon.svg'),
                      name: 'Номер телефона',
                      onChanged: (value) {
                        value = phoneController.value.text;
                      },
                      hintText: '+7 ххх ххх хх хх',
                      inputFormatters: [
                        PhoneInputFormatter(),
                      ],
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      textInputAction: TextInputAction.done,
                    ),
                    CustomTextfield(
                      prefixIcon:
                          SvgPicture.asset('assets/icons/mailbox_icon.svg'),
                      name: 'Электронная почта',
                      onChanged: (value) {
                        value = mailController.value.text;
                      },
                      hintText: '******@mail.com',
                      keyboardType: TextInputType.emailAddress,
                      controller: mailController,
                      textInputAction: TextInputAction.done,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 12, right: 8),
                          height: 24,
                          width: 24,
                          child: CustomButton(
                              onPressed: () {
                                setState(() {
                                  checkBox = !checkBox;
                                });
                              },
                              child: checkBox == false
                                  ? SvgPicture.asset(
                                      'assets/icons/check_box.svg')
                                  : SvgPicture.asset(
                                      'assets/icons/active_icon/check_box_active.svg')),
                        ),
                        Expanded(
                          child: Text(
                            'Я хочу получать уведомления о скидках и акционных предложениях',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'SF-Pro-Display',
                            ),
                          ),
                        )
                      ],
                    ),
                    CustomTextfield(
                      prefixIcon:
                          SvgPicture.asset('assets/icons/comment_icon.svg'),
                      name: 'Комментарий',
                      onChanged: (value) {
                        value = commentController.value.text;
                      },
                      hintText: 'Ваш комментарий к заказу',
                      keyboardType: TextInputType.text,
                      controller: commentController,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
              ),
            ),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                color: commentController.value.text.isEmpty ||
                        nameController.value.text.isEmpty ||
                        phoneController.value.text.isEmpty ||
                        mailController.value.text.isEmpty
                    ? Color.fromRGBO(212, 212, 212, 1)
                    : Color.fromRGBO(137, 106, 219, 1),
                height: 36,
                onPressed: commentController.value.text.isEmpty ||
                        nameController.value.text.isEmpty ||
                        phoneController.value.text.isEmpty ||
                        mailController.value.text.isEmpty
                    ? () {}
                    : () => showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                                shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(16)),
                                alignment: Alignment.center,
                                title: Center(
                                  child: Text(
                                    'Заказ сформирован',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'SF-Pro-Display'),
                                  ),
                                ),
                                content: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Text(
                                    'С вами свяжется первый освободившийся оператор',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'SF-Pro-Display'),
                                  ),
                                ),
                                actions: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomButton(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        height: 35,
                                        textColor: Colors.black,
                                        border: Border.all(
                                          color:
                                              Color.fromRGBO(137, 106, 219, 1),
                                        ),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text(
                                          'Закрыть',
                                          style: TextStyle(
                                              fontFamily: 'SF-Pro-Display',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      CustomButton(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        height: 35,
                                        color: Color.fromRGBO(137, 106, 219, 1),
                                        onPressed: () {
                                          Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            '/screens',
                                            (Route<dynamic> route) => false,
                                          );
                                        },
                                        child: Text(
                                          'В каталог',
                                          style: TextStyle(
                                              fontFamily: 'SF-Pro-Display',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  )
                                ])),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Text(
                      'Оформить',
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
