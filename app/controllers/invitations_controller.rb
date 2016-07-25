class InvitationsController < ApplicationController

  def create
    @user = current_user
    invitation = current_user.invitations.create! email: params[:email]
    email = InviteMailer.invite_email(invitation.email).deliver_later
    render json: current_user, status: :created
  end
end
