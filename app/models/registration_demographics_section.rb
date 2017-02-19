class RegistrationDemographicsSection < RegistrationSection
  def name
    "Demographics"
  end

  def key
    "demographics"
  end

  def attributes
    [
      [:gender, collection: genders, as: :radio_buttons],
      [:race, collection: races, as: :radio_buttons],
    ]
  end

  private

  def genders
    [
      "Male",
      "Female",
      "Non-Binary/Gender Queer",
      "Other",
    ]
  end

  def races
    [
      "Native American / Native Alaskan",
      "Asian or Pacific Islander",
      "Black",
      "White",
      "Hispanic",
    ]
  end
end
