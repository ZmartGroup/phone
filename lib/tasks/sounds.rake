# encoding: utf-8

desc "Symlink sound files"
task :symlink_sound_files, :src, :target do |t, args|
  src     = args[:src]
  target  = args[:target]

  Dir["#{src}/*"].each do |file|
    file_name = File.basename(file)
    target_file_name = "#{target}/#{file_name}"

    # If symlink file exists, unlink and relink. Yes, we could
    # check if the link matches the target, but just unlink it for now
    # anyway.
    if File.exists?(target_file_name) && File.symlink?(target_file_name)

      File.unlink(target_file_name)
      File.symlink(file, target_file_name)

    # If no symlink exists, just symlink
    elsif !File.exists?(target_file_name)

      File.symlink(file, target_file_name)

    # Raise error. We probably have a hard file.
    else
      raise "Unknown file"
    end
  end
end