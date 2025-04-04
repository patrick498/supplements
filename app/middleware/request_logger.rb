class RequestLogger
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "[DEBUG] 🌐 Incoming Request: #{env['REQUEST_METHOD']} #{env['PATH_INFO']}"
    @app.call(env)
  end
end
