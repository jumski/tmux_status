
class String
  # ruby mutation methods have the expectation to return
  # self if a mutation occurred, nil otherwise.
  # see http://www.ruby-doc.org/core-1.9.3/String.html#method-i-gsub-21
  def to_underscore!
    gsub!(/(.)([A-Z])/,'\1_\2') && downcase!
  end

  def to_underscore
    dup.tap(&:to_underscore!)
  end

  def constantize
    names = split('::')
    names.shift if names.empty? || names.first.empty?

    constant = Object
    names.each do |name|
      constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
    end
    constant
  end
end
