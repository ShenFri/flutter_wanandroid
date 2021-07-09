import 'package:base_library/base_library.dart';
import 'package:dio/dio.dart';
import 'package:flutter_agent_app/common/common.dart';
import 'package:flutter_agent_app/common/component_index.dart';
import 'package:flutter_agent_app/data/api/RSAHelper.dart';
import 'package:flutter_agent_app/data/api/api.dart';
import 'package:flutter_agent_app/data/api/apis.dart';
import 'package:flutter_agent_app/data/protocol/models.dart';
import 'package:flutter_agent_app/utils/util_index.dart';
import 'dart:convert';

class UserRepository {
  Future<LoginModel> login(BaseReq req) async {
    var encode =
        "{\"HEAD\":{\"ACCOUNT_TYPE\":2,\"IP\":\"192.168.10.58\",\"VERSION\":1402,\"TOKEN\":\"9MtidDn0Lh4OAVrF9JSqpXRG6bZZRfXAtwzkxZEsj5hSMUBS/YxZrtinVT5mJ3QFAxBfh2IDG2KMp5mV2blVWQ==\",\"TYPE\":2,\"MAC\":\"a4:93:3f:d7:bf:23\"},\"BODY\":{\"password\":\"123456\" , \"accountType\": 2, \"mobile\":\"13641628648\" }}";
   var encode1 = await RSAHelper().encodeString(encode);
    var message = REQ_MESSAGE(encode1);
    print("--UserRepository--加密后--- " + message.toString());
    var formdata = FormData.from(message.toJson());
    var response =
        await DioUtil().getDio().post(HttpApi.user_login, data:formdata );
    print("--UserRepository--response--- " + response.toString());
    var dncode = await RSAHelper().decodeString(response.data['RESP_MESSAGE']);
    print("--UserRepository--解密后--- " + dncode);
    LoginModel loginModel = LoginModel.fromJson(jsonDecode(dncode));
    return loginModel;
  }

  Future<UserModel> register(RegisterReq req) async {
    BaseRespR<Map<String, dynamic>> baseResp = await DioUtil()
        .requestR<Map<String, dynamic>>(
            Method.post, WanAndroidApi.user_register,
            data: req.toJson());
    if (baseResp.code != Constant.status_success) {
      return Future.error(baseResp.msg);
    }
    baseResp.response.headers.forEach((String name, List<String> values) {
      if (name == "set-cookie") {
        String cookie = values.toString();
        LogUtil.e("set-cookie: " + cookie);
        SpUtil.putString(BaseConstant.keyAppToken, cookie);
        DioUtil().setCookie(cookie);
        //CacheUtil().setLogin(true);
      }
    });
    UserModel model = UserModel.fromJson(baseResp.data);
    //CacheUtil().setUserModel(model);
    SpUtil.putObject(BaseConstant.keyUserModel, model);
    return model;
  }
}
