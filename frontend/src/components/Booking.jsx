import { useLoaderData } from "react-router-dom";
import axios from "axios";
import { styled } from "styled-components";
const backendUrl = import.meta.env.VITE_BACKEND_URL || "https://railway-booking-gz6f.onrender.com";

export const loader = async () => {
  try {
    let resp = await axios.get(`${backendUrl}/get_booking`);
    return resp;
  } catch (error) {
    console.error("Failed to fetch booking details:", error);
    throw new Error("Could not fetch booking details. Please try again later.");
  }
};


function Booking() {
  let { data } = useLoaderData();
  console.log(data);

  return (
    <Container>
      <div className="journey">
        <h2 className="details">Train No : {data.train} <span>Train Name : {data.trainName}</span></h2> 
        <h2>Booked<br/>From :{data.source}</h2>
        <h2>TO: {data.destination}</h2>
        <h2>Departure: {data.departure}</h2>
        <h2>Arrival : {data.arrival}</h2>
        <h2>Coach : {data.seat}</h2>
        <h2>Seat : {data.seatno}</h2>
      </div>
    </Container>
  )
}

const Container = styled.div`
height: 100vh;
display: flex;
flex-direction: column;
justify-content: center;
gap: 3rem;
align-items: center;
background-color: #131324;
.User{
  color:white;
  font-size:1.5rem;
}
.journey{
  color:white;
  font-size:1.2rem;
  .details{
    display:flex;
    gap:5rem;
  }
}
`;


export default Booking;
