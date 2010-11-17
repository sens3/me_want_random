module MeWantRandom
  module ArrayExtensions
    def randomize
      sort { Kernel::rand - Kernel::rand }
    end
  end
end  

Array.send :include, MeWantRandom::ArrayExtensions