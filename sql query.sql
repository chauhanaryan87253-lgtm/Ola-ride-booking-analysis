create database ola;  
use ola;
---- question ----
 # 1. Retrive all the sucessfull bookings.
create view sucessfull_booking as
select * from bookings
where booking_status ="success";
  
  select * from sucessfull_booking;
# 2.find the average ride distance from each vehicle type.
 create view average_distance_vehicle_type as 
 select  vehicle_type,avg(ride_distance)
 from bookings group by vehicle_type;

select * from average_distance_vehicle_type;  
# 3 get the total number of ride cancel by customer;
create view ride_cancel_by_customer as
select count(*) from bookings
where booking_status ='Canceled by Customer';
select  * from ride_cancel_by_customer ;

# 4 . list the top five customer who booked the highest number ride.
create view highest_ride  as
select customer_id ,count(customer_id)  as total_ride from bookings 
group by customer_id order by total_ride desc limit 5;

select * from highest_ride;
# 5. get the number of ride cancel by driver due ti personal and car related issue.
SELECT COUNT(*)
FROM bookings
WHERE Canceled_Rides_by_Driver = 'personal & car related issue';

# 6. find the max and min  driver ratings for prime sedan.
select max(driver_ratings) as max_rating,
 min(driver_ratings) as min_rating from bookings 
 where vehicle_type ='prime sedan' ;

# 7. retrive all the rides where payment done by upi.
 select * from bookings where payment_method ='upi';
 
 # 8.find the average rating per vehicle per type.
 select vehicle_type,avg(customer_rating) from bookings group by vehicle_type;
 
 # 9 calculate the total booking value of rides complete sucessfully.
  select sum(booking_value)  as total_booking_value from  bookings where booking_status ='success';
  
# 10. list all the incomplete rides along with the reason .
  select booking_id , incomplete_rides_reason from bookings where incomplete_rides ='yes';