module Github
  class Client < API

    def initialize
      # initialize all the modules here ???
    end
    
    def gists
      puts "gists"
    end

    def git_data

    end

    def issues

    end

    def orgs

    end

    def pull_requests

    end

    def repos
      @repos ||= Github::Repos.new      
    end

    def users

    end

  end
end
