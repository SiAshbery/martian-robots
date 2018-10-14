require_relative 'renderer'
class Interface
    attr_reader :renderer

    def initialize(renderer = Renderer.new)
        @renderer = renderer
    end
end