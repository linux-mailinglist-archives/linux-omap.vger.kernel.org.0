Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A12A33A913
	for <lists+linux-omap@lfdr.de>; Mon, 15 Mar 2021 01:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhCOA2a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 14 Mar 2021 20:28:30 -0400
Received: from mga11.intel.com ([192.55.52.93]:43934 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229704AbhCOA2S (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 14 Mar 2021 20:28:18 -0400
IronPort-SDR: u2/vmfkVSKW5DhG/cvOaQiaEDwC+lZSpTBLycvp6++5QcJgLkrBmVQ0RmEEDDgpKkc8xIAgfBb
 GWBMhbfV4ReQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9923"; a="185660401"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="185660401"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2021 17:28:16 -0700
IronPort-SDR: ThwJRUrYhsocdTNkoFq1IEfXmpNPa0kkBqy6j02Tp/YEtjN4NL66m4m/vyZRehbRw28XjUZIlL
 OoBc14IyHQsQ==
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="387931642"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.11])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2021 17:28:15 -0700
Date:   Mon, 15 Mar 2021 08:27:30 +0800
From:   kernel test robot <rong.a.chen@intel.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kbuild-all@lists.01.org, linux-omap@vger.kernel.org
Subject: [omap:omap-for-v5.13/genpd-drop-legacy 39/45] dtbs_check:
 arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: interconnect@48000000:
 $nodename:0: 'interconnect@48000000' does not match
Message-ID: <20210315002730.GO219708@shao2-debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git omap-for-v5.13/genpd-drop-legacy
head:   569519de002fafde35f889a8ea0348eae6ccc20f
commit: f483a3e123410bd1c78af295bf65feffb6769a98 [39/45] ARM: dts: Configure simple-pm-bus for dra7 l4_per1
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=arm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"dtcheck warnings: (new ones prefixed by >>)"
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: segment@20000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: segment@30000: $nodename:0: 'segment@30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: segment@30000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: tmp102@48: '#thermal-sensor-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/trivial-devices.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: tlv320aic3104@18: 'clocks' is a dependency of 'assigned-clocks'
--
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: segment@20000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: segment@30000: $nodename:0: 'segment@30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: segment@30000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: tmp102@48: '#thermal-sensor-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/trivial-devices.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: tlv320aic3104@18: 'clocks' is a dependency of 'assigned-clocks'
--
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: segment@20000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: segment@30000: $nodename:0: 'segment@30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: segment@30000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: tmp102@48: '#thermal-sensor-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/trivial-devices.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: tlv320aic3104@18: 'clocks' is a dependency of 'assigned-clocks'
--
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: segment@20000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: segment@30000: $nodename:0: 'segment@30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: segment@30000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: stmpe_adc: 'iio-device@0' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: target-module@b2000: '1w@0' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: segment@20000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: segment@30000: $nodename:0: 'segment@30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: segment@30000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: atmel@50: $nodename:0: 'atmel@50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	From schema: Documentation/devicetree/bindings/eeprom/at24.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: target-module@b2000: '1w@0' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: segment@20000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: segment@30000: $nodename:0: 'segment@30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: segment@30000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: atmel@50: $nodename:0: 'atmel@50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	From schema: Documentation/devicetree/bindings/eeprom/at24.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: atmel@54: $nodename:0: 'atmel@54' does not match '^eeprom@[0-9a-f]{1,2}$'
--
   arch/arm/boot/dts/am572x-idk.dt.yaml: segment@20000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: segment@30000: $nodename:0: 'segment@30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: segment@30000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am572x-idk.dt.yaml: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: tc358778@e: compatible: ['toshiba,tc358778', 'toshiba,tc358768'] is too long
   	From schema: Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: tc358778@e: compatible: Additional items are not allowed ('toshiba,tc358768' was unexpected)
--
   arch/arm/boot/dts/am571x-idk.dt.yaml: segment@20000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: segment@30000: $nodename:0: 'segment@30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: segment@30000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am571x-idk.dt.yaml: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: tc358778@e: compatible: ['toshiba,tc358778', 'toshiba,tc358768'] is too long
   	From schema: Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: tc358778@e: compatible: Additional items are not allowed ('toshiba,tc358768' was unexpected)
--
   arch/arm/boot/dts/am574x-idk.dt.yaml: segment@20000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: segment@30000: $nodename:0: 'segment@30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: segment@30000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am574x-idk.dt.yaml: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: tc358778@e: compatible: ['toshiba,tc358778', 'toshiba,tc358768'] is too long
   	From schema: Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: tc358778@e: compatible: Additional items are not allowed ('toshiba,tc358768' was unexpected)
--
   arch/arm/boot/dts/dra7-evm.dt.yaml: segment@20000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: segment@30000: $nodename:0: 'segment@30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: segment@30000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra7-evm.dt.yaml: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: p1: $nodename:0: 'p1' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gpio/gpio-hog.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: target-module@b2000: '1w@0' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/dra72-evm.dt.yaml: segment@20000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: segment@30000: $nodename:0: 'segment@30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: segment@30000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra72-evm.dt.yaml: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: p1: $nodename:0: 'p1' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gpio/gpio-hog.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: target-module@b2000: '1w@0' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: segment@20000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: segment@30000: $nodename:0: 'segment@30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: segment@30000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra72-evm-revc.dt.yaml: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: p1: $nodename:0: 'p1' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gpio/gpio-hog.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: target-module@b2000: '1w@0' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/dra71-evm.dt.yaml: segment@20000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: segment@30000: $nodename:0: 'segment@30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: segment@30000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra71-evm.dt.yaml: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: p1: $nodename:0: 'p1' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gpio/gpio-hog.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: p0: $nodename:0: 'p0' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
--
   arch/arm/boot/dts/dra76-evm.dt.yaml: segment@20000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: segment@30000: $nodename:0: 'segment@30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: segment@30000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra76-evm.dt.yaml: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: lp87565@60: 'gpio-controller' is a required property
   	From schema: Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: lp87565@60: '#gpio-cells' is a required property

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
