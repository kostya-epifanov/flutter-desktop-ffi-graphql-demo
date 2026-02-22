class Input$CurrenciesWhere {
  factory Input$CurrenciesWhere({
    Input$CurrencyFilter? Currency,
    Input$IntervalFilter? Interval,
    Input$BlockFilter? Block,
  }) => Input$CurrenciesWhere._({
    if (Currency != null) r'Currency': Currency,
    if (Interval != null) r'Interval': Interval,
    if (Block != null) r'Block': Block,
  });

  Input$CurrenciesWhere._(this._$data);

  factory Input$CurrenciesWhere.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('Currency')) {
      final l$Currency = data['Currency'];
      result$data['Currency'] = l$Currency == null
          ? null
          : Input$CurrencyFilter.fromJson((l$Currency as Map<String, dynamic>));
    }
    if (data.containsKey('Interval')) {
      final l$Interval = data['Interval'];
      result$data['Interval'] = l$Interval == null
          ? null
          : Input$IntervalFilter.fromJson((l$Interval as Map<String, dynamic>));
    }
    if (data.containsKey('Block')) {
      final l$Block = data['Block'];
      result$data['Block'] = l$Block == null
          ? null
          : Input$BlockFilter.fromJson((l$Block as Map<String, dynamic>));
    }
    return Input$CurrenciesWhere._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CurrencyFilter? get Currency =>
      (_$data['Currency'] as Input$CurrencyFilter?);

  Input$IntervalFilter? get Interval =>
      (_$data['Interval'] as Input$IntervalFilter?);

  Input$BlockFilter? get Block => (_$data['Block'] as Input$BlockFilter?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('Currency')) {
      final l$Currency = Currency;
      result$data['Currency'] = l$Currency?.toJson();
    }
    if (_$data.containsKey('Interval')) {
      final l$Interval = Interval;
      result$data['Interval'] = l$Interval?.toJson();
    }
    if (_$data.containsKey('Block')) {
      final l$Block = Block;
      result$data['Block'] = l$Block?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$CurrenciesWhere<Input$CurrenciesWhere> get copyWith =>
      CopyWith$Input$CurrenciesWhere(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CurrenciesWhere || runtimeType != other.runtimeType) {
      return false;
    }
    final l$Currency = Currency;
    final lOther$Currency = other.Currency;
    if (_$data.containsKey('Currency') !=
        other._$data.containsKey('Currency')) {
      return false;
    }
    if (l$Currency != lOther$Currency) {
      return false;
    }
    final l$Interval = Interval;
    final lOther$Interval = other.Interval;
    if (_$data.containsKey('Interval') !=
        other._$data.containsKey('Interval')) {
      return false;
    }
    if (l$Interval != lOther$Interval) {
      return false;
    }
    final l$Block = Block;
    final lOther$Block = other.Block;
    if (_$data.containsKey('Block') != other._$data.containsKey('Block')) {
      return false;
    }
    if (l$Block != lOther$Block) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$Currency = Currency;
    final l$Interval = Interval;
    final l$Block = Block;
    return Object.hashAll([
      _$data.containsKey('Currency') ? l$Currency : const {},
      _$data.containsKey('Interval') ? l$Interval : const {},
      _$data.containsKey('Block') ? l$Block : const {},
    ]);
  }
}

abstract class CopyWith$Input$CurrenciesWhere<TRes> {
  factory CopyWith$Input$CurrenciesWhere(
    Input$CurrenciesWhere instance,
    TRes Function(Input$CurrenciesWhere) then,
  ) = _CopyWithImpl$Input$CurrenciesWhere;

  factory CopyWith$Input$CurrenciesWhere.stub(TRes res) =
      _CopyWithStubImpl$Input$CurrenciesWhere;

  TRes call({
    Input$CurrencyFilter? Currency,
    Input$IntervalFilter? Interval,
    Input$BlockFilter? Block,
  });
  CopyWith$Input$CurrencyFilter<TRes> get Currency;
  CopyWith$Input$IntervalFilter<TRes> get Interval;
  CopyWith$Input$BlockFilter<TRes> get Block;
}

