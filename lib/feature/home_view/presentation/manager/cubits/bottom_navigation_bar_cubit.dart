import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationIndeCubit extends Cubit<int> {
  BottomNavigationIndeCubit() : super(0); // Initialize with the default index (0)

  void updateIndex(int index) {
    emit(index); // Emit the new index
  }
}