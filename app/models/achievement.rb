class Achievement < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :title, uniqueness: {
      scope: :user_id,
      message: "you can't have two achievements with the same title"
  }

  validates :user, presence: true

  enum privacy: [ :public_access, :private_access, :friends_access ]

  def description_html
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(description)
  end

  def silly_title
    "#{title} by #{user.email}"
  end



end
