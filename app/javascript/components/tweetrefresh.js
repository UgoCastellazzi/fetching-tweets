const keywordId = document.querySelector("span").dataset.keywordid;
const url = `/keywords/${keywordId}/refresh_tweets`

const plugRefresh = (keyword) => {
  const refreshButton = document.getElementById("refresh-button");
  refreshButton.addEventListener("click", refresh);
  window.setInterval(refresh, 10000);
}

const refresh = () => {
  fetch(url).then((response) => {
    document.location.reload(true);
  });
}

export { plugRefresh };