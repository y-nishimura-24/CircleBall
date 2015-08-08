//playerとtitle画面のボール 当たり判定

class Ball {
  private float ballx, bally, r, theta;
  private int O;
  private float enemydis[] = {
    0, 0, 0, 0, 0, 0
  };//プレーヤーと敵の距離（敵５体分の配列）
  private int touchflg = 0;//敵に当たった回数を管理



  Ball(float x, float y, float R, float t, int o) {

    ballx = x;//プレーヤーのx座標
    bally = y;//プレーヤーのy座標
    r = R;//プレーヤーの半径
    theta = t;//プレーヤーの円移動のための角度
    O = o;//円移動に必要な値
  }

  //タイトル画面の自動で回転するボール

  void titleball1() {

    noStroke();
    fill(255, 0, 0);
    ellipse(ballx + 600, bally + 350, r, r);
    theta -= 0.05;
    ballx = O * cos(theta);
    bally = O * sin(theta);

    titleball2();
  }

  //もう片方のタイトルボール

  void titleball2() {

    fill(0, 0, 255);
    ellipse(ballx + 600, bally + 350, r, r);
    ballx = O * -cos(theta);
    bally = O * -sin(theta);

    national_flag.itemeffect();
  }




  //ゲームプレイ中のボール 

  void playerball1() {

    fill(255, 0, 0);
    ellipse(ballx + 600, bally + 350, r, r);
    ballx = O * cos(theta);
    bally = O * sin(theta);
    playerball2();
  }

  //もう片方のゲームプレイ中のボール

  void playerball2() {

    fill(0, 0, 255);
    ellipse(ballx + 600, bally + 350, r, r);
    ballx = O * -cos(theta);
    bally = O * -sin(theta);
    touch();
  }



  //jを押した際の右回転用

  void Right() {
    theta += 0.25;
  }

  //fを押した際の左回転用

  void Left() {
    theta -= 0.25;
  }




  //プレーヤーと敵の当たり判定関数

  void touch() {
    //敵5体それぞれとプレーヤーとの距離をenemydis[0]~dis[4]に格納
    for (int i = 0; i < enemycount; i++) {
      enemydis[i] = dist(ballx + 600, bally + 350, enemy[i].enemyx, enemy[i].enemyy);
    }

    //敵の中心とプレーヤーの中心との距離が30(変動している分も加算する)より小さければ読み込む

    if (enemydis[0] < 30 + enemy[0].dball) {
      //敵を画面上部へ移動させる
      enemy[0].enemyy = 50;
      //アイテムの有無でtouchflgのカウントの変化を管理の関数
      subtouch();
    }
    if (enemydis[1] < 30 + enemy[0].dball) {
      if (other.score <= 1) {//２体目の敵が生成されていない状態では呼び出さない
        return;
      }
      enemy[1].enemyy = 50;
      subtouch();
    }
    if (enemydis[2] < 30 + enemy[0].dball) {
      if (other.score <= 8) {//３体目の敵が生成されていない状態では呼び出さない
        return;
      }
      enemy[2].enemyy = 50;
      subtouch();
    }
    if (enemydis[3] < 30 + enemy[0].dball) {
      if (other.score <= 15) {//４体目の敵が生成されていない状態では呼び出さない
        return;
      }
      enemy[3].enemyy = 50;
      subtouch();
    }
    if (enemydis[4] < 30 + enemy[0].dball) {
      if (other.score <= 15) {//５体目の敵が生成されていない状態では呼び出さない
        return;
      }
      enemy[4].enemyy = 50;
      subtouch();
    }
  }


  //アイテム効果あり時を含めた あたり判定詳細処理
  void subtouch() {
    if (national_flag.itemflg == 1) {
      national_flag.itemflg = 0;
      return;
    }
    touchflg++;
  }
}

