import 'package:card_markethome/index.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required UserProfileUsecase useProfileUsecase,
    required AddressSelectorUsecase addressUsecase,
  })  : _useProfileUsecase = useProfileUsecase,
        _addressUsecase = addressUsecase,
        super(const SplashState());

  final UserProfileUsecase _useProfileUsecase;
  final AddressSelectorUsecase _addressUsecase;

  Future<void> initData() async {
    fetchUserProfile();
  }

  Future<void> saveUserProfile(UserInformationModel userProfile) async {
    await SharedPrefHelper.saveUser(userProfile);
  }

  Future<void> fetchUserProfile() async {
    emit(state.copyWith(onFetchUserProfile: FormzSubmissionStatus.inProgress));

    try {
      final response = await _useProfileUsecase.fetchUserProfile();
      if (response?.user != null) {
        emit(state.copyWith(
          onFetchUserProfile: FormzSubmissionStatus.success,
          userProfile: response?.user,
        ));
        fetchUserAddress();
      }
    } catch (e) {
      emit(state.copyWith(
        onFetchUserProfile: FormzSubmissionStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> fetchUserAddress() async {
    emit(state.copyWith(onFetchUserAddress: FormzSubmissionStatus.inProgress));

    try {
      UserAddressModel? defaultAddress;
      final addresses = await _addressUsecase.fetchUserAddresses();
      if (addresses.isNotEmpty) {
        defaultAddress = addresses.firstWhere(
          (element) => element.isDefault == true,
          orElse: () => addresses.first,
        );
      }

      final userInformation = UserInformationModel.copyWith(
        address: defaultAddress,
        userProfile: state.userProfile,
      );

      await saveUserProfile(userInformation);

      emit(state.copyWith(onFetchUserAddress: FormzSubmissionStatus.success));
    } catch (e) {
      emit(state.copyWith(
        onFetchUserAddress: FormzSubmissionStatus.failure,
        error: e.toString(),
      ));
    }
  }
}
