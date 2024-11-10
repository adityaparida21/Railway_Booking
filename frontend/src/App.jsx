import axios from "axios";
const backendUrl = import.meta.env.VITE_BACKEND_URL;
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import "./App.css";
import {
  Login,
  Register,
  Home,
  Trains,
  Booking,
  Base,
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
        element: <Booking />,
        loader: async () => {
          let resp = await axios.get(`${backendUrl}/get_booking`)
          return resp;
        }
      },
    ],
  },
]);

function App() {
  return <RouterProvider router={router} />;
}

export default App;