class _CopyWithImpl$Input$CurrenciesWhere<TRes>
    implements CopyWith$Input$CurrenciesWhere<TRes> {
  _CopyWithImpl$Input$CurrenciesWhere(this._instance, this._then);

  final Input$CurrenciesWhere _instance;

  final TRes Function(Input$CurrenciesWhere) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Currency = _undefined,
    Object? Interval = _undefined,
    Object? Block = _undefined,
  }) => _then(
    Input$CurrenciesWhere._({
      ..._instance._$data,
      if (Currency != _undefined)
        'Currency': (Currency as Input$CurrencyFilter?),
      if (Interval != _undefined)
        'Interval': (Interval as Input$IntervalFilter?),
      if (Block != _undefined) 'Block': (Block as Input$BlockFilter?),
    }),
  );

  CopyWith$Input$CurrencyFilter<TRes> get Currency {
    final local$Currency = _instance.Currency;
    return local$Currency == null
        ? CopyWith$Input$CurrencyFilter.stub(_then(_instance))
        : CopyWith$Input$CurrencyFilter(
            local$Currency,
            (e) => call(Currency: e),
          );
  }

  CopyWith$Input$IntervalFilter<TRes> get Interval {
    final local$Interval = _instance.Interval;
    return local$Interval == null
        ? CopyWith$Input$IntervalFilter.stub(_then(_instance))
        : CopyWith$Input$IntervalFilter(
            local$Interval,
            (e) => call(Interval: e),
          );
  }

  CopyWith$Input$BlockFilter<TRes> get Block {
    final local$Block = _instance.Block;
    return local$Block == null
        ? CopyWith$Input$BlockFilter.stub(_then(_instance))
        : CopyWith$Input$BlockFilter(local$Block, (e) => call(Block: e));
  }
}

class _CopyWithStubImpl$Input$CurrenciesWhere<TRes>
    implements CopyWith$Input$CurrenciesWhere<TRes> {
  _CopyWithStubImpl$Input$CurrenciesWhere(this._res);

  TRes _res;

  call({
    Input$CurrencyFilter? Currency,
    Input$IntervalFilter? Interval,
    Input$BlockFilter? Block,
  }) => _res;

  CopyWith$Input$CurrencyFilter<TRes> get Currency =>
      CopyWith$Input$CurrencyFilter.stub(_res);

  CopyWith$Input$IntervalFilter<TRes> get Interval =>
      CopyWith$Input$IntervalFilter.stub(_res);

  CopyWith$Input$BlockFilter<TRes> get Block =>
      CopyWith$Input$BlockFilter.stub(_res);
}

class Input$CurrencyFilter {
  factory Input$CurrencyFilter({Input$IdFilter? Id}) =>
      Input$CurrencyFilter._({if (Id != null) r'Id': Id});

  Input$CurrencyFilter._(this._$data);

