plan windows_boltshop::puppetdb_example (
  Enum['dev', 'prod'] $environment,
) {
  
  # Assumption: There are target nodes managed by Puppet, that have a fact called 'env' installed on them. 
  # Some nodes have values 'env = dev' & some have 'env = prod'.
  
  # query puppetdb to find the nodes that have the 'env = dev' or 'env = prod' fact  
  $query = [from, nodes, ['=', [fact, env], $environment]]. # note that the fact name 'env' is used in the query string
  $selected_nodes = puppetdb_query($query).map() |$target| { $target[certname] }
  run_task('windows_boltshop::helloworld', $selected_nodes, name => "hello")
}
