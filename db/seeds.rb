# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Task.delete_all

Task.create(
    title: 'add checkbox',
    done: false)

Task.create(
    title: 'save to git',
    done: false)

Task.create(
    title: 'Heroku',
    done: false)

Task.create(
    title: 'Start codding',
    done: true)

Task.create(
    title: 'install all soft',
    done: true)
