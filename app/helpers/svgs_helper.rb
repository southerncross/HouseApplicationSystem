module SvgsHelper
  def inline_svg(path)
    File.open("app/assets/svgs/#{path}", "rb") do |file|
      raw file.read
    end
  end
end
