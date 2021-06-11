module Helpers
    def login(user)
      visit "/"
      fill_in "username", :with => user.username
      fill_in "password", :with => user.password

      click_button(I18n.t("login"))
    end

    def login_default
      visit "/"
      fill_in "username", :with => "defaultuser"
      fill_in "password", :with => "0000"

      click_button(I18n.t("login"))
    end

    def get_default_userid
      User.find_by(username: "defaultuser").id
    end
  end