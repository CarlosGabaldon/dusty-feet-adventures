class TrailsController
  class GPX
    attr_reader :file_path
    attr_reader :route

    def initialize(file_path:)
      @file_path = file_path
    end

    def parse_to_route
      @route ||= parse_file
    end

    private
    def parse_file
      route = ""
      if @file_path
        doc = Nokogiri::XML(File.open(@file_path))
        trkpts = doc.xpath("//xmlns:trkpt")
        trkpts.each do |trkpt|
          route << "#{trkpt.attr('lat')}, #{trkpt.attr('lon')}|"
        end
        route = route[0...-1]
      end
      return route
    end
  end
end
