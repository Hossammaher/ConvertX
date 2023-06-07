class CurrencyModel
{

  dynamic rate ;
  dynamic result ;

  CurrencyModel({required this.rate, required this.result});

  factory CurrencyModel.fromJson(dynamic data){

    return CurrencyModel(rate: data['info']['rate'], result: data['result']);
  }


  @override
  String toString() {
    // TODO: implement toString
    return 'result is $result';
  }
}