class Sieve
  attr_reader :limit, :tag

  def initialize(n)
    limit_error(n)
    @limit = n
    @tag = {}

    for i in 2..n
      @tag[i] = :true
    end
  end

  def primes
    arr = []

    test_if_key_is_prime

    for i in 2..limit
      if tag[i] == :true
        arr << i
      end
    end

    arr
  end

  private

  def limit_error(n)
    if n < 1
      raise ArgumentError.new("The number manipulated must be bigger than one!")
    end
  end

  def test_if_key_is_prime
    tag.each do |key, value|
      if key < Math.sqrt(limit)
        if value == :true
          set_key_nd_number_is_false(key)
        end
      end
    end
  end

  def set_key_nd_number_is_false(key)
    for i in 0..limit 
      if key * key + key * i <= limit
        tag[key * key + key * i] = :false
      end    
    end
  end
end