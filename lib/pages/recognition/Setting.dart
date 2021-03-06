import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PwControllor.dart';

class PwSetting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PwSettingState();
  }
}

class _PwSettingState extends State<PwSetting> {
  int _PwType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var tempWhich = getWhichPw();
    tempWhich.then((value) {
      setState(() {
        _PwType = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("密码设置"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.lock_open),
            title: Text("登入密码"),
            trailing: Switch(
              value:
                  this._PwType == 1 || this._PwType == 2 || this._PwType == 3,
              onChanged: (value) {
                setState(() {
                  this._PwType = value ? 1 : -1;
                  setWhichPw(this._PwType);
                  if (value == true)
                    Navigator.pushNamed(context, "/StringPwSetting");
                });
              },
            ),
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.short_text),
              title: Text("字符密码"),
              trailing: Radio(
                value: 1,
                onChanged: (value) {
                  setState(() {
                    this._PwType = value;
                    setWhichPw(1);
                  });
                  Navigator.pushNamed(context, "/StringPwSetting");
                },
                groupValue: this._PwType,
              ),
              enabled:
                  this._PwType == 1 || this._PwType == 2 || this._PwType == 3,
              onTap: () {
                setState(() {
                  this._PwType = 1;
                  setWhichPw(1);
                });
                Navigator.pushNamed(context, "/StringPwSetting");
              }),
          ListTile(
              leading: Icon(Icons.gesture),
              title: Text("手势密码"),
              trailing: Radio(
                value: 2,
                onChanged: (value) {
                  setState(() {
                    this._PwType = value;
                    setWhichPw(2);
                  });
                  Navigator.pushNamed(context, "/GesturePwSetting");
                },
                groupValue: this._PwType,
              ),
              enabled:
                  this._PwType == 1 || this._PwType == 2 || this._PwType == 3,
              onTap: () {
                setState(() {
                  this._PwType = 2;
                  setWhichPw(2);
                });
                Navigator.pushNamed(context, "/GesturePwSetting");
              }),
          ListTile(
              leading: Icon(Icons.fingerprint),
              title: Text("指纹密码"),
              trailing: Radio(
                value: 3,
                onChanged: (value) {
                  setState(() {
                    this._PwType = value;
                    setWhichPw(3);
                  });
                },
                groupValue: this._PwType,
              ),
              enabled:
                  this._PwType == 1 || this._PwType == 2 || this._PwType == 3,
              onTap: () => Navigator.pushNamed(context, "/FingerPwSetting")),
        ],
      ),
    );
  }
}
