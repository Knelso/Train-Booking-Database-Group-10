1 PROBLEM STATEMENT AND CREATIVITY FOCUS

The booking system should be able to solve the following common issues
1. Overbooking and seat conflict – Prevents double booking
2. Dynamic seat allocation ---- Handle changing availability in real time
3. Passenger convenience --- Allow flexible rescheduling and cancellations
4. Operational Insights --- Provides a detailed report for stations management e.g Most used Routes


2 KEY FEATURES

1. Real time seat availability --- Ensure up to date tracking of seats per train
2. Multi Station stops --- Handle complex routes with intermediate stations
3. Passenger profiles --- Keeps records of frequent travelers for loyalty programs



3 E.R.D (ENTITY RELATIONSHIP DIAGRAM ) DESIGN
ENTITIES AND THEIR RELATIONSHIP

PASSENGER TABLE
# Attributes : PassengerID , Name , Email , Phone , Gender , Age
# Relationship : Can make multiple bookings



TRAIN TABLE
# Attributes : TrainID , TrainName , Traintype(express , sleeper) capacity
# Relationship[[ : Operates on one or more routes



STATION TABLE
# Attribute : StationID , StationName , Location ,
# Relationship : Linked to trains via routes 

SCHEDULE TABLE
# Attributes --- ShceduleID , TrainID , RouteID , DepartureTime , ArrivalTime
# Relationship ---- Linked to the train and route


ROUTE TABLE
# Attribute --- RouteID , OriginstationID , DestinationID , Distance
# Relationships --- Has multiple schedules



BOOKING TABLE
# Attributes --- BookingID PassengerID ScheduleID , BookingDate , seatnumber bookingstatus
(confirmed , cancelled)
# Relationship --- Linked to passengers and schedules


PAMENTS TABLE
# Attributes --- PaymentID , BookingID, PaymentMethod , Amount
# Relationship --- Linked to bookings