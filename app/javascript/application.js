// Sprockets configuration for older Rails versions

//= require rails-ujs           // For unobtrusive JavaScript
//= require activestorage        // For file uploads using ActiveStorage
//= require turbolinks
//= require channels             // For ActionCable real-time features
//= require_tree .               // Require all JS files in the directory

// jQuery (if you're using it)
import $ from 'jquery';
global.$ = jQuery;

