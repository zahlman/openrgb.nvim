if exists('g:loaded_openrgb')
  finish
endif
let g:loaded_openrgb = 'yes'

let g:openrgb_connection_failed = 0

if !exists("g:openrgb_mode_dict")
  " default dict
  let s:default_dict = {
    \ 'vim_color': '#000000',
    \ 'led_names': [[]],
    \ 'led_vim_colors': []
    \ }
  let g:openrgb_mode_dict = {}
  for mode in ['n', 'v', 'V', '', 'i', 'R', 'c', 't', 'default']
    let g:openrgb_mode_dict[mode] = copy(s:default_dict)
  endfor

  " keys definition
  let s:keys_arrow =
        \ ['Key: Right Arrow', 'Key: Left Arrow', 'Key: Up Arrow', 'Key: Down Arrow']
  let s:keys_special = ['Key: Escape', 'Key: Left Control', 'Key: Left Windows',
        \ 'Key: Left Alt', 'Key: Left Shift']
  let s:keys_operator = ['Key: C', 'Key: D', 'Key: Y', 'Key: G']
  let s:keys_inner_a = ['Key: A', 'Key: I']
  let s:keys_text_object = ['Key: W', 'Key: P', 'Key: [',  'Key: ]', 'Key: 9', 'Key: 0']

  " customize dict
  " -- normal
  let g:openrgb_mode_dict['n']['vim_color'] = '#a89984'
  let g:openrgb_mode_dict['n']['led_names'] = [
        \ s:keys_arrow + s:keys_special,
        \ s:keys_operator,
        \ s:keys_inner_a + s:keys_text_object,
        \ ]
  " -- visual
  let g:openrgb_mode_dict['v']['vim_color'] = '#fe8019'
  let g:openrgb_mode_dict['v']['led_names'] = [s:keys_arrow + s:keys_special]
  let g:openrgb_mode_dict['V'] = g:openrgb_mode_dict['v']
  let g:openrgb_mode_dict[''] = g:openrgb_mode_dict['v']
  " -- insert
  let g:openrgb_mode_dict['i']['vim_color'] = '#83a598'
  let g:openrgb_mode_dict['i']['led_names'] = [s:keys_arrow + s:keys_special]
  " -- replace
  let g:openrgb_mode_dict['R']['vim_color'] = '#8ec07c'
  let g:openrgb_mode_dict['R']['led_names'] = [s:keys_arrow + s:keys_special]
  " -- command
  let g:openrgb_mode_dict['c']['vim_color'] = '#a89984'
  let g:openrgb_mode_dict['c']['led_names'] = [s:keys_arrow + s:keys_special]
  " -- terminal
  let g:openrgb_mode_dict['t']['vim_color'] = '#b8bb26'
  let g:openrgb_mode_dict['t']['led_names'] = [s:keys_arrow + s:keys_special]
endif
