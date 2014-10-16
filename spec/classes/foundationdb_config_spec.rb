require 'spec_helper'

describe 'foundationdb::config' do
  let(:node) { 'test.example.com' }
  let(:params) { { :fdb_config_path   => '/etc/foundationdb',
                   :fdb_config_file   => 'foundationdb.conf',
                   :data_dir          => '/var/lib/foundationdb/4500',
                   :fdbuser           => 'foundationdb',
                   :fdbgroup          => 'foundationdb',
                   :restart_delay     => '60',
                   :cluster_file      => '/etc/foundationdb/fdb.cluster',
                   :fdb_command       => '/usr/sbin/fdbserver',
                   :public_address    => 'auto',
                   :listen_address    => 'public',
                   :num_fdb_processes => '1',
                   :backup_agent      => '/usr/lib/foundationdb/backup_agent/backup_agent',
                   :num_backup_agents => '1',
                } }

  it { is_expected.to compile.with_all_deps }

  it { is_expected.to contain_file('/etc/foundationdb/foundationdb.conf').with(
          'owner'  => 'foundationdb',
          'group'  => 'foundationdb',
          'mode'   => '0755',
  )}

  it { is_expected.to contain_file('/var/lib/foundationdb').with(
          'ensure' => 'present',
          'owner'  => 'foundationdb',
          'group'  => 'foundationdb',
          'mode'   => '0755',
  )}
end
