# encoding: utf-8

module Train::Platforms::Detect::Specifications
  class Api
    def self.load
      plat = Train::Platforms

      plat.family('api').detect { true }

      plat.family('cloud').in_family('api')
      plat.name('aws').in_family('cloud')
      plat.name('azure').in_family('cloud')
      plat.name('gcp').in_family('cloud')
      plat.name('vmware').in_family('cloud')

      plat.family('iaas').in_family('api')
      plat.name('oneview').in_family('iaas')
      plat.family('device').in_family('api').detect { true }
      plat.name('panos').title('Palo Alto').in_family('device').detect { true }
    end
  end
end
