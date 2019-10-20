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
                          <select>
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
    console.log(parentCategory)
    if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
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
        url: 'get_category_grandchildren',
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

});