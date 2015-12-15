class TrailsController
  class GPX
    attr_reader :file_path
    attr_reader :route

    def initialize(file_path:)
      @file_path = file_path
    end

    def parse_to_route
      @route = "34.549009, -112.536735|"
      @route << "34.550168, -112.536752|"
      @route << "34.550480, -112.536408|"
      @route << "34.551081, -112.535954|"
      @route << "34.551267, -112.535701|"
      @route << "34.551143, -112.535205|"
      @route << "34.550753, -112.535149|"
      @route << "34.550178, -112.535351|"
      @route << "34.549646, -112.536022|"
      @route << "34.549009, -112.536735"
    end
  end
end
