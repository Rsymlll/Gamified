class QuestionCrud {
  late FirebaseFirestore db;

  void init() async {
    db = FirebaseFirestore.instance;
  }

  // Get Challenges
  Future<List<Challenge>> getChallenges() async {
    final challenges = db.collection("challenges");
    List<Challenge> list = [];

    try {
      QuerySnapshot snapshot = await challenges.get();
      list = snapshot.docs
          .map((doc) => Challenge.fromFireStore(
                doc as QueryDocumentSnapshot<Map<String, dynamic>>, 
                null, // Pass null for SnapshotOptions
              ))
          .toList();
    } catch (e) {
      print("Error getting challenges: $e");
    }

    return list;
  }

  // Get Chapters for a specific challenge
  Future<List<Chapter>> getChapters(String challengeId) async {
    final chapter = db.collection("challenges").doc(challengeId).collection("chapters");
    List<Chapter> list = [];

    try {
      QuerySnapshot snapshot = await chapter.get();
      list = snapshot.docs
          .map((doc) => Chapter.fromFireStore(
                doc as QueryDocumentSnapshot<Map<String, dynamic>>, 
                null, // Pass null for SnapshotOptions
              ))
          .toList();
    } catch (e) {
      print("Error getting chapters: $e");
    }

    return list;
  }

  // Get Questions for a specific chapter
  Future<List<Question>> getQuestions(String challengeId, String chapterId) async {
    final questionsRef = db
        .collection("challenges")
        .doc(challengeId)
        .collection("chapters")
        .doc(chapterId)
        .collection("questions");

    List<Question> list = [];

    try {
      QuerySnapshot snapshot = await questionsRef.get();
      list = snapshot.docs
          .map((doc) => Question.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error getting questions: $e");
    }

    return list;
  }
}
