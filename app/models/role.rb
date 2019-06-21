class Role < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_roles

  belongs_to :resource,
             polymorphic: true, optional: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  validates :name,
            inclusion: {
              in: %w[
                super_admin
                admin
                tech_admin
                tag_moderator
                trusted
                banned
                warned
                triple_unicorn_member
                level_4_member
                level_3_member
                level_2_member
                level_1_member
                workshop_pass
                chatroom_beta_tester
                comment_banned
                pro
              ]
            }
  scopify
end
