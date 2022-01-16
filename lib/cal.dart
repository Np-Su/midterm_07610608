import 'dart:math';
import 'dart:io';

class cal{
  double weight = 0;
  double price  = 0;
  String textWeight ='';
  String textPrice ='';
  cal(){

  }
  calulateWeight(double length ,double girth){
    var Mgirth  = girth/100;
    var Mlength = length/100;
    weight = (Mgirth * Mgirth * Mlength) * 69.3;
    //weight.round();
    return weight.round();
  }
  calulatePrice(){
    price  = weight * 112.50;
    return price.round();
  }
  calulateMin(double min){
    var minRound = min*0.97;
    return minRound.round();
  }
  calulateHight(hight){
    var hightRound = hight*1.03;
    return hightRound.round();
  }
}