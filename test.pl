#!/usr/bin/perl 
#===============================================================================
#         FILE:  test.pl
#
#       AUTHOR:  Rishwanth Yeddula (Rish), ryeddula@hostgator.com
#      COMPANY:  Hostgator.com LLC
#      CREATED:  05/10/2013 12:07:09 PM
#===============================================================================

use strict;
use warnings;
use Data::Dumper;

use WWW::Weebly;

my $output;
my $api = WWW::Weebly->new(
	{
		'test_mode'     => 'true',
		'weebly_secret' => 'TmSKZ8pfkowRVqtJsGZt',
		'tid_seed'      => 'hostgator',
		'debug'         => 1,
		'debug_file'    => 'blah.log',
	}
);

#print Dumper $api;

#my $output = $api->new_user();
#print Dumper $output;

my $userid       = '3281611'; #$output->{new_id};
my $login_params = {
	user_id        => $userid,
	ftp_url        => '50.23.99.227', #'174.121.48.77',
	ftp_username   => 'z1@joyinhomework.com', #'z1@hgaddons.com',
	ftp_password   => 'testing',
	ftp_path       => q{/},
	property_name  => q|<a href='http://hostgator.com/' target='_blank'>TESTING_WEEBLY</a>|,
	upgrade_url    => 'https://www.google.com/?q=testing',
	publish_domain => 'z1.hgaddons.com',
	platform       => 'Unix',
	publish_upsell => 'https://www.google.com/?q=testing2',
};
#$output = $api->login($login_params);
#print "\nLogin Output:\n".Dumper $output;
#
#$output = $api->disable_account ( { user_id => $userid } );
#print "\nDisable account output:\n".Dumper $output;
#
#$output = $api->enable_account ( { user_id => $userid } );
#print "\nEnable account output:\n".Dumper $output;
#
#$output = $api->delete_account ( { user_id => $userid } );
#print "\nDelete account output:\n".Dumper $output;
#
#$output = $api->undelete_account ( { user_id => $userid } );
#print "\nUndelete account output:\n".Dumper $output;

my $service_id = 'Weebly.proAccount';

$output = $api->has_service( {user_id => $userid, service_id => $service_id } );
print "\nHas_service output:\n".Dumper $output;

$output = $api->upgrade_account ( { user_id => $userid, service_id => $service_id, term => 12, price => '1.00' } );
print "\nUpgrade account output:\n".Dumper $output;

$output = $api->has_service( {user_id => $userid, service_id => $service_id } );
print "\nHas_service output:\n".Dumper $output;

$output = $api->downgrade_account( {user_id => $userid, service_id => $service_id } );
print "\nDowngrade output:\n".Dumper $output;

$output = $api->has_service( {user_id => $userid, service_id => $service_id } );
print "\nHas_service output:\n".Dumper $output;
