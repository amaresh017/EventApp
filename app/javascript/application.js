// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails


//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery3
//= require jquery-ui
//= require popper
//= require bootstrap-sprockets



// import "@hotwired/turbo-rails"
import "controllers"

import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false


