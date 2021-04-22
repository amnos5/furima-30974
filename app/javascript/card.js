const pay = () => {
  Payjp.setPublicKey("pk_test_6fbb54031e623fa08521fb5d");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("load", pay);