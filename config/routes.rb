# == Route Map
#
#                            Prefix Verb       URI Pattern                                   Controller#Action
#                     change_locale GET        /change_locale(.:format)                      settings#change_locale
#                          ckeditor            /ckeditor                                     Ckeditor::Engine
#            new_admin_user_session GET        /admin/login(.:format)                        active_admin/devise/sessions#new
#                admin_user_session POST       /admin/login(.:format)                        active_admin/devise/sessions#create
#        destroy_admin_user_session DELETE|GET /admin/logout(.:format)                       active_admin/devise/sessions#destroy
#               admin_user_password POST       /admin/password(.:format)                     active_admin/devise/passwords#create
#           new_admin_user_password GET        /admin/password/new(.:format)                 active_admin/devise/passwords#new
#          edit_admin_user_password GET        /admin/password/edit(.:format)                active_admin/devise/passwords#edit
#                                   PATCH      /admin/password(.:format)                     active_admin/devise/passwords#update
#                                   PUT        /admin/password(.:format)                     active_admin/devise/passwords#update
#                        admin_root GET        /admin(.:format)                              admin/artworks#index
#       batch_action_admin_artworks POST       /admin/artworks/batch_action(.:format)        admin/artworks#batch_action
#                    admin_artworks GET        /admin/artworks(.:format)                     admin/artworks#index
#                                   POST       /admin/artworks(.:format)                     admin/artworks#create
#                 new_admin_artwork GET        /admin/artworks/new(.:format)                 admin/artworks#new
#                edit_admin_artwork GET        /admin/artworks/:id/edit(.:format)            admin/artworks#edit
#                     admin_artwork GET        /admin/artworks/:id(.:format)                 admin/artworks#show
#                                   PATCH      /admin/artworks/:id(.:format)                 admin/artworks#update
#                                   PUT        /admin/artworks/:id(.:format)                 admin/artworks#update
#                                   DELETE     /admin/artworks/:id(.:format)                 admin/artworks#destroy
#          batch_action_admin_posts POST       /admin/posts/batch_action(.:format)           admin/posts#batch_action
#                       admin_posts GET        /admin/posts(.:format)                        admin/posts#index
#                                   POST       /admin/posts(.:format)                        admin/posts#create
#                    new_admin_post GET        /admin/posts/new(.:format)                    admin/posts#new
#                   edit_admin_post GET        /admin/posts/:id/edit(.:format)               admin/posts#edit
#                        admin_post GET        /admin/posts/:id(.:format)                    admin/posts#show
#                                   PATCH      /admin/posts/:id(.:format)                    admin/posts#update
#                                   PUT        /admin/posts/:id(.:format)                    admin/posts#update
#                                   DELETE     /admin/posts/:id(.:format)                    admin/posts#destroy
#                   admin_dashboard GET        /admin/dashboard(.:format)                    admin/dashboard#index
# batch_action_admin_all_categories POST       /admin/all_categories/batch_action(.:format)  admin/all_categories#batch_action
#              admin_all_categories GET        /admin/all_categories(.:format)               admin/all_categories#index
#                                   POST       /admin/all_categories(.:format)               admin/all_categories#create
#            new_admin_all_category GET        /admin/all_categories/new(.:format)           admin/all_categories#new
#           edit_admin_all_category GET        /admin/all_categories/:id/edit(.:format)      admin/all_categories#edit
#                admin_all_category GET        /admin/all_categories/:id(.:format)           admin/all_categories#show
#                                   PATCH      /admin/all_categories/:id(.:format)           admin/all_categories#update
#                                   PUT        /admin/all_categories/:id(.:format)           admin/all_categories#update
#                                   DELETE     /admin/all_categories/:id(.:format)           admin/all_categories#destroy
#    batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)     admin/admin_users#batch_action
#                 admin_admin_users GET        /admin/admin_users(.:format)                  admin/admin_users#index
#                                   POST       /admin/admin_users(.:format)                  admin/admin_users#create
#              new_admin_admin_user GET        /admin/admin_users/new(.:format)              admin/admin_users#new
#             edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)         admin/admin_users#edit
#                  admin_admin_user GET        /admin/admin_users/:id(.:format)              admin/admin_users#show
#                                   PATCH      /admin/admin_users/:id(.:format)              admin/admin_users#update
#                                   PUT        /admin/admin_users/:id(.:format)              admin/admin_users#update
#                                   DELETE     /admin/admin_users/:id(.:format)              admin/admin_users#destroy
#          batch_action_admin_infos POST       /admin/infos/batch_action(.:format)           admin/infos#batch_action
#                       admin_infos GET        /admin/infos(.:format)                        admin/infos#index
#                                   POST       /admin/infos(.:format)                        admin/infos#create
#                    new_admin_info GET        /admin/infos/new(.:format)                    admin/infos#new
#                   edit_admin_info GET        /admin/infos/:id/edit(.:format)               admin/infos#edit
#                        admin_info GET        /admin/infos/:id(.:format)                    admin/infos#show
#                                   PATCH      /admin/infos/:id(.:format)                    admin/infos#update
#                                   PUT        /admin/infos/:id(.:format)                    admin/infos#update
#                                   DELETE     /admin/infos/:id(.:format)                    admin/infos#destroy
#                    admin_comments GET        /admin/comments(.:format)                     admin/comments#index
#                                   POST       /admin/comments(.:format)                     admin/comments#create
#                     admin_comment GET        /admin/comments/:id(.:format)                 admin/comments#show
#                                   DELETE     /admin/comments/:id(.:format)                 admin/comments#destroy
#                              root GET        /(:locale)(.:format)                          artworks#index {:locale=>/en|pl|uk/}
#          artworks_change_position GET        (/:locale)/artworks/change_position(.:format) artworks#change_position {:locale=>/en|pl|uk/}
#                      news_current GET        (/:locale)/news/current(.:format)             posts#current {:locale=>/en|pl|uk/}
#                      news_archive GET        (/:locale)/news/archive(.:format)             posts#archive {:locale=>/en|pl|uk/}
#                          category GET        (/:locale)/categories/:id(.:format)           categories#show {:locale=>/en|pl|uk/}
#                             about GET        (/:locale)/about(.:format)                    static_pages#about {:locale=>/en|pl|uk/}
#                          contacts GET        (/:locale)/contacts(.:format)                 static_pages#contacts {:locale=>/en|pl|uk/}
#                        email_form POST       (/:locale)/email(.:format)                    static_pages#send_email_form {:locale=>/en|pl|uk/}
#                                   GET        /:locale(.:format)                            artworks#index
#
# Routes for Ckeditor::Engine:
#         pictures GET    /pictures(.:format)             ckeditor/pictures#index
#                  POST   /pictures(.:format)             ckeditor/pictures#create
#          picture DELETE /pictures/:id(.:format)         ckeditor/pictures#destroy
# attachment_files GET    /attachment_files(.:format)     ckeditor/attachment_files#index
#                  POST   /attachment_files(.:format)     ckeditor/attachment_files#create
#  attachment_file DELETE /attachment_files/:id(.:format) ckeditor/attachment_files#destroy
#

Rails.application.routes.draw do
  get '/change_locale', to: 'settings#change_locale', as: :change_locale

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope "(:locale)", locale: /en|de|uk/ do
    root 'artworks#index'
    get 'artworks/change_position'
    get 'news/current' => 'posts#index', defaults: { show: "current" }
    get 'news/archive' => 'posts#index', defaults: { show: "archive" }
    resources :categories, only: [:show, :index]
    get 'about' => 'static_pages#about'
    get 'contacts' => 'static_pages#contacts'
    post 'email' => 'static_pages#send_email_form', as: :email_form
  end

  get '/:locale' => 'artworks#index'
end
