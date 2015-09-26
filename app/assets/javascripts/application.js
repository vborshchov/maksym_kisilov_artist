// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require owl.carousel
//= require photoswipe
//= require_tree .
var ready = function(){

  $(document).foundation();
  // PhotoSwipe用のHTMLを描画
    function buildPswdHtml(){
      $("body").append([
'        <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">',
'            <div class="pswp__bg"></div>',
'            <div class="pswp__scroll-wrap">',
'                <div class="pswp__container">',
'                    <div class="pswp__item"></div>',
'                    <div class="pswp__item"></div>',
'                    <div class="pswp__item"></div>',
'                </div>',
'                <div class="pswp__ui pswp__ui--hidden">',
'                    <div class="pswp__top-bar">',
'                        <div class="pswp__counter"></div>',
'                        <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>',
'                        <button class="pswp__button pswp__button--share" title="Share"></button>',
'                        <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>',
'                        <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>',
'                        <div class="pswp__preloader">',
'                            <div class="pswp__preloader__icn">',
'                              <div class="pswp__preloader__cut">',
'                                <div class="pswp__preloader__donut"></div>',
'                              </div>',
'                            </div>',
'                        </div>',
'                    </div>',
'                    <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">',
'                        <div class="pswp__share-tooltip"></div>',
'                    </div>',
'                    <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">',
'                    </button>',
'                    <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">',
'                    </button>',
'                    <div class="pswp__caption">',
'                        <div class="pswp__caption__center"></div>',
'                    </div>',
'                </div>',
'            </div>',
'        </div>'
      ].join(""));
    }
  // ギャラリーから、PhotoSwipe用のitemsを取得
  function getGalleryItems($gallery){
    var items = [];
    $gallery.find("a").each(function(){
      var $anchor = $(this),
          size = $anchor.attr("data-size").split("x"),
          title = $anchor.attr("data-title"),
          item = {
            el: $anchor.get(0),
            src: $anchor.attr("href"),
            w: parseInt(size[0]),
            h: parseInt(size[1])
          };
      // キャプション
      if( title ) item.title = title;
      items.push(item);
    });
    return items;
  }
  // PhotoSwipeを開く
  function openGallery($gallery, index, items, pswpOptions){
    var $pswp = $(".pswp"),
        owl = $gallery.data("owlCarousel"),
        gallery;
    // オプション値を設定
    var options = $.extend(true, {
      // 開く画像番号
      index: index,
      // 画像クリック時のズーム設定
      getThumbBoundsFn: function(index){
        var $thumbnail = $(items[index].el).find("img"),
            offset = $thumbnail.offset();
        return {
          x: offset.left,
          y: offset.top,
          w: $thumbnail.outerWidth()
        };
      }
    }, pswpOptions);
    // PhotoSwipeを表示
    gallery = new PhotoSwipe($pswp.get(0), PhotoSwipeUI_Default, items, options);
    gallery.init();
    // PhotoSwipe側の切り替えに応じて、OwlCarouselも位置を調整する
    gallery.listen("beforeChange", function(x){
      owl.goTo(this.getCurrentIndex());
    });
    gallery.listen("close", function(){
      this.currItem.initialLayout = options.getThumbBoundsFn(this.getCurrentIndex());
    });
  }
  // 初期化
  function initializeGallery($elem, owlOptions, pswpOptions){
    // PhotoSwipe用のDOMが存在しない場合、新しく描画
    if( $(".pswp").size() === 0 ){
      buildPswdHtml();
    }
    // 複数のギャラリーに対応するために走査
    $elem.each(function(i){
      var $gallery = $(this),
          uid = i + 1,
          items = getGalleryItems($gallery),
          options = $.extend(true, {}, pswpOptions);
      // OwlCarouselの初期化
      $gallery.owlCarousel(owlOptions);
      // 各ギャラリーに対してユニークなIDを割り当てる
      options.galleryUID = uid;
      $gallery.attr("data-pswp-uid", uid);
      // 各アイテムのクリックで、PhotoSwipeを起動
      $gallery.find(".owl-item").on("click", function(e){
        if( !$(e.target).is("img") ) return;
        // itemsはPhotoSwipe.init()に書き換えられるのでコピーを渡す
        openGallery($gallery, $(this).index(), items.concat(), options);
        return false;
      });
    });
  }
  // サンプルでは`.owl-carousel`に対して処理を実行する
  var owlOptions = {
        autoHeight : true,
        transitionStyle:"fade",
        autoplay : true,
        navigation : false, // Show next and prev buttons
        slideSpeed : 300,
        paginationSpeed : 400,
        singleItem:true,
        loop:true
      },
      pswpOptions = {
        bgOpacity: 0.9,
        history: false,
        shareEl: false
      };
  initializeGallery($(".owl-carousel"), owlOptions, pswpOptions);
};
$(document).ready(ready)
$(document).on('page:change', ready)