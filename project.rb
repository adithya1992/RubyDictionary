require 'optparse'
require 'ostruct'

options = OpenStruct.new
OptionParser.new do |opt|
  opt.on('--filename Word-list-filename') {|o| options.filename = o}
end.parse!


class GenerateList

  # initialize the data of word list of dictionary
  def initialize
    # main data
    @data = [] 

    # question data to be generated 
    @quetions = []

    # answer data to be generated
    @answers = []
  end

  attr_accessor :data
  attr_reader :questions
  attr_reader :answers

  # read the work list from given filename
  def read filename
    File.open(filename, "r") do |f|
      f.each_line do |line|
	@data << line.to_s.chomp
      end
    end
  end
  
  # write with filename
  def write filename, data
    filename = filename + Time.now.to_s + ".txt"
    File.open(filename, "a+") do |f|
      data.each do |d|
	f.write d + "\n"
      end
    end
  end

  # generate the question data from main one
  def question_generate
    # first filter word to be more than 4 letters
    filter_data = []
    @data.each do |d|
      filter_data << d if d.length > 3
    end	   
    @data = filter_data 
    # get the 4 letters from filter word list
    question_tmp = []
    filter_data.each do |d|
      (0..d.size-4).each do |i|
  	question_tmp << d[i,4]
      end
    end

    # distinct question temporarily data
    counts = Hash.new(0)
    question_tmp.each {|v| counts[v] += 1}
    @questions = counts.select {|v, count| count == 1}.keys    

    write("question", @questions)
  end

  # generate the answers data
  def answer_generate
    return false unless @questions
    @questions.each do |q|     
	puts q
      @answers << @data.select {|d| d.include? q}.first 
    end
    return false unless @answers
    write "answer", @answers
  end

end


g = GenerateList.new

g.read options.filename

g.question_generate

g.answer_generate

