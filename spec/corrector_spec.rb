require_relative '../corrector'

describe Corrector do
  context 'correct name' do
    corrector = Corrector.new
    name1 = 'Aku'
    name2 = 'zachee'
    name3 = 'RolandAkuZachee'

    it 'should correct the name' do
      expect(corrector.correct_name(name1)).to eq 'Aku'
      expect(corrector.correct_name(name2)).to eq 'Zachee'
      expect(corrector.correct_name(name3)).to eq 'Rolandakuz'
    end
  end
end
