import 'package:chef/constants/constants.dart';
import 'package:chef/helpers/enum_helper.dart';

enum FilterCombination {
  and,
  or,
}

enum FilterTypes {
  contains,
  notContains,
  startsWith,
  endsWith,
  equal,
  notEqual,
}

const filterCombinations = [
  FilterCombination.and,
  FilterCombination.or,
];

const filterTypes = [
  FilterTypes.contains,
  FilterTypes.notContains,
  FilterTypes.endsWith,
  FilterTypes.startsWith,
  FilterTypes.equal,
  FilterTypes.notEqual,
];

class FilterObject {
  FilterObject({
    required this.type,
    required this.value,
  });

  final FilterTypes type;
  final String value;

  FilterObject copyWith({
    FilterTypes? type,
    String? value,
  }) {
    return FilterObject(
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  @override
  String toString() => 'FilterObject(type: $type, value: $value)';
}

String filterCombinationToString(FilterCombination combination) {
  switch (combination) {
    case FilterCombination.and:
      return Strings.filterCombinationAnd;
    case FilterCombination.or:
      return Strings.filterCombinationOr;
  }
}

FilterTypes specifyFilterType(String filterString) {
  if (filterString == EnumHelpers.humanize(FilterTypes.contains)) {
    return FilterTypes.contains;
  } else if (filterString == EnumHelpers.humanize(FilterTypes.notContains)) {
    return FilterTypes.notContains;
  } else if (filterString == EnumHelpers.humanize(FilterTypes.endsWith)) {
    return FilterTypes.endsWith;
  } else if (filterString == EnumHelpers.humanize(FilterTypes.startsWith)) {
    return FilterTypes.startsWith;
  } else if (filterString == EnumHelpers.humanize(FilterTypes.equal)) {
    return FilterTypes.equal;
  } else if (filterString == EnumHelpers.humanize(FilterTypes.notEqual)) {
    return FilterTypes.notEqual;
  } else {
    return FilterTypes.contains;
  }
}

FilterCombination specifyFilterCombination(String combinationString) {
  if (combinationString == Strings.filterCombinationAnd) {
    return FilterCombination.and;
  } else {
    return FilterCombination.or;
  }
}
