patch -d vim/bundle/lightline.vim -p1 <<'EOF'
diff --git i/autoload/lightline/colorscheme/solarized_dark.vim w/autoload/lightline/colorscheme/solarized_dark.vim
index f2b5f2c..ffb8baa 100644
--- i/autoload/lightline/colorscheme/solarized_dark.vim
+++ w/autoload/lightline/colorscheme/solarized_dark.vim
@@ -5,28 +5,23 @@
 " License: MIT License
 " Last Change: 2014/01/02 23:40:14.
 " =============================================================================
-let s:base03 = [ '#002b36', 17 ]
-let s:base02 = [ '#073642', 24 ]
-let s:base01 = [ '#586e75', 241 ]
-let s:base00 = [ '#657b83', 66 ]
-let s:base0 = [ '#839496', 102 ]
-let s:base1 = [ '#93a1a1', 109 ]
-let s:base2 = [ '#eee8d5', 188 ]
-let s:base3 = [ '#fdf6e3', 230 ]
-let s:yellow = [ '#b58900', 136 ]
-let s:orange = [ '#cb4b16', 166 ]
-let s:red = [ '#dc322f', 167 ]
-let s:magenta = [ '#d33682',168 ]
-let s:violet = [ '#6c71c4', 61 ]
-let s:blue = [ '#268bd2', 32 ]
-let s:cyan = [ '#2aa198', 36 ]
-let s:green = [ '#859900', 100 ]
-" if &background ==# 'light'
-"   let [s:base03, s:base3] = [s:base3, s:base03]
-"   let [s:base02, s:base2] = [s:base2, s:base02]
-"   let [s:base01, s:base1] = [s:base1, s:base01]
-"   let [s:base00, s:base0] = [s:base0, s:base00]
-" endif
+let s:base03 = [ '#002b36', 8 ]
+let s:base02 = [ '#073642', 0 ]
+let s:base01 = [ '#586e75', 10 ]
+let s:base00 = [ '#657b83', 11  ]
+let s:base0 = [ '#839496', 12 ]
+let s:base1 = [ '#93a1a1', 14 ]
+let s:base2 = [ '#eee8d5', 7 ]
+let s:base3 = [ '#fdf6e3', 15 ]
+let s:yellow = [ '#b58900', 3 ]
+let s:orange = [ '#cb4b16', 9 ]
+let s:red = [ '#dc322f', 1 ]
+let s:magenta = [ '#d33682', 5 ]
+let s:violet = [ '#6c71c4', 13 ]
+let s:blue = [ '#268bd2', 4 ]
+let s:cyan = [ '#2aa198', 6 ]
+let s:green = [ '#859900', 2 ]
+
 let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
 let s:p.normal.left = [ [ s:base3, s:blue ], [ s:base3, s:base01 ] ]
 let s:p.normal.right = [ [ s:base02, s:base0 ], [ s:base1, s:base01 ] ]
 EOF
