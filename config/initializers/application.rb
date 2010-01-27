#Add any general application initialization
require 'acts-as-taggable-on'
TagList.delimiter = " "
Tag.has_friendly_id :name