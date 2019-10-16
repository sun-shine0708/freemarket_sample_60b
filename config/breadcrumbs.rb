# ルート
crumb :root do
  link "メルカリ", root_path
end

#マイページ
crumb :"users/show" do
  link "マイページ", user_path
end

#カテゴリー一覧
crumb :"categories/index" do
  link "カテゴリー一覧", categories_path
end

#プロフィール編集
crumb :"users/edit" do
  link "プロフィール", edit_user_path
  parent :"users/show"
end

#メールパスワード確認
crumb :"users/mail_password" do
  link "メール/パスワード", mail_password_user_path
  parent :"users/show"
end

#本人情報の確認
crumb :"users/preview" do
  link "本人情報の確認", preview_user_path
  parent :"users/show"
end

#電話番号の確認
crumb :"users/sms_confirmation" do
  link "電話番号の確認", sms_confirmation_user_path
  parent :"users/show"
end

#ログアウト
crumb :"users/logout" do
  link "ログアウト", logout_user_path
  parent :"users/show"
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).