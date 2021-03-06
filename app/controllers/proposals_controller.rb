class ProposalsController < ApplicationController
  respond_to :json

  def index

  end

  def submit
    @proposal = Proposal.create proposal_param
    respond_with(@proposal)
  end

  def accept

    @deal, @group_moneys = Proposal.accept(
      :id => params[:id], 
      :group_id => params[:group_id]
    )
    
    respond_with(@deal, @group_moneys)
     
  end

  private

  def proposal_param
    params.require(:proposal).permit(:id,
                                     :group_id, 
                                     :round_id, 
                                     :submitter, 
                                     :acceptor, 
                                     {:moneys => []}, 
                                     :accepted, 
                                     :submitter_penalty, 
                                     :acceptor_penalty)
  end
end