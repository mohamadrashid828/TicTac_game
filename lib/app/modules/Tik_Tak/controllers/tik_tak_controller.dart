import 'dart:math';

import 'package:get/get.dart';

class TikTakController extends GetxController {
  var winer = "".obs;
  var playerx = true.obs;
  var O = [].obs;
  var X = [].obs;
  var is_computer = false.obs;

  void checkWiner() {
    if (chekelement(O, [0, 1, 2]) ||
        chekelement(O, [0, 3, 6]) ||
        chekelement(O, [0, 4, 8]) ||
        chekelement(O, [2, 5, 8]) ||
        chekelement(O, [2, 4, 6]) ||
        chekelement(O, [3, 4, 5]) ||
        chekelement(O, [6, 7, 8]) ||
        chekelement(O, [1, 4, 7])) {
      winer.value = "O is winner";
    } else if (chekelement(X, [0, 1, 2]) ||
        chekelement(X, [0, 3, 6]) ||
        chekelement(X, [0, 4, 8]) ||
        chekelement(X, [2, 5, 8]) ||
        chekelement(X, [2, 4, 6]) ||
        chekelement(X, [3, 4, 5]) ||
        chekelement(X, [6, 7, 8]) ||
        chekelement(X, [1, 4, 7])) {
      winer.value = "X is winner";
    } else {
      winer.value = "";
    }
  }

  bool chekelement(T, List element) {
    return T.contains(element[0]) &&
        T.contains(element[1]) &&
        (T.contains(element[2]) ?? false);
  }

  computerAction() {
    Random rand = Random();
    int NumberBitween0_9 = rand.nextInt(9);
    if (O.contains(NumberBitween0_9) || X.contains(NumberBitween0_9)) {
      computerAction();
    } else {
      O.add(NumberBitween0_9);
      print("O :" + O.value.toString());
      checkWiner();
      playerx(true);
    }
  }

  void onClickBox(int input) async {
    if (O.length + X.length < 9 && !(X.contains(input) || O.contains(input))) {
      if (playerx.value) {
        player_X_update(input);
        await is_computer.value
            ? Future.delayed(
                Duration(seconds: 1),
                () => computerAction(),
              )
            : "";
      } else {
        is_computer.value ? null : player_O_update(input);
      }
    }
    checkWiner();
  }

  void player_O_update(int input) {
    O.add(input);
    playerx.value = true;
  }

  void player_X_update(int input) {
    X.add(input);
    playerx.value = false;
  }

  void RepeatGame() {
    O.value = [];
    X.value = [];
    is_computer(false);
    playerx(true);
    winer.value = "";
  }
}
