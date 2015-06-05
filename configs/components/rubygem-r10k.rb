component "rubygem-r10k" do |pkg, settings, platform|

  pkg.replaces 'pe-r10k'
  pkg.load_from_json('configs/components/rubygem-r10k.json')

  pkg.build_requires "puppet-agent"
  if platform.name =~ /ubuntu/
    pkg.build_requires "git-core"
  else
    pkg.build_requires "git"
  end

  pkg.install do
    [
      "gem build r10k.gemspec",
      "#{settings[:gem_inst]} r10k-#{pkg.get_version}.gem",
    ]
  end

  pkg.install_file("#{settings[:gem_path]}/r10k-#{pkg.get_version}/r10k.yaml.example", "#{settings[:sysconfdir]}/r10k.yaml.example")
end
