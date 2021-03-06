Jekyll::Hooks.register :site, :pre_render do |post|
  $icons = Shipyard::Icons.new(
    '_assets/icons/',
    '_site/assets/',
    post.config['baseurl']
  )
end

Jekyll::Hooks.register :site, :post_write do |post|
  $icons.write
end
