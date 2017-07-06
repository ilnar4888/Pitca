source 'https://rubygems.org'

ruby "2.3.4"
gem 'rails', '~> 5.1.2'
gem "pg"                                          # для соеденения с базой postgress


# assets
gem "coffee-rails"                                # для чтения coffee файлов
gem "sass-rails", "~> 5.0.0", ">= 5.0.6"          # стандартная библиотека sass
gem "uglifier", ">= 2.7.2"                        # стандартная библиотека

source "https://rails-assets.org" do
  gem "rails-assets-jquery-ujs"                   # подключает jquery
  gem "rails-assets-jquery2"                      # подключает jquery2
end

# views
gem "active_link_to"                              # отображает ссылку, которую открыл посетитель
gem "metamagic"                                   # плагин для создания метатегов
gem "simple_form"                                 # плагин для создания понятных инпутов
gem "slim"                                        # упрощает код html с помощью иерархической структуры, аналог haml

# all other gems
gem "devise"                                      # гем для аутентификаций пользователя
gem "google-analytics-rails"                      # для анализа запросов на вебсайт
gem "puma"                                        # вебсервер для рейлс
gem "pundit"                                      # для создания системы авторизации
                                                  # профилировщик скорости отображения html страниц
gem 'listen', '~> 3.1.5'

group :staging, :production do
end

group :test do
  gem "capybara"                                  # помощник для тестирования
  gem "database_cleaner"                          # очистка базы перед повторным тестированием в среде тестирования
  gem "shoulda-matchers"                          # предоставляет короткие команды для тестирвания
end

group :development, :test do
  gem "rspec-rails", "~> 3.4"                     # самая крутая тестовая игрушка
  gem "byebug"                                    # отладчик для руби
  gem "factory_girl_rails"                        # создает объекты в основном используют для тестирования
  gem "slim_lint", require: false                 # настраиваемый инструмент для slim
end

group :development do
  gem "slim-rails"                                # использование слим при гененраций команд через scaffold and resources
  gem "spring"                                    # автоматический предразгрузчик rails s
  gem "web-console", "~> 2.0"                     #рейлс консоль в браузере
end