  factory Input$CurrencyFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('Id')) {
      final l$Id = data['Id'];
      result$data['Id'] = l$Id == null
          ? null
          : Input$IdFilter.fromJson((l$Id as Map<String, dynamic>));
    }
    return Input$CurrencyFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$IdFilter? get Id => (_$data['Id'] as Input$IdFilter?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('Id')) {
      final l$Id = Id;
      result$data['Id'] = l$Id?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$CurrencyFilter<Input$CurrencyFilter> get copyWith =>
      CopyWith$Input$CurrencyFilter(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CurrencyFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$Id = Id;
    final lOther$Id = other.Id;
    if (_$data.containsKey('Id') != other._$data.containsKey('Id')) {
      return false;
    }
    if (l$Id != lOther$Id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$Id = Id;
    return Object.hashAll([_$data.containsKey('Id') ? l$Id : const {}]);
  }
}

abstract class CopyWith$Input$CurrencyFilter<TRes> {
  factory CopyWith$Input$CurrencyFilter(
    Input$CurrencyFilter instance,
    TRes Function(Input$CurrencyFilter) then,
  ) = _CopyWithImpl$Input$CurrencyFilter;

  factory CopyWith$Input$CurrencyFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$CurrencyFilter;

  TRes call({Input$IdFilter? Id});
  CopyWith$Input$IdFilter<TRes> get Id;
}

class _CopyWithImpl$Input$CurrencyFilter<TRes>
    implements CopyWith$Input$CurrencyFilter<TRes> {
  _CopyWithImpl$Input$CurrencyFilter(this._instance, this._then);

  final Input$CurrencyFilter _instance;

  final TRes Function(Input$CurrencyFilter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? Id = _undefined}) => _then(
    Input$CurrencyFilter._({
      ..._instance._$data,
      if (Id != _undefined) 'Id': (Id as Input$IdFilter?),
    }),
  );

  CopyWith$Input$IdFilter<TRes> get Id {
    final local$Id = _instance.Id;
    return local$Id == null
        ? CopyWith$Input$IdFilter.stub(_then(_instance))
        : CopyWith$Input$IdFilter(local$Id, (e) => call(Id: e));
  }
}

class _CopyWithStubImpl$Input$CurrencyFilter<TRes>
    implements CopyWith$Input$CurrencyFilter<TRes> {
  _CopyWithStubImpl$Input$CurrencyFilter(this._res);

  TRes _res;

  call({Input$IdFilter? Id}) => _res;

  CopyWith$Input$IdFilter<TRes> get Id => CopyWith$Input$IdFilter.stub(_res);
}

class Input$IdFilter {
  factory Input$IdFilter({String? $is}) =>
      Input$IdFilter._({if ($is != null) r'is': $is});

  Input$IdFilter._(this._$data);

  factory Input$IdFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = (l$$is as String?);
    }
    return Input$IdFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get $is => (_$data['is'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is;
    }
    return result$data;
  }

  CopyWith$Input$IdFilter<Input$IdFilter> get copyWith =>
      CopyWith$Input$IdFilter(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$IdFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$is = $is;
    return Object.hashAll([_$data.containsKey('is') ? l$$is : const {}]);
  }
}

abstract class CopyWith$Input$IdFilter<TRes> {
  factory CopyWith$Input$IdFilter(
    Input$IdFilter instance,
    TRes Function(Input$IdFilter) then,
  ) = _CopyWithImpl$Input$IdFilter;

  factory CopyWith$Input$IdFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$IdFilter;

  TRes call({String? $is});
}

