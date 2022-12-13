import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import accommodationService from "../../../api-service/accommodationService";
import RoomCard from "./RoomCard";
import ToolBar from "./ToolBar";

function DefaultRoom() {
  const { id } = useParams();
  const [choosedRoom, setChoosedRoom] = useState({});

  const [rooms, setRooms] = useState([]);

  const fetchData = async () => {
    const res = await accommodationService.getAccommodationsOfHost(id);
    const initial = {};
    res.data.forEach((r) => (initial[r.id] = false));
    setChoosedRoom(initial);
    setRooms(res.data);
  };
  useEffect(() => {
    fetchData();
  }, []);

  return (
    <div>
      <ToolBar choosedRoom={choosedRoom} />
      <div className="room-container">
        {rooms.map((r) => (
          <RoomCard
            name={r.name}
            key={r.id}
            onClick={() =>
              setChoosedRoom((pre) => ({ ...pre, [r.id]: !pre[r.id] }))
            }
            isActive={choosedRoom[r.id]}
          />
        ))}
      </div>
    </div>
  );
}

export default DefaultRoom;
