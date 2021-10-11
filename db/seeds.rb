# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
codes = Airport.create([{ code: 'BUR' },
                        { code: 'LAX' },
                        { code: 'BED' },
                        { code: 'BOS' },
                        { code: 'ORD' },
                        { code: 'MDW' }])

flights = Flight.create([{ departure_airport_id: 1, arrival_airport_id: 2,
                           departure_datetime: "2021-11-01", duration: "1:00" },
                         { departure_airport_id: 2, arrival_airport_id: 1,
                           departure_datetime: "2021-11-02", duration: "2:00" },
                         { departure_airport_id: 3, arrival_airport_id: 4,
                           departure_datetime: "2021-11-03", duration: "3:00" },
                         { departure_airport_id: 4, arrival_airport_id: 3,
                           departure_datetime: "2021-11-04", duration: "4:00" },
                         { departure_airport_id: 5, arrival_airport_id: 6,
                           departure_datetime: "2021-11-01", duration: "1:00" },
                         { departure_airport_id: 6, arrival_airport_id: 5,
                           departure_datetime: "2021-11-02", duration: "2:00" },
                         { departure_airport_id: 1, arrival_airport_id: 2,
                           departure_datetime: "2021-11-03", duration: "3:00" },
                         { departure_airport_id: 1, arrival_airport_id: 3,
                           departure_datetime: "2021-11-04", duration: "4:00" },
                         { departure_airport_id: 1, arrival_airport_id: 4,
                           departure_datetime: "2021-11-01", duration: "1:00" },
                         { departure_airport_id: 2, arrival_airport_id: 3,
                           departure_datetime: "2021-11-02", duration: "2:00" },
                         { departure_airport_id: 2, arrival_airport_id: 4,
                           departure_datetime: "2021-11-03", duration: "3:00" },
                         { departure_airport_id: 2, arrival_airport_id: 5,
                           departure_datetime: "2021-11-04", duration: "4:00" }])
