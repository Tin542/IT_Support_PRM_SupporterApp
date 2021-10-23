class Request {
  final String problem;
  final String description;
  final String device;
  final String idTeamView;
  final String passTeamView;
  final String userEmail;
  final String status;
  Request({
    required this.problem,
    required this.description,
    required this.device,
    required this.idTeamView,
    required this.passTeamView,
    required this.userEmail,
    required this.status,
  });

  factory Request.fromRTDB(Map<dynamic, dynamic> data) {
    return Request(
      problem: data['problem'] ?? '',
      description: data['description'] ?? '',
      device: data['device'] ?? '',
      idTeamView: data['id_teamView'] ?? '',
      passTeamView: data['pass_teamView'] ?? '',
      userEmail: data['user_email'] ?? '',
      status: data['status'] ?? '',
    );
  }
}