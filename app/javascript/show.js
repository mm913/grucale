function buttonClick(){
  let check = confirm('削除しますか？');
  console.log(check);
}
const btn = document.getElementById("delete_btn")
btn.addEventListener('click', buttonClick); 
  