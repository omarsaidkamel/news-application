abstract class NewsAppStates {}

class NewsInitialAppStates extends NewsAppStates{}

class NewsAppNavStates extends NewsAppStates{}

class NewsGetBusinessStates extends NewsAppStates{}

class NewsLoadingBusinessStates extends NewsAppStates{}

class NewsChangeThemeStates extends NewsAppStates{}

class NewsErrorBusinessStates extends NewsAppStates{
  final error;
  NewsErrorBusinessStates(this.error);
}

class NewsGetSportsStates extends NewsAppStates{}

class NewsLoadingSportsStates extends NewsAppStates{}

class NewsErrorSportsStates extends NewsAppStates{
  final error;
  NewsErrorSportsStates(this.error);
}

class NewsGetScienceStates extends NewsAppStates{}

class NewsLoadingScienceStates extends NewsAppStates{}

class NewsErrorScienceStates extends NewsAppStates{
  final error;
  NewsErrorScienceStates(this.error);
}