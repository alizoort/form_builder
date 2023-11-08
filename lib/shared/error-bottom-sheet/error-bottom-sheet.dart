import 'package:flutter/material.dart';

import '../models/error-wrapper.dart';
import 'constants.dart';

class ErrorBottomSheet extends StatefulWidget {
  final ErrorWrapper errorWrapper;

  const ErrorBottomSheet({Key? key, required this.errorWrapper}) : super(key: key);

  @override
  State<ErrorBottomSheet> createState() => _ErrorBottomSheetState();
}

class _ErrorBottomSheetState extends State<ErrorBottomSheet> {
  List<Widget> widgets=[];
  @override
  initState(){
    super.initState();
    widget.errorWrapper.appErrors.forEach((appError){
      widgets.add(Padding(
        padding: const EdgeInsets.only(bottom:5.0),
        child: Text(appError.message,style:kBottomText),
      ));
    });
  }
  @override
  Widget build(BuildContext context){
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: 140,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 3, 3),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(8, 13, 13, 30),
                //   child: SizedBox(
                //       width: 50,
                //       child:
                //       Image.asset(SISResources().failedLoginLogo)),
                // ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 3, 13, 30),
                      child: SizedBox(
                          height: 100,
                          child: ListView(

                            children: <Widget>[
                              Padding(
                                padding:
                                const EdgeInsets.only(top:3,bottom: 5),
                                child: Text(widget.errorWrapper.title,
                                    style: kBottomText),
                              )
                            ]+widgets,
                          )),
                    ))
              ]),
        ));
  }
}