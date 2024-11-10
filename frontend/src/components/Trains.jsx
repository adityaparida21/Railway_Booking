import axios from "axios";
import { useEffect, useState } from "react";
import {  useLoaderData, useNavigate } from "react-router-dom";
import styled from "styled-components";
const backendUrl = import.meta.env.VITE_BACKEND_URL;

export const loader = async () => {
  let resp = await axios.get(`${backendUrl}/search`);
  return resp;
};

const Trains = () => {
  const nav = useNavigate();
  const { data } = useLoaderData();
  const [seatsInfo, setSeatsInfo] = useState();

  async function Add(seat_type, tr) {
    let user_info = JSON.parse(localStorage.getItem("User"));
    setSeatsInfo(seatsInfo => ({ seat_type, tr, user_info }));
  }

  useEffect(() => {
    if (seatsInfo) {
      Submit(seatsInfo).then(() => {
        nav("/booking_details");
      });
    }
  }, [seatsInfo]);

  async function Submit(lala) {
    console.log(lala);
    let resp = await axios.post(`${backendUrl}/booking`, lala);
    if (resp !== null) {
      return 1;
    }
  }

  const res = data.map((train, index) => {
    return (
      <form key={index}>
        <Wrapper>
          <div className="trains">
            <h1>Train Name: {train.TrainName}</h1>
            <h2>Train No: {train.TrainNo}</h2>
            <h2>Start: {train.Source}</h2>
            <h2>Destination: {train.Destination}</h2>
            <h2>Arrival: {train.ArrivalTime} Departure: {train.DepartureTime}</h2>
            <h1>Seats: </h1>
            {train["AC3"] !== null && (
              <>
                <h2>3AC: {train["AC3"]}</h2>
                <button onClick={(e) => { e.preventDefault(); Add("AC3", train.TrainNo); }}>Add</button>
              </>
            )}
            {train["SLEEPER"] !== null && (
              <>
                <h2>Sleeper: {train["SLEEPER"]}</h2>
                <button onClick={(e) => { e.preventDefault(); Add("SLEEPER", train.TrainNo); }}>Add</button>
              </>
            )}
            {train["AC2"] !== null && (
              <>
                <h2>2AC: {train["AC2"]}</h2>
                <button onClick={(e) => { e.preventDefault(); Add("AC2", train.TrainNo); }}>Add</button>
              </>
            )}
            {train["AC1"] !== null && (
              <>
                <h2>1AC: {train["AC1"]}</h2>
                <button onClick={(e) => { e.preventDefault(); Add("AC1", train.TrainNo); }}>Add</button>
              </>
            )}
            {train["AC_Chair"] !== null && (
              <>
                <h2>AC chair car: {train["AC_Chair"]}</h2>
                <button onClick={(e) => { e.preventDefault(); Add("AC_Chair", train.TrainNo); }}>Add</button>
              </>
            )}
            {train["Exec_Chair"] !== null && (
              <>
                <h2>Executive Chair car: {train["Exec_Chair"]}</h2>
                <button onClick={(e) => { e.preventDefault(); Add("Exec_Chair", train.TrainNo); }}>Add</button>
              </>
            )}
          </div>
        </Wrapper>
      </form>
    );
  });

  return res;
};

const Wrapper = styled.div`
border-color:white;
background-color: #131324;
margin: 3rem 3rem;
  border: 1px solid white;
  border-radius:1rem;
  padding: 2rem 2rem;
  .trains{
    h1,h2,h3,p{
      color:red;
    }
    h1{
      color:white;
      font-size:3rem;
    }
    button{
      height:5rem;
      width:8rem;
      border-radius:1rem;
      border:none;
      font-size:1.3rem;
      background-color:grey;
    }
    button:hover{
      background-color:white;
      color:red;
    }

  }


`;

export default Trains;