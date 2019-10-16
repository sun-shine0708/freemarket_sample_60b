$(document).on('turbolinks:load', function() {
  
  function addNotificationHTML(){
    var html = `<div id=my-notification-content>
                  <div class="list">
                    <a class="tab-contents__notification link" href="">
                      <img class="mercari-icon" src="/assets/mercari_profile-ecb503acf2758077b319d89b793679e2de3ba39dbfcab4477bba8af2ca5475a9.png" alt="Mercari profile" width="48" height="48">
                      <div class = "notification-body">
                        <div class = "notification-body__title">
                          《速報》今なら販売手数料が実質無料！出品が超お得♪
                        </div>
                        <div class = "notification-body__time">
                          <i class="fa fa-history clock-icon"></i>
                          <span> 5時間前 </span>
                        </div>
                      </div>
                      <i class="fa fa-chevron-right right-icon"></i>
                    </a>
                  </div>
                  <div class="list">
                    <a class="tab-contents__notification link" href="">
                      <img class="mercari-icon" src="/assets/mercari_profile-ecb503acf2758077b319d89b793679e2de3ba39dbfcab4477bba8af2ca5475a9.png" alt="Mercari profile" width="48" height="48">
                      <div class = "notification-body">
                        <div class = "notification-body__title">
                          《速報》今なら販売手数料が実質無料！出品が超お得♪
                        </div>
                        <div class = "notification-body__time">
                          <i class="fa fa-history clock-icon"></i>
                          <span> 5時間前 </span>
                        </div>
                      </div>
                      <i class="fa fa-chevron-right right-icon"></i>
                    </a>
                  </div>
                  <div class="list">
                    <a class="tab-contents__notification link" href="">
                      <img class="mercari-icon" src="/assets/mercari_profile-ecb503acf2758077b319d89b793679e2de3ba39dbfcab4477bba8af2ca5475a9.png" alt="Mercari profile" width="48" height="48">
                      <div class = "notification-body">
                        <div class = "notification-body__title">
                          《速報》今なら販売手数料が実質無料！出品が超お得♪
                        </div>
                        <div class = "notification-body__time">
                          <i class="fa fa-history clock-icon"></i>
                          <span> 5時間前 </span>
                        </div>
                      </div>
                      <i class="fa fa-chevron-right right-icon"></i>
                    </a>
                  </div>
                  <div class="list">
                    <a class="tab-contents__notification link" href="">
                      <img class="mercari-icon" src="/assets/mercari_profile-ecb503acf2758077b319d89b793679e2de3ba39dbfcab4477bba8af2ca5475a9.png" alt="Mercari profile" width="48" height="48">
                      <div class = "notification-body">
                        <div class = "notification-body__title">
                          《速報》今なら販売手数料が実質無料！出品が超お得♪
                        </div>
                        <div class = "notification-body__time">
                          <i class="fa fa-history clock-icon"></i>
                          <span> 5時間前 </span>
                        </div>
                      </div>
                      <i class="fa fa-chevron-right right-icon"></i>
                    </a>
                  </div>
                  <div class="list">
                    <a class="tab-contents__notification link" href="">
                      <img class="mercari-icon" src="/assets/mercari_profile-ecb503acf2758077b319d89b793679e2de3ba39dbfcab4477bba8af2ca5475a9.png" alt="Mercari profile" width="48" height="48">
                      <div class = "notification-body">
                        <div class = "notification-body__title">
                          《速報》今なら販売手数料が実質無料！出品が超お得♪
                        </div>
                        <div class = "notification-body__time">
                          <i class="fa fa-history clock-icon"></i>
                          <span> 5時間前 </span>
                        </div>
                      </div>
                      <i class="fa fa-chevron-right right-icon"></i>
                    </a>
                  </div>
                  <div class="list-display">
                    <a class="link" href="">
                      <div class="list-display__btn">
                        一覧を見る
                      </div>
                    </a>
                  </div>
                </div>`;
    return html;
  }

  function addTodoHTML(){
    var html = `<div id=my-todo-content>
                  <div class="list">
                    <a class="tab-contents__notification link" href="">
                      <img class="mercari-icon" src="/assets/mercari_profile-ecb503acf2758077b319d89b793679e2de3ba39dbfcab4477bba8af2ca5475a9.png" alt="Mercari profile" width="48" height="48">
                      <div class = "notification-body">
                        <div class = "notification-body__title">
                          《速報》今なら販売手数料が実質無料！出品が超お得♪
                        </div>
                        <div class = "notification-body__time">
                          <i class="fa fa-history clock-icon"></i>
                          <span> 5時間前 </span>
                        </div>
                      </div>
                      <i class="fa fa-chevron-right right-icon"></i>
                    </a>
                  </div>
                  <div class="list-display">
                    <a class="link" href="">
                      <div class="list-display__btn">
                        一覧を見る
                      </div>
                    </a>
                  </div>
                </div>`;
    return html;
  }
  
  $("#my-notification-tab").on("click", function() {
    $(".tab-contents").empty();
    var html = addNotificationHTML;
    $(".tab-contents").prepend(html);
  });

  $("#my-todo-tab").on("click", function() {
    $(".tab-contents").empty();
    var html = addTodoHTML;
    $(".tab-contents").prepend(html);
  });
});