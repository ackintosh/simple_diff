# -*- encoding: utf-8 -*-
# 2つのテキストファイルに共通する行を抽出する

def get_rows(filename)
  res = []
  begin
    open(filename) do |file|
      file.each do |row|
        res.push row.chomp
      end
    end
  rescue
    puts "file can't open."
  end
  res
end

def compare(names, target_filename)
  begin
    open(target_filename) do |file|
      file.each do |row|
        puts row if names.include? row.chomp
      end
    end
  rescue
    puts "file can't open."
  end
end

def diff(old_filename, new_filename)
  old_rows = get_rows(old_filename)
  compare(old_rows, new_filename)
end


old_filename = $*[0]
new_filename = $*[1]

diff(old_filename, new_filename)
