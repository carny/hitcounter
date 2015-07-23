class Url < ActiveRecord::Base
  nilify_blanks

  has_one :hit_count, dependent: :destroy
  after_create :create_hit_count

  private :hit_count, :hit_count=

  def hits
    hit_count.count
  end

  def increment
    hit_count.increment!(:count)
    hits
  end

  private

  def initialize_hit_count
    HitCount.create(:url => self)
  end
end
