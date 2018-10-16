// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require activestorage
//= require jquery
//= require rails-ujs
//= require jquery.turbolinks
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function(){
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('form').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".preview");
        t = this;

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        $preview.empty();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "150px",
                  class: "preview",
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });


  // skippr
  // $("document").ready(function() {

  //   // オプションを指定してSkipprの実行
  //   $(".theTarget").skippr({
  //       // スライドショーの変化 ("fade" or "slide")
  //       transition : 'fade',
  //       // 変化に係る時間(ミリ秒)
  //       speed : 50,
  //       // easingの種類
  //       easing : 'easeOutQuart',
  //       // ナビゲーションの形("block" or "bubble")
  //       navType : 'block',
  //       // 子要素の種類("div" or "img")
  //       childrenElementType : 'div',
  //       // ナビゲーション矢印の表示(trueで表示)
  //       arrows : true,
  //       // スライドショーの自動再生(falseで自動再生なし)
  //       infinite : false,
  //       autoPlay : true,
  //       // 自動再生時のスライド切替間隔(ミリ秒)
  //       autoPlayDuration : 4000,
  //       // キーボードの矢印キーによるスライド送りの設定(trueで有効)
  //       keyboardOnAlways : true,
  //       // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
  //       hidePrevious : false
  //   });
  // });

// $('.single-item-rtl').slick({
//     rtl: true
//     });



  $('#sampleButton').click( function () {
    $('#sampleModal').modal();
  });

  // $(function(){
  //   $('.slider').slick();

  // });
  $(function(){
    $('#top-image').not('.slick-initialized').slick({});
  });



});


