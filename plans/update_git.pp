plan windows_boltshop::update_git (
  Enum['dev', 'prod'] $environment,
) {
  # Use puppetdb to find the nodes from the “other” team's web cluster
  $query = [from, nodes, ['=', [fact, env], $environment]]
  $selected_nodes = puppetdb_query($query).map() |$target| { $target[certname] }
  run_task('puppet_agent::version', $selected_nodes)
}
