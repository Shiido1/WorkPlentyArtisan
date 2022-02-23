part of 'gig_bloc.dart';

abstract class GigEvent extends Equatable {
  const GigEvent();

  @override
  List<Object> get props => [];
}

class SaveGigEvent extends GigEvent {
  final GigEntity entity;
  SaveGigEvent(this.entity);
}

class RemoveGigEvent extends GigEvent {
  final GigEntity entity;
  RemoveGigEvent(this.entity);
}

class BidGigEvent extends GigEvent {
  final GigEntity entity;
  BidGigEvent(this.entity);
}