class _CopyWithImpl$Input$IdFilter<TRes>
    implements CopyWith$Input$IdFilter<TRes> {
  _CopyWithImpl$Input$IdFilter(this._instance, this._then);

  final Input$IdFilter _instance;

  final TRes Function(Input$IdFilter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $is = _undefined}) => _then(
    Input$IdFilter._({
      ..._instance._$data,
      if ($is != _undefined) 'is': ($is as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$IdFilter<TRes>
    implements CopyWith$Input$IdFilter<TRes> {
  _CopyWithStubImpl$Input$IdFilter(this._res);

  TRes _res;

  call({String? $is}) => _res;
}

class Input$IntervalFilter {
  factory Input$IntervalFilter({Input$IntervalTimeFilter? Time}) =>
      Input$IntervalFilter._({if (Time != null) r'Time': Time});

  Input$IntervalFilter._(this._$data);

  factory Input$IntervalFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('Time')) {
      final l$Time = data['Time'];
      result$data['Time'] = l$Time == null
          ? null
          : Input$IntervalTimeFilter.fromJson((l$Time as Map<String, dynamic>));
    }
    return Input$IntervalFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$IntervalTimeFilter? get Time =>
      (_$data['Time'] as Input$IntervalTimeFilter?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('Time')) {
      final l$Time = Time;
      result$data['Time'] = l$Time?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$IntervalFilter<Input$IntervalFilter> get copyWith =>
      CopyWith$Input$IntervalFilter(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$IntervalFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$Time = Time;
    final lOther$Time = other.Time;
    if (_$data.containsKey('Time') != other._$data.containsKey('Time')) {
      return false;
    }
    if (l$Time != lOther$Time) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$Time = Time;
    return Object.hashAll([_$data.containsKey('Time') ? l$Time : const {}]);
  }
}

abstract class CopyWith$Input$IntervalFilter<TRes> {
  factory CopyWith$Input$IntervalFilter(
    Input$IntervalFilter instance,
    TRes Function(Input$IntervalFilter) then,
  ) = _CopyWithImpl$Input$IntervalFilter;

  factory CopyWith$Input$IntervalFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$IntervalFilter;

  TRes call({Input$IntervalTimeFilter? Time});
  CopyWith$Input$IntervalTimeFilter<TRes> get Time;
}

class _CopyWithImpl$Input$IntervalFilter<TRes>
    implements CopyWith$Input$IntervalFilter<TRes> {
  _CopyWithImpl$Input$IntervalFilter(this._instance, this._then);

  final Input$IntervalFilter _instance;

  final TRes Function(Input$IntervalFilter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? Time = _undefined}) => _then(
    Input$IntervalFilter._({
      ..._instance._$data,
      if (Time != _undefined) 'Time': (Time as Input$IntervalTimeFilter?),
    }),
  );

  CopyWith$Input$IntervalTimeFilter<TRes> get Time {
    final local$Time = _instance.Time;
    return local$Time == null
        ? CopyWith$Input$IntervalTimeFilter.stub(_then(_instance))
        : CopyWith$Input$IntervalTimeFilter(local$Time, (e) => call(Time: e));
  }
}

class _CopyWithStubImpl$Input$IntervalFilter<TRes>
    implements CopyWith$Input$IntervalFilter<TRes> {
  _CopyWithStubImpl$Input$IntervalFilter(this._res);

  TRes _res;

  call({Input$IntervalTimeFilter? Time}) => _res;

  CopyWith$Input$IntervalTimeFilter<TRes> get Time =>
      CopyWith$Input$IntervalTimeFilter.stub(_res);
}

class Input$IntervalTimeFilter {
  factory Input$IntervalTimeFilter({Input$DurationFilter? Duration}) =>
      Input$IntervalTimeFilter._({if (Duration != null) r'Duration': Duration});

  Input$IntervalTimeFilter._(this._$data);

  factory Input$IntervalTimeFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('Duration')) {
      final l$Duration = data['Duration'];
      result$data['Duration'] = l$Duration == null
          ? null
          : Input$DurationFilter.fromJson((l$Duration as Map<String, dynamic>));
    }
    return Input$IntervalTimeFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$DurationFilter? get Duration =>
      (_$data['Duration'] as Input$DurationFilter?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('Duration')) {
      final l$Duration = Duration;
      result$data['Duration'] = l$Duration?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$IntervalTimeFilter<Input$IntervalTimeFilter> get copyWith =>
      CopyWith$Input$IntervalTimeFilter(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$IntervalTimeFilter ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$Duration = Duration;
    final lOther$Duration = other.Duration;
    if (_$data.containsKey('Duration') !=
        other._$data.containsKey('Duration')) {
      return false;
    }
    if (l$Duration != lOther$Duration) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$Duration = Duration;
    return Object.hashAll([
      _$data.containsKey('Duration') ? l$Duration : const {},
    ]);
  }
}

abstract class CopyWith$Input$IntervalTimeFilter<TRes> {
  factory CopyWith$Input$IntervalTimeFilter(
    Input$IntervalTimeFilter instance,
    TRes Function(Input$IntervalTimeFilter) then,
  ) = _CopyWithImpl$Input$IntervalTimeFilter;

  factory CopyWith$Input$IntervalTimeFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$IntervalTimeFilter;

  TRes call({Input$DurationFilter? Duration});
  CopyWith$Input$DurationFilter<TRes> get Duration;
}

class _CopyWithImpl$Input$IntervalTimeFilter<TRes>
    implements CopyWith$Input$IntervalTimeFilter<TRes> {
  _CopyWithImpl$Input$IntervalTimeFilter(this._instance, this._then);

  final Input$IntervalTimeFilter _instance;

  final TRes Function(Input$IntervalTimeFilter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? Duration = _undefined}) => _then(
    Input$IntervalTimeFilter._({
      ..._instance._$data,
      if (Duration != _undefined)
        'Duration': (Duration as Input$DurationFilter?),
    }),
  );

  CopyWith$Input$DurationFilter<TRes> get Duration {
    final local$Duration = _instance.Duration;
    return local$Duration == null
        ? CopyWith$Input$DurationFilter.stub(_then(_instance))
        : CopyWith$Input$DurationFilter(
            local$Duration,
            (e) => call(Duration: e),
          );
  }
}

class _CopyWithStubImpl$Input$IntervalTimeFilter<TRes>
    implements CopyWith$Input$IntervalTimeFilter<TRes> {
  _CopyWithStubImpl$Input$IntervalTimeFilter(this._res);

  TRes _res;

  call({Input$DurationFilter? Duration}) => _res;

  CopyWith$Input$DurationFilter<TRes> get Duration =>
      CopyWith$Input$DurationFilter.stub(_res);
}

class Input$DurationFilter {
  factory Input$DurationFilter({int? eq}) =>
      Input$DurationFilter._({if (eq != null) r'eq': eq});

  Input$DurationFilter._(this._$data);

  factory Input$DurationFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as int?);
    }
    return Input$DurationFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get eq => (_$data['eq'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq;
    }
    return result$data;
  }

  CopyWith$Input$DurationFilter<Input$DurationFilter> get copyWith =>
      CopyWith$Input$DurationFilter(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$DurationFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != lOther$eq) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eq = eq;
    return Object.hashAll([_$data.containsKey('eq') ? l$eq : const {}]);
  }
}

