module Singleton
  # Raises a TypeError to prevent cloning.
  def clone
    raise TypeError, "can't clone instance of singleton #{self.class}"
  end

  # Raises a TypeError to prevent duping.
  def dup
    raise TypeError, "can't dup instance of singleton #{self.class}"
  end

  # By default, do not retain any state when marshalling.
  def _dump(depth = -1)
    ''
  end

  module SingletonClassMethods # :nodoc:

    def clone # :nodoc:
      Singleton.__init__(super)
    end

    # By default calls instance(). Override to retain singleton state.
    def _load(str)
      instance
    end

    private

    def inherited(sub_klass)
      super
      Singleton.__init__(sub_klass)
    end
  end

  class << Singleton # :nodoc:
    def __init__(klass) # :nodoc:
      klass.instance_eval {
        @singleton__instance__ = nil
        @singleton__mutex__ = Mutex.new
      }
      def klass.instance # :nodoc:
        return @singleton__instance__ if @singleton__instance__
        @singleton__mutex__.synchronize {
          return @singleton__instance__ if @singleton__instance__
          @singleton__instance__ = new()
        }
        @singleton__instance__
      end
      klass
    end

    private

    # extending an object with Singleton is a bad idea
    undef_method :extend_object

    def append_features(mod)
      #  help out people counting on transitive mixins
      unless mod.instance_of?(Class)
        raise TypeError, "Inclusion of the OO-Singleton module in module #{mod}"
      end
      super
    end

    def included(klass)
      super
      klass.private_class_method :new, :allocate
      klass.extend SingletonClassMethods
      Singleton.__init__(klass)
    end
  end

  ##
  # :singleton-method: _load
  #  By default calls instance(). Override to retain singleton state.
end