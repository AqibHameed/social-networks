class FriendShip < ApplicationRecord
  include AASM

  aasm :column => 'state' do
    state :incompleted, :initial => true
    state :pending_requested
    state :cancel_requested
    state :confirmed

    event :pending_request do
      transitions :from => :incompleted, :to => :pending_requested
    end

    event :cancel_request do
      transitions :from => :pending_requested, :to => :cancel_requested
    end

    event :resum_request do
      transitions :from => :cancel_requested, :to => :pending_requested
    end

    event :confirm do
      transitions :from => :pending_requested, :to => :confirmed
    end

    # event :unfriend do
    #    transition :from => [:pending_requested, :confirmed], :to => :incompleted
    # end
  end
  belongs_to :user
  belongs_to :friend, class_name: 'User'

end
