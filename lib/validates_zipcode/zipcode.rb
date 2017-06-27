module ValidatesZipcode
  class Zipcode
    include CldrAlpha3RegexpCollection

    def initialize(args = {})
      @zipcode        = args.fetch(:zipcode)
      @country_alpha2 = args.fetch(:country_alpha2)
    end

    def valid?
      return true unless regexp
      !!(regexp =~ @zipcode)
    end
    alias_method :validate, :valid?

    private

    def regexp
      @regexp ||= regexp_for_country_alpha2(@country_alpha2)
    end
  end
end
