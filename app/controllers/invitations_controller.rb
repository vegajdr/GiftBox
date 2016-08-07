class InvitationsController < ApplicationController
  def create
    invitation = Invitation.where(created_by: current_user.id, email: params[:email]).first
    unless invitation
      invitation = current_user.invitations.create! email: params[:email]
    end
    InviteMailer.invite_email(invitation.email, current_user).deliver_later
    render json: current_user, status: :created
  end
end
