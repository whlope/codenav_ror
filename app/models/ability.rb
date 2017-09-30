class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Task, preview: true
    can [:read, :complete], Task, course: {id: user.course_ids}
    can :manage, Review, course: {id: user.course_ids}, user_id: user.id
  end
end
