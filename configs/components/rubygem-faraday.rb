component "rubygem-faraday" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "0.9.1"
  pkg.md5sum "046e7ddb8ae4dc1142a9114b5386d6bb"
  pkg.url "http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "puppet-agent"

  pkg.apply_patch "resources/patches/faraday/parse-multiple-response-headers-for-proxy-auth.patch", destination: "#{settings[:gem_path]}#{gemname}-#{pkg.get_version}", after: "install"

  pkg.install do
    "#{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem"
  end
end
