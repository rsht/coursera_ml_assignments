%function [x,y, Xval, yval] = buildData()
function XAll = buildData()

XAll = {};
%load spam data
cd "spam";
dirlist = dir('.');

skip_filenames = { ".", ".." };
for i=1:length(dirlist)
  cur_filename = dirlist(i).name;
  
  if (strcmp(cur_filename, '.') || (strcmp(cur_filename, '..')))
    continue;
  endif
  
  raw_str = fileread(cur_filename);  
  
  XAll(1, end + 1) = raw_str;
endfor
