HANDSHAKE_MOVES = {
  1000 => "jump",
  100 => "close your eyes",
  10 => "double blink",
  1 => "wink"
}

REVERSE = 10000

class SecretHandshake
  def initialize(decimal)
    @decimal = decimal
  end

  def commands
    result = []
    command = to_binary(@decimal)

    if (command / REVERSE >= 1)
      reverse = true
      command -= 10000
    end
    return result if command.to_i.to_s == '0'

    HANDSHAKE_MOVES.each do |code, handshake|
      if command == code
        result.unshift(handshake)
        break
      elsif command / code > 0
        result.unshift(handshake)
        command -= code
      end
    end

    if reverse
      result.reverse
    else 
      result
    end
  end

  def to_binary(decimal)
    decimal.to_i.to_s(2).to_i
  end
end

