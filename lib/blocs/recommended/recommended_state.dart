part of 'recommended_bloc.dart';

abstract class RecommendedState extends Equatable {
  const RecommendedState();

  @override
  List<Object> get props => [];
}

class RecommendedLoading extends RecommendedState {}

class RecommendedLoaded extends RecommendedState {
  final List<Recommended> recommended;

  RecommendedLoaded({this.recommended = const <Recommended>[]});
    @override
  List<Object> get props => [recommended];
}