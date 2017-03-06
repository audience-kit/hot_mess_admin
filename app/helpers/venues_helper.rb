module VenuesHelper
  def venue_tags(venue)
    tags = []

    tags << 'hidden' if venue.hidden
    tags << 'missing facebook' if venue.facebook_id == nil
    tags << 'missing google' if venue.google_place_id == nil

    tags.to_sentence
  end
end
