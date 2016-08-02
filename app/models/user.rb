class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create do
    invite = Invitation.where(email: self.email).first
    if invite
      Friendship.friend_create invite.user, self
    end
  end

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :username
  validates_uniqueness_of :email

  has_many :auth_tokens, dependent: :destroy

  has_many :accepted_friendships, -> { where status: 'accepted'}, class_name: "Friendship", dependent: :destroy
  has_many :pending_friendships, -> { where status: 'pending' }, class_name: "Friendship", dependent: :destroy
  has_many :requested_friendships, -> { where status: 'requested' }, class_name: "Friendship", dependent: :destroy

  has_many :friends, through: :accepted_friendships, foreign_key: "friend_id", dependent: :destroy

  has_many :user_holidays, dependent: :destroy
  has_many :holidays, through: :user_holidays

  has_many :user_interests, dependent: :destroy
  has_many :interests, through: :user_interests, dependent: :destroy

  has_many :wishlists, dependent: :destroy
  has_many :items, through: :wishlists

  has_many :special_days

  has_many :invitations, foreign_key: "created_by"

  has_many :ideaboxes, dependent: :destroy
  has_many :ideas, through: :ideaboxes

  has_many :favorites

  def self.with_token nonce
    token = AuthToken.active.find_by nonce: nonce
    token.user if token
  end

  def token_for name
    auth_tokens.active.find_by name: name
  end

  def generate_token_for name
    auth_tokens.create!(
      name:       name,
      nonce:      SecureRandom.uuid,
      expires_at: 2.weeks.from_now
    )
  end

end
