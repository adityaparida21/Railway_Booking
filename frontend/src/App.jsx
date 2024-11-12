import axios from "axios";
const backendUrl = import.meta.env.VITE_BACKEND_URL;
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import "./App.css";
import {
  Login,
  Register,
  Home,
  Trains,
  Base,
  Transaction,
  Ticket,
} from "./components/index";

import { loader as TrainInfo } from "./components/Trains";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Base />,
    children: [
      {
        element: <Register />,
        index: true,
      },
      {
        path: "login",
        element: <Login />,
      },
      {
        path: "transactions",
        element: <Transaction />,
        loader: async () => {
          const customer = localStorage.getItem("User");
          let response = await axios.post(`${backendUrl}/transaction`, { customer });
          return response.data;
        },
      },
      {
        path: "ticket",
        element: <Ticket />,
      },
      {
        path: "search",
        element: <Home />,
      },
      {
        path: "results",
        element: <Trains />,
        loader: TrainInfo,
      },
      {
        path: "booking_details",
        element: <Ticket />,
        loader: async () => {
          let resp = await axios.get(`${backendUrl}/get_booking`)
          return { data: resp.data };
        }
      },
    ],
  },
]);

function App() {
  return <RouterProvider router={router} />;
}

export default App;
