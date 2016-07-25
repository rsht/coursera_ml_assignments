%function [x,y, Xval, yval] = buildData()
function XAll = buildData()

dataset_root_folder = strcat(pwd, "/my_dataset/");
Xt = {};

%load spam data
spam_dir = strcat(dataset_root_folder, "spam/");
dirlist = dir(spam_dir);

skip_filenames = { ".", ".." };
for i=1:length(dirlist)
  cur_filename = dirlist(i).name;
  if (strcmp(cur_filename, '.') || (strcmp(cur_filename, '..')))
    continue;
  endif
  
  cur_full_filename = strcat(spam_dir, cur_filename);
  
  raw_str = fileread(cur_full_filename);
  Xt(1, end + 1) = raw_str;
endfor

XAll = processEmail(Xt);
%XAll = emailFeatures(processEmail(XAll));

% not spam

% Y

% split for cross validation