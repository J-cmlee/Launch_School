require 'yaml'
WORDS = YAML.load(File.read("madlib_words.yml"))

adjectives = WORDS[:adjectives]
nouns = WORDS[:nouns]
verbs = WORDS[:verbs]
adverb = WORDS[:adverb]

p "The #{adjectives.sample} brown #{nouns.sample} #{adverb.sample}"
p "#{verbs.sample} the "