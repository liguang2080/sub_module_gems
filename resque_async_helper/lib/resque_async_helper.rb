# 可以让类的类方法使用delay的形式
# TestTask.delay(:google, "sina")
# 或者是
# Resque.enqueue(TestTask, :google, "sina")

module ResqueWorkable
  extend ActiveSupport::Concern

  included do
    @queue = self.name.underscore
    
    def self.perform(method, *args)
      self.send(method, *args)
    end
    
    def self.delay(method, *args)
      Resque.enqueue(self, method.to_sym, *args)
    end
    
    def self.delay_at(at_time, method, *args)
      Resque.enqueue_at(at_time, self, method, *args)
    end
  end
end