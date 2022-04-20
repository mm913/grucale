import consumer from "./consumer"

if(location.pathname.match(/\/schedules\/\d/)){
  //consumer.subscriptions.create({
    //channel: "CommentChannel",
    //schedule_id: location.pathname.match(/\d+/)[0]
  consumer.subscriptions.create("CommentChannel", {
  //}, {
    
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = `
            <div class="chat_display_left">
            <div class="chat_display_a" >
            </div>
            <div class="chat_display_b">
              <p class="chat_name" id="chat_name">${data.user.name}：</p>
            </div>
            <div class="chat_display_d">
              <p class="chat_time" id="chat_time">${data.time}</p>
            </div>
          </div>
          <div class="chat_display_right">
            <div class="chat_display_c">
              <p class="chat_message" id="chat_message">${data.comment.comment} </p>
            </div>   
          </div>`
    const comments = document.getElementById("comments")
    comments.insertAdjacentHTML('beforeend', html)  
    const commentForm = document.getElementById("comment-form")
    commentForm.reset();
    // Called when there's incoming data on the websocket for this channel
   
    }
  })
}
