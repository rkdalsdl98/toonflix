class EpisodeModel {
  final String episodeId, title, uptime;
  final int day;

  EpisodeModel.fromJson(Map<String, dynamic> json)
      : episodeId = json['episode_id'] == 'Null' ? '1' : json['episode_id'],
        title = json['title'],
        uptime = json['uptime'],
        day = json['day'];
}