abstract class CopyWith$Input$DurationFilter<TRes> {
  factory CopyWith$Input$DurationFilter(
    Input$DurationFilter instance,
    TRes Function(Input$DurationFilter) then,
  ) = _CopyWithImpl$Input$DurationFilter;

  factory CopyWith$Input$DurationFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$DurationFilter;

  TRes call({int? eq});
}

class _CopyWithImpl$Input$DurationFilter<TRes>
    implements CopyWith$Input$DurationFilter<TRes> {
  _CopyWithImpl$Input$DurationFilter(this._instance, this._then);

  final Input$DurationFilter _instance;

  final TRes Function(Input$DurationFilter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? eq = _undefined}) => _then(
    Input$DurationFilter._({
      ..._instance._$data,
      if (eq != _undefined) 'eq': (eq as int?),
    }),
  );
}

class _CopyWithStubImpl$Input$DurationFilter<TRes>
    implements CopyWith$Input$DurationFilter<TRes> {
  _CopyWithStubImpl$Input$DurationFilter(this._res);

  TRes _res;

  call({int? eq}) => _res;
}

class Input$BlockFilter {
  factory Input$BlockFilter({Input$BlockTimeFilter? Time}) =>
      Input$BlockFilter._({if (Time != null) r'Time': Time});

  Input$BlockFilter._(this._$data);

  factory Input$BlockFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('Time')) {
      final l$Time = data['Time'];
      result$data['Time'] = l$Time == null
          ? null
          : Input$BlockTimeFilter.fromJson((l$Time as Map<String, dynamic>));
    }
    return Input$BlockFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$BlockTimeFilter? get Time => (_$data['Time'] as Input$BlockTimeFilter?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('Time')) {
      final l$Time = Time;
      result$data['Time'] = l$Time?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$BlockFilter<Input$BlockFilter> get copyWith =>
      CopyWith$Input$BlockFilter(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$BlockFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$Time = Time;
    final lOther$Time = other.Time;
    if (_$data.containsKey('Time') != other._$data.containsKey('Time')) {
      return false;
    }
    if (l$Time != lOther$Time) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$Time = Time;
    return Object.hashAll([_$data.containsKey('Time') ? l$Time : const {}]);
  }
}

