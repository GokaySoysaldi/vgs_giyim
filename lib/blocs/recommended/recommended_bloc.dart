import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_project/repositories/recommended/recommended_repository.dart';
import '/models/models.dart';
part 'recommended_event.dart';
part 'recommended_state.dart';

class RecommendedBloc extends Bloc<RecommendedEvent, RecommendedState> {
  final RecommendedRepository _recommendedRepository;
  StreamSubscription? _recommendedSubscription;
  RecommendedBloc({required RecommendedRepository recommendedRepository}) 
    : _recommendedRepository = recommendedRepository,
    super(RecommendedLoading());

  @override
  Stream<RecommendedState> mapEventToState(
    RecommendedEvent event,
  ) async* {
    if(event is LoadRecommended) {
      yield* _mapLoadRecommendedsToState();
    }
    if(event is UpdateRecommended) {
      yield* _mapUpdateRecommendedToState(event);
    }
  }


  Stream<RecommendedState> _mapLoadRecommendedsToState() async* {
    _recommendedSubscription?.cancel();
    _recommendedSubscription = _recommendedRepository.getAllRecommended().listen((recommended) => add(UpdateRecommended(recommended)));
  }

  Stream<RecommendedState> _mapUpdateRecommendedToState(UpdateRecommended event) async* {
    yield RecommendedLoaded(recommended: event.recommended);
  }

}