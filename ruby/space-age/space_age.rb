class SpaceAge
  ORBITAL_PERIOD_EARTH_YEARS = {
    earth: 1,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }

  EARTH_YEARS_SECONDS = 31557600

  def initialize(seconds)
    @seconds = seconds
  end

  ORBITAL_PERIOD_EARTH_YEARS.keys.each do |planet|
    define_method :"on_#{planet.to_s}" do
      age_on(planet)
    end
  end

  private

  def age_on(planet)
    @seconds.to_f / (EARTH_YEARS_SECONDS * ORBITAL_PERIOD_EARTH_YEARS[planet])
  end
end
