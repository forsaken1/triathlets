class HomeController < ApplicationController
  def index
    races = Race.all.ordered_by_date
    render("index.slang")
  end

  def compare
    # users = User.all.where { _id.in(user_ids) } # TODO: failed as Crystal compiler error
    users = take_users
    render("compare.slang")
  end

  def about
    render("about.slang")
  end

  private def take_users
    @params["user_ids"]? ?
      User.all.find_by_sql("SELECT * FROM users WHERE id IN (#{user_ids})") :
      [] of User
  end

  private def user_ids
    @params["user_ids"].split(',').uniq.join(",")
  end
end
