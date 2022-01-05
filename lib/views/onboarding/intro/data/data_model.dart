class DataModel {
  final String? title;
  final String? body;
  final String? image;

  DataModel({this.title, this.body, this.image});

  static List<DataModel> getDataModel() {
    List<DataModel> _data = [];
    DataModel _dataModel = DataModel(
        title: 'Find Creative Artisans',
        body:
            'Easily find and outsource creative artisans for gigs and services',
        image: 'assets/images/obnd_one.png');
    _data.add(_dataModel);

    _dataModel = DataModel(
        title: 'Get Bids on your Projects',
        body:
            'Get bids from qualified artisans and proposal on your gigs and projects',
        image: 'assets/images/obnd_two.png');
    _data.add(_dataModel);

    _dataModel = DataModel(
        title: 'Track Artisans for Home Service',
        body: 'Get bids on home services from qualified artisan and track them',
        image: 'assets/images/obnd_three.png');
    _data.add(_dataModel);

    _dataModel = DataModel(
        title: 'Pay Artisan for Gigs Completed',
        body: 'Pay artisan for projects completion or milestones',
        image: 'assets/images/obnd_four.png');
    _data.add(_dataModel);

    return _data;
  }
}
