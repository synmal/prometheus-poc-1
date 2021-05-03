Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379/0' }

  config.server_middleware do |chain|
    require 'prometheus_exporter/instrumentation'
    chain.add PrometheusExporter::Instrumentation::Sidekiq
  end

  config.death_handlers << PrometheusExporter::Instrumentation::Sidekiq.death_handler

  config.on :startup do
    require 'prometheus_exporter/instrumentation'
    PrometheusExporter::Instrumentation::SidekiqQueue.start
    PrometheusExporter::Instrumentation::Process.start type: 'sidekiq'
  end

  at_exit do
    PrometheusExporter::Client.default.stop(wait_timeout_seconds: 10)
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379/0' }
end