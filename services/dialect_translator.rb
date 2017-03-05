class DialectTranslator
  def initialize(text, dialect)
    @text = text
    @dialect = dialect
  end

  def translate
    response = HTTParty.get('http://www.degraeve.com/cgi-bin/babel.cgi', query: { d: @dialect, w: @text })
    response.success? ? response.to_s.match(/(.*)<\/p>/)[1].squish : @text
  end
end