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
      "#{settings[:gem_inst]} r10k-*.gem"  ,
    ]
  end
end
