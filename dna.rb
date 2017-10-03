class DNA
  def initialize(dna_strand)
    @dna_strand = dna_strand
  end

  def hamming_distance(distance_strand)
    distance = 0
    index1 = 0
    index2 = 0
    # check for empty or identical strands
    return distance if @dna_strand.empty? || @dna_strand == distance_strand
    # check if strands are of equal length
    # if strands are not equal length only compare the length of the shortest strand
    length = [@dna_strand.size, distance_strand.size].min
    # iterate over dna_strand and distance_strand and check if any chars are different
    while index1 < length
        # if yes, add 1 to distance
      distance += 1 unless @dna_strand[index1] == distance_strand[index2]
      index1 += 1
      index2 += 1
    end
    distance
  end
end