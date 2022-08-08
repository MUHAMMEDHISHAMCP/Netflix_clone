// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../../application/download/downloads_bloc.dart' as _i9;
import '../../../../application/fastlaugh/fast_laugh_bloc.dart' as _i10;
import '../../../../application/home/home_bloc.dart' as _i11;
import '../../../../application/hot_and_new/bloc/hot_and_new_bloc.dart' as _i12;
import '../../../../application/search/search_bloc.dart' as _i13;
import '../../../../infrastructure/downloads/downloads_repository.dart' as _i6;
import '../../../../infrastructure/hot_and_new/hot_and_new_repo.dart' as _i4;
import '../../../../infrastructure/search/search_repo.dart' as _i8;
import '../../../hot_and_new/i_hotandnew_repo.dart' as _i3;
import '../../../search/i_search_repo.dart' as _i7;
import '../../i_download_repo.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.HotAndNewService>(() => _i4.HotAndNewImplementation());
  gh.lazySingleton<_i5.IDownloadsRepo>(() => _i6.DownloadRepository());
  gh.lazySingleton<_i7.SearchService>(() => _i8.SearchRepo());
  gh.factory<_i9.DownloadsBloc>(
      () => _i9.DownloadsBloc(get<_i5.IDownloadsRepo>()));
  gh.factory<_i10.FastLaughBloc>(
      () => _i10.FastLaughBloc(get<_i5.IDownloadsRepo>()));
  gh.factory<_i11.HomeBloc>(() => _i11.HomeBloc(get<_i3.HotAndNewService>()));
  gh.factory<_i12.HotAndNewBloc>(
      () => _i12.HotAndNewBloc(get<_i3.HotAndNewService>()));
  gh.factory<_i13.SearchBloc>(() =>
      _i13.SearchBloc(get<_i5.IDownloadsRepo>(), get<_i7.SearchService>()));
  return get;
}
