import 'package:bloc/bloc.dart';
import 'package:splash_app/feature/user_profile/presentation/manager/cubit/change_profile_ListTile_to_text_form_field_cubit.dart/chage_profile_field_state.dart';

class ChangeProfileFieldCubit extends Cubit<ChangeProfileFieldState> {
  ChangeProfileFieldCubit() : super(TextListTileState());
  void changListTileState({required bool value}) {
    if (value == true) {
      emit(TextListTileState());
    } else {
      emit(TextFormFieldState());
    }
  }
}
