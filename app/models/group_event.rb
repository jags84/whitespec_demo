class GroupEvent < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude

  # Verify all field are presence if publish_status us published
  validates :name, :description, :start_date, :end_date, :latitude, :longitude, presence: true, if: :is_published?
  # Verify only name is necesary if publish_status us draft
  validates :name, presence: true, if: :is_draft?

  # Return active events
  def self.get_all_events(params)
    GroupEvent.where(remove_mark: false, publish_status: 'published').paginate(:page => params[:page], :per_page => 10)
  end

  # Return Event duration in days
  def event_duration
    if self.start_date && self.end_date
      (self.end_date - self.start_date).to_i
    else
      nil
    end
  end

  # Mark for remove
  def mark_for_remove
    self.remove_mark = true
    self.save
  end

  # Return location of event
  def location
    geo_localization = "#{self.latitude},#{self.longitude}"
    q = Geocoder.search(geo_localization).first
    unless q.nil?
      location = {latitude: self.latitude,longitude: self.longitude,city_name: q.city, country_name: q.country}
    else
      location = {latitude: self.latitude,longitude: self.longitude}
    end
    location
  end

  # Validations
  def is_published?
    publish_status === "published" ? true : false
  end

  def is_draft?
    publish_status === "draft" ? true : false
  end

  # Private
  private
    def group_event_params
      params.require(:group_event).permit(:name, :description, :start_date, :end_date, :publish_status, :remove_mark, :latitude, :longitude)
    end
end
