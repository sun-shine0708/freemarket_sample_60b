$(document).on('turbolinks:load', function() {
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html =`<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div id= 'children_wrapper'>
                          <select class="select-default" id="child_category" name="product[category_id]">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          </select>
                      </div>`;
    $('.detail-right-cate-top').append(childSelectHtml);
  }


  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div id= 'grandchildren_wrapper'>
                                <select class="select-default" id="grandchild_category" name="product[category_id]">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                            </div>`;
    $('.detail-right-cate-top').append(grandchildSelectHtml);
  }

  function appendDeliveryWayBox(){
    html = `<div id= 'products-new_main-delivary-right-area'>
              <div id=delivary-right-area-head>
                配送の方法
                <div id=products-new-redbtn>
                  必須
                </div>
              </div>
              <div id=delivary-right-area-box>
                <select id="select-default" name="product[delivery_way]">
                  <option value="---" data-category="---">---</option>
                  <option value="未定" data-category="---">未定</option>
                  <option value="らくらくメルカリ便" data-category="---">らくらくメルカリ便</option>
                  <option value="ゆうメール" data-category="---">ゆうメール</option>
                  <option value="レターパック" data-category="---">レターパック</option>
                  <option value="普通郵便(定形、定形外)" data-category="---">普通郵便(定形、定形外)</option>
                  <option value="クロネコヤマト" data-category="---">クロネコヤマト</option>
                  <option value="ゆうパック" data-category="---">ゆうパック</option>
                  <option value="クリックポスト" data-category="---">クリックポスト</option>
                  <option value="ゆうパケット" data-category="---">ゆうパケット</option>
                </select>
             </div>`;
    return html;
  }

  function appendDeliveryWayBox2(){
    html = `<div id= 'products-new_main-delivary-right-area'>
              <div id=delivary-right-area-head>
                配送の方法
                <div id=products-new-redbtn>
                  必須
                </div>
              </div>
              <div id=delivary-right-area-box>
                <select id="select-default" name="product[delivery_way]">
                  <option value="---" >---</option>
                  <option value="未定" >未定</option>
                  <option value="クロネコヤマト">クロネコヤマト</option>
                  <option value="ゆうパック">ゆうパック</option>
                  <option value="ゆうメール">ゆうメール</option>
                </select>
             </div>`;
    return html;
  }

  


  // 親カテゴリー選択後のイベント
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/products/get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除する
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });


  // 子カテゴリー選択後のイベント
  $('.detail-right-cate-top').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/products/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });

  
  $('.delivary-right-burden-box').on('change', function(){
    $('#products-new_main-delivary-right-area').remove(); 
    $('#delivary-right-area-head').remove();
    $('#products-new-redbtn').remove();
    $('#delivary-right-area-box').remove();
    $('#select-default').remove();
    var deliveryBurden = document.getElementById('delivary-right-burden-box').value;
    if (deliveryBurden == "送料込み(出品者負担)"){
      var html = appendDeliveryWayBox
      $(".products-new_main-delivary-detail").append(html)
    }
    else if (deliveryBurden == '着払い(購入者負担)'){
      var html = appendDeliveryWayBox2
      $(".products-new_main-delivary-detail").append(html)
    }
    else{
      $('#products-new_main-delivary-right-area').remove(); 
      $('#delivary-right-area-head').remove();
      $('#products-new-redbtn').remove();
      $('#delivary-right-area-box').remove();
      $('#select-default').remove();
    }
  });

  $(function(){
    $('#price_calc').on('input', function(){   //リアルタイムで表示したいのでinputを使う｡入力の度にイベントが発火するようになる｡
      var data = $('#price_calc').val(); // val()でフォームのvalueを取得(数値)
      var profit = Math.round(data * 0.9)  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡
      var fee = (data - profit) // 入力した数値から計算結果(profit)を引く｡それが手数料となる｡
      $('.right_bar').html(fee) //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡
      $('.right_bar').prepend('¥') // 手数料の前に¥マークを付けたいので
      $('.right_bar_2').html(profit)
      $('.right_bar_2').prepend('¥')
      $('#price').val(profit) // 計算結果を格納用フォームに追加｡もし､入力値を追加したいのなら､今回はdataを引数に持たせる｡
      if(profit == '') {   // もし､計算結果が''なら表示も消す｡
      $('.right_bar_2').html('ー');
      $('.right_bar').html('ー');
      }
    })
  })
})


  // 画像複数枚保存イベント

$(document).on('turbolinks:load', function(){
  var dropzone = $('.dropzone-area');
  var dropzone2 = $('.dropzone-area2');
  var dropzone_box = $('.dropzone-box');
  var images = [];
  var inputs  =[];
  var input_area = $('.input_area');
  var preview = $('#preview');
  var preview2 = $('#preview2');

$(document).on('change', 'input[type= "file"].upload-image',function(event) {
  var file = $(this).prop('files')[0];
  var reader = new FileReader();
  inputs.push($(this));
  var img = $(`<div class= "img_view"><div class=img_view_upper><img class= "product-new-img"></div></div>`);
  reader.onload = function(e) {
    var btn_wrapper = $('<div class="btn_wrapper"><div class="btn_edit">編集</div><div class="btn_delete">削除</div></div>');
    img.append(btn_wrapper);
    img.find('img').attr({
      src: e.target.result
    })
  }
  reader.readAsDataURL(file);
  images.push(img);

  if(images.length >= 5) {
    dropzone2.css({
      'display': 'block'
    })
    dropzone.css({
      'display': 'none'
    })
    $.each(images, function(index, image) {
      image.attr('data-image', index);
      preview2.append(image);
      dropzone2.css({
        'width': `calc(100% - (126px * ${images.length - 5}))`
      })
    })
// START
    if(images.length >= 6) {
      dropzone2.css({
        'position': 'absolute'
      })
    }
// end
    if(images.length == 9) {
      dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
    }
  } else {
      $('#preview').empty();
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
      })
      dropzone.css({
        'width': `calc(100% - (126px * ${images.length}))`
      })
    }
    if(images.length == 4) {
      dropzone.find('p').replaceWith('<i class="fa fa-camera"></i>')
    }
  if(images.length == 10) {
    dropzone2.css({
      'display': 'none'
    })
    return;
  }
  var new_image = $(`<input multiple= "multiple" name="images[url][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
  input_area.prepend(new_image);
  });
 