abstract class CopyWith$Input$BlockFilter<TRes> {
  factory CopyWith$Input$BlockFilter(
    Input$BlockFilter instance,
    TRes Function(Input$BlockFilter) then,
  ) = _CopyWithImpl$Input$BlockFilter;

  factory CopyWith$Input$BlockFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$BlockFilter;

  TRes call({Input$BlockTimeFilter? Time});
  CopyWith$Input$BlockTimeFilter<TRes> get Time;
}

class _CopyWithImpl$Input$BlockFilter<TRes>
    implements CopyWith$Input$BlockFilter<TRes> {
  _CopyWithImpl$Input$BlockFilter(this._instance, this._then);

  final Input$BlockFilter _instance;

  final TRes Function(Input$BlockFilter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? Time = _undefined}) => _then(
    Input$BlockFilter._({
      ..._instance._$data,
      if (Time != _undefined) 'Time': (Time as Input$BlockTimeFilter?),
    }),
  );

  CopyWith$Input$BlockTimeFilter<TRes> get Time {
    final local$Time = _instance.Time;
    return local$Time == null
        ? CopyWith$Input$BlockTimeFilter.stub(_then(_instance))
        : CopyWith$Input$BlockTimeFilter(local$Time, (e) => call(Time: e));
  }
}

class _CopyWithStubImpl$Input$BlockFilter<TRes>
    implements CopyWith$Input$BlockFilter<TRes> {
  _CopyWithStubImpl$Input$BlockFilter(this._res);

  TRes _res;

  call({Input$BlockTimeFilter? Time}) => _res;

  CopyWith$Input$BlockTimeFilter<TRes> get Time =>
      CopyWith$Input$BlockTimeFilter.stub(_res);
}

class Input$BlockTimeFilter {
  factory Input$BlockTimeFilter({Input$SinceRelative? since_relative}) =>
      Input$BlockTimeFilter._({
        if (since_relative != null) r'since_relative': since_relative,
      });

  Input$BlockTimeFilter._(this._$data);

  factory Input$BlockTimeFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('since_relative')) {
      final l$since_relative = data['since_relative'];
      result$data['since_relative'] = l$since_relative == null
          ? null
          : Input$SinceRelative.fromJson(
              (l$since_relative as Map<String, dynamic>),
            );
    }
    return Input$BlockTimeFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$SinceRelative? get since_relative =>
      (_$data['since_relative'] as Input$SinceRelative?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('since_relative')) {
      final l$since_relative = since_relative;
      result$data['since_relative'] = l$since_relative?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$BlockTimeFilter<Input$BlockTimeFilter> get copyWith =>
      CopyWith$Input$BlockTimeFilter(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$BlockTimeFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$since_relative = since_relative;
    final lOther$since_relative = other.since_relative;
    if (_$data.containsKey('since_relative') !=
        other._$data.containsKey('since_relative')) {
      return false;
    }
    if (l$since_relative != lOther$since_relative) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$since_relative = since_relative;
    return Object.hashAll([
      _$data.containsKey('since_relative') ? l$since_relative : const {},
    ]);
  }
}

abstract class CopyWith$Input$BlockTimeFilter<TRes> {
  factory CopyWith$Input$BlockTimeFilter(
    Input$BlockTimeFilter instance,
    TRes Function(Input$BlockTimeFilter) then,
  ) = _CopyWithImpl$Input$BlockTimeFilter;

  factory CopyWith$Input$BlockTimeFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$BlockTimeFilter;

  TRes call({Input$SinceRelative? since_relative});
  CopyWith$Input$SinceRelative<TRes> get since_relative;
}

