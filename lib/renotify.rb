module Renotify
  class << self
    def root
      File.expand_path("../../", __FILE__)
    end

    def env
      @env ||= ENV['ENV'] || ENV['RACK_ENV'] || "development"
    end

    def logger
      @logger ||= Logger.new("#{log_dir}/renotify.log")
    end

    def pid_dir
      tmp_dir + "/pids"
    end

    def tmp_dir
      Renotify.root + "/tmp"
    end

    def log_dir
      Renotify.root + "/log"
    end

    def shp_dir
      Renotify.root + "/shapefiles"
    end

    def fixture_dir
      Renotify.root + "/spec/fixtures"
    end

  end
end
