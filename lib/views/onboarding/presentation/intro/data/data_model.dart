class DataModel {
  final String? title;
  final String? body;
  final String? image;

  DataModel({this.title, this.body, this.image});

  static List<DataModel> getDataModel() {
    List<DataModel> _data = [];
    DataModel _dataModel = DataModel(
        title: 'Find Interesting Projects',
        body: 'Easily find and outsource intresting gigs and projects',
        image: 'assets/images/obnd_one.png');
    _data.add(_dataModel);

    _dataModel = DataModel(
        title: 'Submit Bids and Proposal',
        body: 'Make bids and proposal on gigs and projects',
        image: 'assets/images/obnd_two.png');
    _data.add(_dataModel);

    _dataModel = DataModel(
        title: 'Get Invited for Home Service',
        body: 'Get invites from Artisan for home service projects',
        image: 'assets/images/obnd_three.png');
    _data.add(_dataModel);

    _dataModel = DataModel(
        title: 'Earn on Completed Gigs',
        body: 'Get paid  for projects, and for each milestone completed.',
        image: 'assets/images/obnd_four.png');
    _data.add(_dataModel);

    return _data;
  }
}
