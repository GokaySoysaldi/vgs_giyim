part of 'recommended_bloc.dart';

abstract class RecommendedEvent extends Equatable {
  const RecommendedEvent();

  @override
  List<Object> get props => [];
}

class LoadRecommended extends RecommendedEvent {}

class UpdateRecommended extends RecommendedEvent {
  final List<Recommended> recommended;

  UpdateRecommended(this.recommended);

    @override
  List<Object> get props => [recommended];
}