CKEDITOR.editorConfig = function(config) {
  config.language = 'uk'; //this could be any language
  // You could delete or reorder any of this elements as you wish
  config.toolbar_Menu = [
    { name: 'document', items: ['Source', '-', 'Preview', 'Print', '-', 'Templates'] }, 
    { name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo'] }, 
    { name: 'editing', items: ['Find', 'Replace', '-', 'SelectAll', '-', 'SpellChecker', 'Scayt'] }, 
    { name: 'tools', items: ['Maximize', 'ShowBlocks', '-', 'About'] }, '/', 
    { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat'] }, 
    { name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl'] }, 
    { name: 'links', items: ['Link', 'Unlink', 'Anchor'] }, '/', 
    { name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize'] }, 
    { name: 'colors', items: ['TextColor', 'BGColor'] }, 
    { name: 'insert', items: ['Image', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak'] }
  ];
  config.toolbar = 'Menu';
  return true;
};