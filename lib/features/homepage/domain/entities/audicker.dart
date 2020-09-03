import 'package:audickers/core/enums/file_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Audicker extends Equatable {
  final String name;
  final String path;
  final FileStatus status;
  final Future<Duration> duration;

  const Audicker({
    @required this.name,
    @required this.path,
    @required this.status,
    @required this.duration,
  });

  @override
  List<Object> get props => [name, path, status, duration];
}
