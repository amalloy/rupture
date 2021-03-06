module Rupture
  class Seq < Enumerable::Enumerator
    include Sequence
    alias conj cons

    def initialize
      super(self)
    end

    def each
      s = self
      while s = s.seq
        yield s.first
        s = s.rest
      end
    end

    def [](index)
      nth(index)
    end

    def ==(other)
      s = self.seq
      o = other.seq
      while s && o
        return false if s.first != o.first
        s = s.next
        o = o.next
      end
      s.nil? and o.nil?
    end

    def self.empty
      @empty ||= EmptySeq.new
    end
  end

  class EmptySeq < Seq
    def seq
      nil
    end
  end
end

class NilClass
  def seq
    nil
  end

  def first
    nil
  end

  def rest
    Rupture::Seq.empty
  end
end
