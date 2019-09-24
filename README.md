# How to install Active Admin on a Rails Project ?

## 1. Config

### Documentation
Docs : https://activeadmin.info/documentation.html

### Project Config

```
# Gemfile
gem 'activeadmin'
```
puis
```
rails generate active_admin:install
```
puis
```
# active_admin.rb
def authenticate_admin!
  redirect_to new_user_session_path unless current_user && current_user.admin
end

ActiveAdmin.setup do |config|
  ActiveAdmin::ResourceController.class_eval do
    def find_resource
      scoped_collection.find(params[:id])
    end
  end

  config.site_title = PROJECT_NAME
  config.authentication_method = :authenticate_admin!
  config.current_user_method = :current_user
  config.logout_link_path = :destroy_user_session_path
  config.logout_link_method = :delete
  config.batch_actions = true
  config.localize_format = :long
  config.csv_options = { col_sep: ';' }
  config.include_default_association_filters = false
end
```

### Les petits plus
```
# gem to have more features - config in github
gem 'activeadmin_addons'
```

```
# gem pour le rendre responsive
https://github.com/formaweb/formadmin
```

## 2. Create all your models in Active Admin
```
rails generate active_admin:resource [MyModelName]
```

## 3. Details all what you want for each model

See the app/admin folder

# How to install Active Storage on a Rails Project ?

## link of active storage PR.
https://github.com/ClaudineP435433/demo_active_admin/pull/1/files

## Active storage standard
https://edgeguides.rubyonrails.org/active_storage_overview.html

## Gem to add Cloudinary in Active storage
https://github.com/0sc/activestorage-cloudinary-service

## Cool blog
https://evilmartians.com/chronicles/rails-5-2-active-storage-and-beyond
