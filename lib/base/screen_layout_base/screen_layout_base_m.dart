import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chef/models/workspace.dart';
import 'package:chef/base/base.dart';

part 'screen_layout_base_m.freezed.dart';

@freezed
class ScreenLayoutBaseState extends BaseState with _$ScreenLayoutBaseState {
  const factory ScreenLayoutBaseState.initialized() = Initialized;
  const factory ScreenLayoutBaseState.loaded(Workspace? workspace) = Loaded;
}
