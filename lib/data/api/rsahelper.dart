import 'dart:convert';
import 'dart:typed_data';

import 'package:base_library/base_library.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:encrypt/encrypt.dart';
class RSAHelper {
  var KEYBIT =2048;
  var publickey = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmG5oFhWc0X1sECO3uxV0pDhLZUiF37n4bEN3kWesPiahiQ+gceFIe3UgxpzEQ+ybqGd3YwSCqgN0qUxboWuNpESMNfzlGiqS+ziyNGbfuXQ2Yb4ksZAkL84uuVckDoUo8DrfkneABCantfkxbKEZ9KIq9yV5Am1VFMhBZIHkJhlntKCg0gmaXdcYTzTGscSnWgSXmUhzEJ45EwaQ69iOaCEsmI8X0ma6duAotYlDlHCEgQPlbJ/tx3PjU3BbyEL6ZWhIQG33mZiekR329dYJ0Uo2ubFcWASY0IDMDdkvV0R8OZuzztzeeblh0OnqI+4hpT6gI//jNXIlTLSa4IRjzQIDAQAB';
  var privateKey = 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCLzn4FlODUMNUx6m+yrWCunHQHnyKIZNmk8AiLm0v3fkGsHGVy3o/CYnVWzzUoidjA11g4N0Jy8MwxpkKvaKJNU1rGTZ7xPrw4XC25GXQCaCrWmSXm6gq8e4aGpcikf+JpXWE7FiL1fCL2woY2N/57TFOO6Qnssrqwu6//C2cri7ncbGT6Zjfxf10Tz7nFL0VcaU63VGk97x4UZgxuaRoW18AxThARB4a44sasUOBbrNGIv7GlTeOE6WI89JZaKFTiBeIz13Nc3E0VsutFZnk7stTAGmwdmmO3qxvOwBBFroNelsgvrsm0Ydl6b2Y/tVeFOYD/HL3Qz/Q8pWFjnehdAgMBAAECggEAM11EM6zFBXCDg3lMXGsSkFRu1LYEq/PReqWtng0KVf2PBzrPkupuCs69qY0rTJ+IgSEdClpTEYOiocMh0OwyZRJw0VaHRL71zAchzVWqp4+53Woa4MGv/BuuCx4xny5U8r0aEelKIsLe3aYORTFBT+9065Z2zP3FVVU/jgaUewyppM9GYMK+1otqJTH+xikBLGECUOE8D5awbfLuAWaihyEaeIF1AeBgGp8t0G17iR0lKlMzZPb9PBzCnCNnw0j9WEGm8T/F6PXOaXdv2JGCH+QimUL46VsRRgEWrPdaGrpYnWwt6wk5JjFejSj7uzwl2WFOK6FvcMB3lp0MZ/uGAQKBgQDHF+WacdF6TmGEls3XRazfXuT7hb0enMzcMEpXizGIPzamc/bIu9qV8ZvMDSCmfYlApd10Y10uYfn5fLolZlBBqBB6N8dossdIDRhm0NnS08AsNCn/+EI4sXivjkO7frT2CW+cZ/g3SoV1FnBxdkAo2fFkp1DsHQQKOaz+EXBkwQKBgQCzxHP1raHzOwaIYSZU+6b63iEDfyAIIKBKTg2sNU+6A09YBtSzQXhdbZI1CfE4dTw6wCJVKCSGv1rZgWnh/FztYlQrCCIVKT7EnFlZkLXJ91nepjR8xWESMozfpvqbpmocUNPzKW5xE9IB3inxZ1MbATK5Q1KqXIznk3Qy3sGenQKBgATSNFIoHW17xmrCiBuFaWlDUAIzO+Ao5eETHkm+aiWlejpPppM30VQ+NIqdasP9WDyDh7hQy6na34XGGm/baWgdnMCI50BGzAKXppaeyheL3yRy4u164oei7Iw7wrIgoFsw4U4FSoJ0QIUUVQa6WVVj6a+JSbFeBoIE4YaJf5JBAoGBAIJzf0q7M5jULottJGnrLGNEKmTlLZN4SZliRt2+2ho8KKnSWyuxyOzThJPkoR29RXXE06VEOi1mU0Effny1q6HAByArCMCea6Q1aUlrj9/+FUNTDSe1/Bk+gagS/i1ReBMQPJ5qZHC+V1lvpLQ/rLkeB3cVebmS69Vo1ZvMtmipAoGAZKbi/PDNYN2CqpXlx5IZpGffSK0/cC7hjvZxDfv4dFcIYYvWESOsWYLU74gxujS71zs30aCDDIJXqKLbNsUaVSL+sBLB/g1gLnMFUDzOYtiwhFaHQIKoMspc+piB153/XA5zoDkVBNFNz8PzKG2WbuuoBEWkkYkquBwsLM0xozk=';
  Future<String> encodeString(String content) async{

    print("--rsahelper--加密前-- " + content);
    var publicKeyStr = await rootBundle.loadString('assets/data/rsa_public.pem');
    var publicKey = RSAKeyParser().parse(publicKeyStr);
    final encrypter = Encrypter(RSA(publicKey: publicKey));

    List<int> sourceBytes = utf8.encode(content);
    int inputLen = sourceBytes.length;
    int maxLen = 245;
    List<int> totalBytes = List();
    for (var i = 0; i < inputLen; i += maxLen) {
      int endLen = inputLen - i;
      List<int> item;
      if (endLen > maxLen) {
        item = sourceBytes.sublist(i, i + maxLen);
      }
      else {
        item = sourceBytes.sublist(i, i + endLen);
      }
      totalBytes.addAll(encrypter.encryptBytes(item).bytes);
    }
    return base64.encode(totalBytes);
      // return await encrypter.encrypt(content).base64.toUpperCase();
  }

   Future<String> decodeString(String content) async{
     print("--rsahelper--解密前--- " + content);
     var publicKeyStr = await rootBundle.loadString('assets/data/rsa_private.pem');
    var publicKey =  RSAKeyParser().parse(publicKeyStr);
    final encrypter = Encrypter(RSA(privateKey: publicKey));

    Uint8List sourceBytes = base64.decode(content);
    int inputLen = sourceBytes.length;
    int maxLen = 256;
    List<int> totalBytes = List();
    for (var i = 0; i < inputLen; i += maxLen) {
      int endLen = inputLen - i;
      Uint8List item;
      if (endLen > maxLen) {
        item = sourceBytes.sublist(i, i + maxLen);
      } else {
        item = sourceBytes.sublist(i, i + endLen);
      }
      totalBytes.addAll(encrypter.decryptBytes(Encrypted(item)));
    }
    return utf8.decode(totalBytes);
//        return await encrypter.decrypt(Encrypted.fromBase64(content));
  }



}