PROTEINS = {
  "Methionine" => ["AUG"],
  "Phenylalanine" => ["UUU", "UUC"],
  "Leucine" => ["UUA", "UUG"],
  "Serine" => ["UCU", "UCC", "UCA", "UCG"],
  "Tyrosine" => ["UAU", "UAC"],
  "Cysteine" => ["UGU", "UGC"],
  "Tryptophan" => ["UGG"],
  "STOP" => ["UAA", "UAG", "UGA"]
}

class Translation

  def self.of_codon(codon)
    raise InvalidCodonError, "invalid codon" unless codon.scan(/[BD-FH-TV-Z]/).empty?
    PROTEINS.each do |protein, codons|
      return protein if codons.include?(codon)

    end
  end

  def self.of_rna(rna_strand)
    raise InvalidCodonError, "invalid codon" unless rna_strand.scan(/[BD-FH-TV-Z]/).empty?
    result = []
    nucleotides = rna_strand.split('')
    while !nucleotides.empty?
      codon = nucleotides.shift(3)
      break if PROTEINS["STOP"].include?(codon.join)
      result << self.of_codon(codon.join)
    end
    result.flatten
  end
end

class InvalidCodonError < StandardError
end