class _CopyWithImpl$Input$BlockTimeFilter<TRes>
    implements CopyWith$Input$BlockTimeFilter<TRes> {
  _CopyWithImpl$Input$BlockTimeFilter(this._instance, this._then);

  final Input$BlockTimeFilter _instance;

  final TRes Function(Input$BlockTimeFilter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? since_relative = _undefined}) => _then(
    Input$BlockTimeFilter._({
      ..._instance._$data,
      if (since_relative != _undefined)
        'since_relative': (since_relative as Input$SinceRelative?),
    }),
  );

  CopyWith$Input$SinceRelative<TRes> get since_relative {
    final local$since_relative = _instance.since_relative;
    return local$since_relative == null
        ? CopyWith$Input$SinceRelative.stub(_then(_instance))
        : CopyWith$Input$SinceRelative(
            local$since_relative,
            (e) => call(since_relative: e),
          );
  }
}

class _CopyWithStubImpl$Input$BlockTimeFilter<TRes>
    implements CopyWith$Input$BlockTimeFilter<TRes> {
  _CopyWithStubImpl$Input$BlockTimeFilter(this._res);

  TRes _res;

  call({Input$SinceRelative? since_relative}) => _res;

  CopyWith$Input$SinceRelative<TRes> get since_relative =>
      CopyWith$Input$SinceRelative.stub(_res);
}

class Input$SinceRelative {
  factory Input$SinceRelative({int? days_ago}) =>
      Input$SinceRelative._({if (days_ago != null) r'days_ago': days_ago});

  Input$SinceRelative._(this._$data);

  factory Input$SinceRelative.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('days_ago')) {
      final l$days_ago = data['days_ago'];
      result$data['days_ago'] = (l$days_ago as int?);
    }
    return Input$SinceRelative._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get days_ago => (_$data['days_ago'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('days_ago')) {
      final l$days_ago = days_ago;
      result$data['days_ago'] = l$days_ago;
    }
    return result$data;
  }

  CopyWith$Input$SinceRelative<Input$SinceRelative> get copyWith =>
      CopyWith$Input$SinceRelative(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SinceRelative || runtimeType != other.runtimeType) {
      return false;
    }
    final l$days_ago = days_ago;
    final lOther$days_ago = other.days_ago;
    if (_$data.containsKey('days_ago') !=
        other._$data.containsKey('days_ago')) {
      return false;
    }
    if (l$days_ago != lOther$days_ago) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$days_ago = days_ago;
    return Object.hashAll([
      _$data.containsKey('days_ago') ? l$days_ago : const {},
    ]);
  }
}

abstract class CopyWith$Input$SinceRelative<TRes> {
  factory CopyWith$Input$SinceRelative(
    Input$SinceRelative instance,
    TRes Function(Input$SinceRelative) then,
  ) = _CopyWithImpl$Input$SinceRelative;

  factory CopyWith$Input$SinceRelative.stub(TRes res) =
      _CopyWithStubImpl$Input$SinceRelative;

  TRes call({int? days_ago});
}

class _CopyWithImpl$Input$SinceRelative<TRes>
    implements CopyWith$Input$SinceRelative<TRes> {
  _CopyWithImpl$Input$SinceRelative(this._instance, this._then);

  final Input$SinceRelative _instance;

  final TRes Function(Input$SinceRelative) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? days_ago = _undefined}) => _then(
    Input$SinceRelative._({
      ..._instance._$data,
      if (days_ago != _undefined) 'days_ago': (days_ago as int?),
    }),
  );
}

class _CopyWithStubImpl$Input$SinceRelative<TRes>
    implements CopyWith$Input$SinceRelative<TRes> {
  _CopyWithStubImpl$Input$SinceRelative(this._res);

  TRes _res;

  call({int? days_ago}) => _res;
}

class Input$LimitInput {
  factory Input$LimitInput({int? count}) =>
      Input$LimitInput._({if (count != null) r'count': count});

  Input$LimitInput._(this._$data);

