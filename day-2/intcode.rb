def calc(noun, verb, ints)
  ints[1] = noun
  ints[2] = verb

  i = 0
  until i >= ints.length do
    # Get the ops and args
    op = ints[i]
    input_one = ints[ints[i+1]]
    input_two = ints[ints[i+2]]
    output_pos = ints[i+3]

    if op == 1
      # Addition operation
      ints[output_pos] = input_one + input_two
    elsif op == 2
      # Multiplication operation
      ints[output_pos] = input_one * input_two
    elsif op == 99
      break
    else
      puts "unrecognized op"
      break
    end

    i += 4
  end

  ints[0]
end


file = File.open("./input.txt")
file_data = file.read
file.close

strs = file_data.split(",")
ints = []

strs.each do |s|
  ints << s.to_i
end

(0..99).each do |noun|
  (0..99).each do |verb|
    copy = ints.dup
    output = calc(noun, verb, copy)
    if output == 19690720
      puts "Found the answer: noun is #{noun} and verb is #{verb}"
      break
    end
  end
end

