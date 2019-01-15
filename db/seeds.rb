# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

general_reports = GeneralReport.create([{ title: 'Templars Report', description: 'You must construct additional pylons.' },
                                        { title: 'Marines Report', description: 'You must construct additional supply depos' },
                                        { title: 'Overmind Report', description: 'Need more overlors' }])

data_hall_reports = DataHallReport.create([{ title: 'Pylon Data Hall Report', general_report: general_reports[0] },
                                           { title: 'Warp Gate Data Hall Report', general_report: general_reports[0] },
                                           { title: 'Supply Depo Data Hall Report', general_report: general_reports[1] },
                                           { title: 'Hive Data Hall Report', general_report: general_reports[2] }])

DataHall.create([{ title: 'Warp Field Data Hall', data_hall_report: data_hall_reports[0] },
                 { title: 'Mineral Fields Data Hall', data_hall_report: data_hall_reports[0] },
                 { title: 'Ghost Data Hall', data_hall_report: data_hall_reports[1] },
                 { title: 'Ultralist Data Hall', data_hall_report: data_hall_reports[2] }])
