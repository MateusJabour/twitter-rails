class RelationshipsController < ApplicationController
  def follow
    followed_user = User.find_by_id(params[:id])
    relationship = Relationship.new()

    relationship.follower_id = current_user.id
    relationship.followed_id = followed_user.id

    if !followed_user.is_private
      relationship.accepted = true
    end

    if relationship.save
      json_response(relationship)
    end
  end

  def unfollow
    unfollowed_user = User.find_by_id(params[:id])
    relationship = Relationship.where({ followed_id: unfollowed_user.id, follower_id: current_user.id }).first

    if relationship
      relationship_id = relationship.id
      relationship.destroy
    end

    json_response({ id: relationship_id })
  end

  def getAll
    relationships = current_user.follower_relationships + current_user.following_relationships
    json_response(relationships)
  end

end
