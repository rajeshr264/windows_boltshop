plan windows-boltshop::upgrade_git (
  TargetSpec $targets,
  Enum['1:2.17.0-1ubuntu1', '1:2.17.1-1ubuntu0.4'] $version,
) {
  run_task(‘package’, $targets, name => ‘git’, action => ‘upgrade’, version => $version)
}
