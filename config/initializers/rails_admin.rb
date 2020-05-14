# frozen_string_literal: true

RailsAdmin.config do |config|
  ### Popular gems integration

  config.main_app_name = ['Saldana&Plata Supplies', 'Administración']

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  config.parent_controller = 'ApplicationController'

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.excluded_models = %w[ActiveStorage::Attachment ActiveStorage::Blob]

  config.label_methods = [:to_s]

  # config.model Line do
  #   field :queue_assistant do
  #     associated_collection_scope do
  #       Proc.new { |scope|
  #         scope = scope.where(queue: true)
  #       }
  #     end
  #   end
  # end

  class RailsAdmin::Config::Fields::Types::Time
    def parse_value(value)
      Time.zone.parse(value)
    end
  end

  config.actions do
    dashboard # mandatory
    index # mandatory
    new do
      except ['CashAdded']
    end
    export
    bulk_delete do
      except ['CashAdded']
    end
    show
    edit do
      except ['CashAdded']
    end
    delete do
      except ['CashAdded']
    end
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model User do
    create do
      field :email
      field :password
      field :password_confirmation
      include_all_fields
      exclude_fields :reset_password_sent_at, :remember_created_at
    end
    show do
      field :email
      field :password
      field :password_confirmation
      include_all_fields
      exclude_fields :reset_password_sent_at, :remember_created_at
    end
    edit do
      field :email
      field :password
      field :password_confirmation
      include_all_fields
      exclude_fields :reset_password_sent_at, :remember_created_at
    end
  end
end
