import 'package:actv2_form/cardDb/card.dart';
import 'package:actv2_form/cardDb/card_database_helper.dart';
import 'package:scoped_model/scoped_model.dart';

class CardModel extends Model {
  int _stackIndex = 0;
  Card _card = Card("", "", "", "");
  List cardList = [];

  get stackIndex => _stackIndex;
  set stackIndex(int stackIndex) {
    _stackIndex = stackIndex;
    notifyListeners();
  }

  get card => _card;
  set card(Card card) {
    _card = card;
    notifyListeners();
  }

  loadData() async {
    cardList = await DatabaseHelper.helper.getCardList();
    notifyListeners();
  }
}