import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

let hb;
let last_hb;
let hb_int;
let sq = 0;

socket.connect()

let channel = socket.channel("skt:lobby", {})
channel.join()
  .receive("ok", resp => { console.log("[WS] Connected to WebSocket.", resp) })
  .receive("error", resp => { console.log("[WS] Error connecting to WebSocket.", resp) })

// Socket Message Handlers
channel.on("HELLO", payload => {
  hb_int = Number(payload["heartbeatInterval"])
  channel.push("HELLO_ACK")
})

channel.on("READY", payload => {
  setInterval(()=> {
    channel.push("HEARTBEAT", {s: ++sq})
  }, hb_int)
})

channel.on("HEARTBEAT_ACK", payload => {
  console.log("[WS] Heartbeat Acknowledged.")
})


export default socket
