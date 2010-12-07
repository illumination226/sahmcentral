Tinymce::Hammer.install_path = ['/javascripts/tiny_mce']
Tinymce::Hammer.plugins = ['style, table, paste, emotions, media, spellchecker, print']
Tinymce::Hammer.languages = ['en']

Tinymce::Hammer.init = [
[:theme, 'advanced'],
[:theme_advanced_toolbar_align, 'left'],
[:theme_advanced_toolbar_location, 'top'],
[:theme_advanced_buttons1, 'undo,redo,cut,copy,paste,pastetext,|,bold,italic,strikethrough,blockquote,charmap,bullist,numlist,removeformat,|,link,unlink,image,|,cleanup,code'],
[:theme_advanced_buttons2, 'forecolor,backcolor,|,formatselect,fontselect,fontsizeselect,|,justifyleft,justifycenter,justifyright,justifyfull,|,hr'],
[:theme_advanced_buttons3, 'styleprops,|,table,tablecontrols,|,emotions, media, spellchecker, print']
]