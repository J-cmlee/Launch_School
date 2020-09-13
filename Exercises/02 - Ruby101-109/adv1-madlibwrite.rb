require 'yaml'
words = {adjectives: %w(quick lazy sleepy ugly),
         nouns: %w(fox dog head leg),
         verbs: %w(jumps lifts bites licks),
         adverb: %w(easily lazily noisily excitedly)
}
File.open("madlib_words.yml", "w") { |file| file.write(words.to_yaml) }