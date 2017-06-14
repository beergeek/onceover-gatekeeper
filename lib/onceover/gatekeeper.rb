require 'onceover/gatekeeper/cli'
require 'onceover/testconfig'
require 'onceover/controlrepo'

class Onceover
  class Gatekeeper
    attr_accessor :config, :repo

    def self.pre_prepare(runner)
      @config = runner.config
      @repo   = runner.repo
    end

    def self.pre_write_spec_test(tst)
      c = Onceover::Gatekeeper::Compiler.new

      c.node_name = 'foo' # TODO: Fix
      c.facts = tst.nodes[0].fact_set
      c.hiera_config = @repo.hiera_config
      c.code = "include #{tst.classes[0].name}"
      c.environment = 'production' # TODO: Fix
      c.modulepath = @repo.temp_modulepath

      require 'pry'
      binding.pry

      #c.hiera_config = @repo
    end
  end
end