  factory Input$LimitInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('count')) {
      final l$count = data['count'];
      result$data['count'] = (l$count as int?);
    }
    return Input$LimitInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get count => (_$data['count'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('count')) {
      final l$count = count;
      result$data['count'] = l$count;
    }
    return result$data;
  }

  CopyWith$Input$LimitInput<Input$LimitInput> get copyWith =>
      CopyWith$Input$LimitInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$LimitInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$count = count;
    final lOther$count = other.count;
    if (_$data.containsKey('count') != other._$data.containsKey('count')) {
      return false;
    }
    if (l$count != lOther$count) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$count = count;
    return Object.hashAll([_$data.containsKey('count') ? l$count : const {}]);
  }
}

abstract class CopyWith$Input$LimitInput<TRes> {
  factory CopyWith$Input$LimitInput(
    Input$LimitInput instance,
    TRes Function(Input$LimitInput) then,
  ) = _CopyWithImpl$Input$LimitInput;

  factory CopyWith$Input$LimitInput.stub(TRes res) =
      _CopyWithStubImpl$Input$LimitInput;

  TRes call({int? count});
}

class _CopyWithImpl$Input$LimitInput<TRes>
    implements CopyWith$Input$LimitInput<TRes> {
  _CopyWithImpl$Input$LimitInput(this._instance, this._then);

  final Input$LimitInput _instance;

  final TRes Function(Input$LimitInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? count = _undefined}) => _then(
    Input$LimitInput._({
      ..._instance._$data,
      if (count != _undefined) 'count': (count as int?),
    }),
  );
}

class _CopyWithStubImpl$Input$LimitInput<TRes>
    implements CopyWith$Input$LimitInput<TRes> {
  _CopyWithStubImpl$Input$LimitInput(this._res);

  TRes _res;

  call({int? count}) => _res;
}

class Input$OrderByInput {
  factory Input$OrderByInput({String? descending}) =>
      Input$OrderByInput._({if (descending != null) r'descending': descending});

  Input$OrderByInput._(this._$data);

  factory Input$OrderByInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('descending')) {
      final l$descending = data['descending'];
      result$data['descending'] = (l$descending as String?);
    }
    return Input$OrderByInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get descending => (_$data['descending'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('descending')) {
      final l$descending = descending;
      result$data['descending'] = l$descending;
    }
    return result$data;
  }

  CopyWith$Input$OrderByInput<Input$OrderByInput> get copyWith =>
      CopyWith$Input$OrderByInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$OrderByInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$descending = descending;
    final lOther$descending = other.descending;
    if (_$data.containsKey('descending') !=
        other._$data.containsKey('descending')) {
      return false;
    }
    if (l$descending != lOther$descending) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$descending = descending;
    return Object.hashAll([
      _$data.containsKey('descending') ? l$descending : const {},
    ]);
  }
}

abstract class CopyWith$Input$OrderByInput<TRes> {
  factory CopyWith$Input$OrderByInput(
    Input$OrderByInput instance,
    TRes Function(Input$OrderByInput) then,
  ) = _CopyWithImpl$Input$OrderByInput;

  factory CopyWith$Input$OrderByInput.stub(TRes res) =
      _CopyWithStubImpl$Input$OrderByInput;

  TRes call({String? descending});
}

class _CopyWithImpl$Input$OrderByInput<TRes>
    implements CopyWith$Input$OrderByInput<TRes> {
  _CopyWithImpl$Input$OrderByInput(this._instance, this._then);

  final Input$OrderByInput _instance;

  final TRes Function(Input$OrderByInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? descending = _undefined}) => _then(
    Input$OrderByInput._({
      ..._instance._$data,
      if (descending != _undefined) 'descending': (descending as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$OrderByInput<TRes>
    implements CopyWith$Input$OrderByInput<TRes> {
  _CopyWithStubImpl$Input$OrderByInput(this._res);

  TRes _res;

  call({String? descending}) => _res;
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
