class InvitationsController < ApplicationController

  def create
    invitation = current_user.invitations.create! email: params[:email]
    email = InviteMailer.invite_email(invitation.email).deliver_later
    render json: @user, status: :created
  end
end
