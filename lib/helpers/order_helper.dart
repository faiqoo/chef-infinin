import 'dart:convert';
import '../../../models/home/experience_list_response.dart' as experienceData;
import '../screens/home/schedule_model.dart';

class OrderHelper {
  late String scheduleId;
  DaysGroup daysGroup = DaysGroup(
      scheduledDate: DateTime(1900 - 12 - 12), dayOfMonth: 0, hours: []);
  late Hour hourSelected;
  late experienceData.T selectedExperienceDetail;
  String noteAdded = '';
  String selectedCategory = 'Couple';
  int numberOfPerson = 4;

  OrderHelper updateChecklist({
    required OrderHelper checkList,
    //required List<CheckListItem> itemList,
  }) {
    return OrderHelper();
  }

  OrderHelper updateOrderHelperItem({
    required OrderHelper checkListItem,
    required Map<String, dynamic> value,
  }) {
    return OrderHelper();
  }
}
