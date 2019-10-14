$(document).on('turbolinks:load', function() {


    // 子カテゴリーを追加するための処理です。
  function buildChildrenHTML(){
    var html = `<ul class='header_children-nav'>
                </ul>`;
    return html;
  }
  function buildChildHTML(child){
    var html =`<li class="header_children-list" data-id= "${child.id}">
                <a class="header_children-link" href="">${child.name}</a>
              </li>`;
    return html;
  }

  $(".header_parent-list").on("mouseenter", function() {
    var id = this.id                      //どのリンクにマウスが乗ってるのか取得します
    $(".header_children-list").remove();//一旦出ている子カテゴリ消します！
    $(".header_grandchildren-nav").remove();
    
    $.ajax({
      type: 'GET',
      url: '/categories/get_category_children',
      data: {parent_id: id},//どの親の要素かを送ります params[:parent_id]で送られる
      dataType: 'json'
    }).
    done(function(children) {
      var html = buildChildrenHTML()
      $(".header_category-nav").append(html)
      children.forEach(function (child) {
        var html = buildChildHTML(child);//HTMLにして
        $(".header_children-nav").append(html);//リストに追加します
      })
    });
    $(".nav-left__cate").on("mouseleave", function() {
      $(".header_children-nav").remove();
      $(".header_grandchildren-nav").remove();
    });
  });


  // 孫カテゴリを追加する処理
  
  function buildGrandChildrenHTML(){
    var html = `<ul class='header_grandchildren-nav'>
                </ul>`;
    return html;
  }

  function buildGrandChildHTML(grandchild){
    var html =`<li class="header_grandchildren-list" data-id="${grandchild.id}">
                <a class="header_grandchildren-link" href="">${grandchild.name}</a>
              </li>`;
    return html;
  }

  $(".header_category-nav").on("mouseenter", ".header_children-list", function () {
    var id = $(this).data('id');
    $(".header_grandchildren-list").remove();
    $.ajax({
      type: 'GET',
      url: '/categories/get_category_grandchildren',
      data: {child_id: id},
      dataType: 'json'
    })
    .done(function(grandchildren) {
      var html = buildGrandChildrenHTML()
      $(".header_category-nav").append(html)
      grandchildren.forEach(function (grandchild) {
        var html = buildGrandChildHTML(grandchild);
        $(".header_grandchildren-nav").append(html);
      })
    });
  });
});