import 'dart:typed_data';

import 'package:elliptic/elliptic.dart';
import 'package:schnorr/schnorr.dart';

void main() {
  var ec = getSecp256k1();
  var privateKey = '38dab9461e04359a85787e0f6fa6cfc620c865dd26c4bb1e70b06bb1a91f5a8c';
  var messageHex ='6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b';

  var priv = PrivateKey.fromHex(ec, privateKey);

  var pub = priv.publicKey;


  var hash = List<int>.generate(messageHex.length ~/ 2,
      (i) => int.parse(messageHex.substring(i * 2, i * 2 + 2), radix: 16));

  var signature = deterministicSignHex(priv, hash);

  print("------------------------------------");
  print(signature);
  print("------------------------------------");
}