// 削除イベント

  // $(document).on('click', '.btn_delete', function() {
  //   var target_image = $(this).parent().parent();
  //   $.each(inputs, function(index, input){
  //     if ($(this).data('image') == target_image.data('image')){
  //       $(this).remove();
  //       target_image.remove();
  //       var num = $(this).data('image');
  //       images.splice(num, 1);
  //       inputs.splice(num, 1);
  //       if(inputs.length == 0) {
  //         $('input[type= "file"].upload-image').attr({
  //           'data-image': 0
  //         })
  //       }
  //     }
  //   })
  //   $('input[type= "file"].upload-image:first').attr({
  //     'data-image': inputs.length
  //   })
  //   $.each(inputs, function(index, input) {
  //     var input = $(this)
  //     input.attr({
  //       'data-image': index
  //     })
  //     $('input[type= "file"].upload-image:first').after(input)
  //   })
  //   if (images.length >= 5) {
  //     dropzone2.css({
  //       'display': 'block'
  //     })
  //     $.each(images, function(index, image) {
  //       image.attr('data-image', index);
  //       preview2.append(image);
  //     })
  //     dropzone2.css({
  //       'width': `calc(100% - (126px * ${images.length - 5}))`
  //     })
  //     if(images.length == 9) {
  //       dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
  //     }
  //     if(images.length == 8) {
  //       dropzone2.find('i').replaceWith('<p>ドラッグ&ドロップまたはクリックしてファイルをアップロード</p>')
  //     }
  //   } else {
  //     dropzone.css({
  //       'display': 'block'
  //     })
  //     $.each(images, function(index, image) {
  //       image.attr('data-image', index);
  //       preview.append(image);
  //     })
  //     dropzone.css({
  //       'width': `calc(100% - (126px * ${images.length}))`
  //     })
  //   }
  //   if(images.length == 4) {
  //     dropzone2.css({
  //       'display': 'none'
  //     })
  //   }
  //   if(images.length == 3) {
  //     dropzone.find('i').replaceWith('<p>ドラッグ&ドロップまたはクリックしてファイルをアップロード</p>')
  //   }
  // })
});
  // editのjs

  function appendEditChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<select class="select-default" id="child_category-edit-add" name="product[category_id]">
                          <option value="---" data-category="---">---</option>
                          ${insertHTML}
                        </select>`;
    $('.detail-right-cate-top').append(childSelectHtml);
  }


  // 孫カテゴリーの表示作成
  function appendEditGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<select class="select-default" id="grandchild_category-edit-add" name="product[category_id]">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                            </select>`;
    $('.detail-right-cate-top').append(grandchildSelectHtml);
  }

   // 親カテゴリー選択後のイベント
   $('#parent_category-edit').on('change', function(){
    var parentCategory = document.getElementById('parent_category-edit').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/products/get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#child_category-edit').remove(); //親が変更された時、子以下を削除する
        $('#child_category-edit-add').remove();
        $('#grandchild_category-edit').remove();
        $('#grandchild_category-edit-add').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendEditChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#child_category-edit').remove(); //親が変更された時、子以下を削除する
      $('#child_category-edit-add').remove();
      $('#grandchild_category-edit').remove();
      $('#grandchild_category-edit-add').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });

// 初期子カテゴリー選択後のイベント
  $('#child_category-edit').on('change', function(){
    var childCategory = document.getElementById('child_category-edit').value; //選択された子カテゴリーの名前を取得
    console.log(childCategory)
    if (childCategory != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/products/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childCategory },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchild_category-edit').remove();
          $('#grandchild_category-edit-add').remove();
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendEditGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchild_category-edit').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });


  // 子カテゴリー選択後のイベント
  $('.detail-right-cate-top').on('change', '#child_category-edit-add', function(){
    var childId = $('#child_category-edit-add option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/products/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchild_category-edit').remove();
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendEditGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchild_category-edit').remove();
      $('#grandchild_category-edit-add').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });

  
  $(function() {
    $('.top-banner-slider').slick({
        prevArrow:'<i class="slider-controller-left"></i>',
        nextArrow:'<i class="slider-controller-right"></i>',
        autoplay: true,
        autoplaySpeed: 4000,
        speed: 800
    });
  
    $('.top-banner-slider').on(function() {
      $('.top-banner-slider').slick('goTo', $(this).index());
    });
  });
});