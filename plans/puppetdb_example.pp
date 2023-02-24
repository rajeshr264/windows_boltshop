plan windows_boltshop::puppetdb_example (
  Enum['dev', 'prod'] $environment,
) {

  # query puppetdb to find the nodes that have the 'dev' or 'prod' fact  
  $query = [from, nodes, ['=', [fact, env], $environment]]
  $selected_nodes = puppetdb_query($query).map() |$target| { $target[certname] }
  run_task('windows_boltshop::helloworld', $selected_nodes, name => "hello")
}
