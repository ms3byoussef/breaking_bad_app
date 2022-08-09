part of 'quote_cubit.dart';

@immutable
abstract class QuoteState {}

class QuoteInitial extends QuoteState {}

class QuoteLoaded extends QuoteState {
  final List<Quote> quotes;
  QuoteLoaded({
    required this.quotes,
  });
}
