import 'package:sleep_care/common/base/base_controller.dart';
import 'package:sleep_care/domain/model/comment.dart';

class RatingController extends BaseController {
  int? newStar;
  String? newComment;
  final List<Comment> comments = [Comment.test(), Comment.test()];

  void changeNewStar(int index){
    newStar = index;
    notifyListeners();
  }

  void tryAddComment() {
    if (newStar != null && newComment != null) {
      comments.add(Comment(newStar! + 1, newComment!, 'Daria'));
      newStar = 0;
      notifyListeners();
    }
  }
}
