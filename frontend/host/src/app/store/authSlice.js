import
{
  createSlice,
  createAsyncThunk,
} from "@reduxjs/toolkit";
import authService from "../../api-service/authService";

export const login = createAsyncThunk('auth/login', async (user) =>
{
  const { username, password } = user
  const res = await authService.login(username, password)
  return res
})
export const getUser = createAsyncThunk('auth/getUser', async () =>
{
  const res = await authService.getUser()
  return res
})
let tokenString = null;
try {
  tokenString = JSON.parse(localStorage.getItem('token'))
} catch {

}

const initialState = {
  user: null,
  token: tokenString,
};

const userSlice = createSlice({
  name: "auth",
  initialState,
  reducers: {
    setToken: (state, action) =>
    {
      state.token = action.payload
      localStorage.setItem("token", JSON.stringify(action.payload))
    },
    logout: (state) =>
    {
      state.token = null;
      state.user = null;
      localStorage.setItem("token", null)
    }
  },
  extraReducers(builder)
  {
    builder
      .addCase(login.fulfilled, (state, action) =>
      {
        state.token = action.payload
        localStorage.setItem("token", JSON.stringify(action.payload))
      })
      .addCase(getUser.fulfilled, (state, action) =>
      {
        state.user = action.payload
      })
  }
});

export const selectUser = state => state.auth.user;
export const selectToken = state => state.auth.token;

export const { logout, setToken } = userSlice.actions;
export default userSlice.reducer;
