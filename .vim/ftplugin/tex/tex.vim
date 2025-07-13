vim9script

#compiler tex
#
#def Compile()
#  w
#  cd %:p:h
#  silent make
#  cd -
#  cw
#  redraw!
#enddef
#
#def OnError(channelname: channel, msg: string)
#  echoerr msg
#enddef

def Openpdf()
  const proc = "zathura"
  const optc = expand('%:p:r') .. ".pdf"
  const optd = "--synctex-forward"
  const opte = line(".") .. ":" .. col(".") .. ":" .. expand('%:p')
  const cmd = [proc, optc, optd, opte]
 # job_start(cmd, {"err_cb": OnError})
job_start(cmd) 
enddef

nnoremap <buffer> <leader>o <ScriptCmd>Openpdf()<LF>

#nnoremap <buffer> <leader>i <ScriptCmd>Compile()<LF>
