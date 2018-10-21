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
//= require jquery.slick
//= require bootstrap-sprockets
//= require_tree .

$(function(){
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('form').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".profile-preview");
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
                  class: "profile-preview",
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });


// sign_in sign_up モーダル
  $(function() {
    $('.modals').click(function(){
      $('.sign-background').show();
      $('.sign-modal-box').fadeIn(1000);
      if ($(this).hasClass('sign_up')){
         $('.sign-up-form').fadeIn(1000);
      } else if($(this).hasClass('sign_in')){
         $('.sign-in-form').fadeIn(1000);
      } else {
        $('.sign-background').hide();
        $('.sign-modal-box').hide();
      }
    })
    $('.sign-background').click(function(e){
      if (! $(e.target).closest('.sign-modal-box').length) {
         $('.sign-background').fadeOut(1000);
         $('.sign-modal-box').fadeOut(1000);
         $('.sign-up-form').fadeOut(1000);
         $('.sign-in-form').fadeOut(1000);
      }
    })
  });

// 画像投稿用　モーダル

  $(function() {
    $('.post').click(function(){
      $('.post-wrapper').fadeIn(500);
      $('.post-wrapper').fadeIn(500);
      $('.post-modal').fadeIn(500);
    })
    $('.remove-icon').click(function(){
      $('.post-wrapper').fadeOut(500);
      $('.post-modal').fadeOut(500);
    })
  });


// スライドショー
  $(function(){
    $('.slider').slick({
      autoplay: true,
      autoplaySpeed: 0,
      arrows: false,
      fade: true,
      speed: 5000
    });
  });






});


