component "rubygem-r10k" do |pkg, settings, platform|

  pkg.load_from_json('configs/components/rubygem-r10k.json')

  pkg.build_requires "puppet-agent"
  if platform.name =~ /ubuntu/
    pkg.build_requires "git-core"
  else
    pkg.build_requires "git"
  end

  pkg.install do
    [
      "#{settings[:gem_build]} r10k.gemspec",
      "#{settings[:gem_inst]} r10k-*.gem",
      # This is a basic smoke test for r10k to make sure it works
      "#{settings[:bindir]}/r10k version",
    ]
  end

  pkg.link "#{settings[:bindir]}/r10k", "#{settings[:link_bindir]}/r10k"
end
