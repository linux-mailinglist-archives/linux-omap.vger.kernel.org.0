Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6B133A911
	for <lists+linux-omap@lfdr.de>; Mon, 15 Mar 2021 01:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbhCOA10 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 14 Mar 2021 20:27:26 -0400
Received: from mga06.intel.com ([134.134.136.31]:11408 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229476AbhCOA1S (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 14 Mar 2021 20:27:18 -0400
IronPort-SDR: AKWKhTLQrUjhXL1vjyu1EImZenaeuElB60611nL6mOL8pv1Gv2YJTD7TBnnx4bkEiesIbl/Xg+
 ZGq8U3Bc/MDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9923"; a="250385383"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="250385383"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2021 17:27:18 -0700
IronPort-SDR: MH9B0NV5xLDquws4OoFll9Gl6Y0tIwgjy7g8IbKn86CRwkqnbVb79eQpVCTzRsoPrScc+qcwFA
 qXZkub54lHcw==
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="449203048"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.11])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2021 17:27:16 -0700
Date:   Mon, 15 Mar 2021 08:26:29 +0800
From:   kernel test robot <rong.a.chen@intel.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kbuild-all@lists.01.org, linux-omap@vger.kernel.org
Subject: [omap:omap-for-v5.13/genpd-omap4 51/52] dtbs_check:
 arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: ocp: $nodename:0: 'ocp'
 does not match
Message-ID: <20210315002629.GM219708@shao2-debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git omap-for-v5.13/genpd-omap4
head:   2584d7e7f87ad0a57683dda8e7f17d8630c2eefc
commit: 3e1ea524d6db00b432eb93897f9de7091af9e549 [51/52] ARM: OMAP2+: Drop legacy platform data for omap4 l3
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=arm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"dtcheck warnings: (new ones prefixed by >>)"
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: /: usb-phy@2: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/root-node.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: sram@40304000: '#address-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: sram@40304000: '#size-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: sram@40304000: 'ranges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: ocp: $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: ocp: bandgap@4a002260:reg:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/reg.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: interconnect@4a300000: $nodename:0: 'interconnect@4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: /: usb-phy@2: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/root-node.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: sram@40304000: '#address-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: sram@40304000: '#size-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: sram@40304000: 'ranges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: ocp: $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: ocp: bandgap@4a002260:reg:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/reg.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: interconnect@4a300000: $nodename:0: 'interconnect@4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: sram@40304000: '#address-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: sram@40304000: '#size-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: sram@40304000: 'ranges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: ocp: $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: ocp: bandgap@4a002260:reg:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/reg.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: interconnect@4a300000: $nodename:0: 'interconnect@4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-kc1.dt.yaml: sram@40304000: '#address-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: sram@40304000: '#size-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: sram@40304000: 'ranges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-kc1.dt.yaml: ocp: $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: ocp: bandgap@4a002260:reg:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/reg.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: interconnect@4a300000: $nodename:0: 'interconnect@4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-panda.dt.yaml: sram@40304000: '#address-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: sram@40304000: '#size-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: sram@40304000: 'ranges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-panda.dt.yaml: ocp: $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: ocp: bandgap@4a002260:reg:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/reg.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: interconnect@4a300000: $nodename:0: 'interconnect@4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: /: 'model' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/root-node.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: sram@40304000: '#address-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: sram@40304000: '#size-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: sram@40304000: 'ranges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-panda-a4.dt.yaml: ocp: $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: ocp: bandgap@4a002260:reg:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/reg.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: interconnect@4a300000: $nodename:0: 'interconnect@4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: sram@40304000: '#address-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: sram@40304000: '#size-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: sram@40304000: 'ranges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-panda-es.dt.yaml: ocp: $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: ocp: bandgap@4a002260:reg:0: [1241522784, 4, 1241522988, 4, 1241523064, 24] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/reg.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: interconnect@4a300000: $nodename:0: 'interconnect@4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-sdp.dt.yaml: sram@40304000: '#address-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: sram@40304000: '#size-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: sram@40304000: 'ranges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-sdp.dt.yaml: ocp: $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: ocp: bandgap@4a002260:reg:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/reg.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: interconnect@4a300000: $nodename:0: 'interconnect@4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: sram@40304000: '#address-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: sram@40304000: '#size-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: sram@40304000: 'ranges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: ocp: $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: ocp: bandgap@4a002260:reg:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/reg.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: interconnect@4a300000: $nodename:0: 'interconnect@4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: sram@40304000: '#address-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: sram@40304000: '#size-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: sram@40304000: 'ranges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: ocp: $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: ocp: bandgap@4a002260:reg:0: [1241522784, 4, 1241522988, 4, 1241523064, 24] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/reg.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: interconnect@4a300000: $nodename:0: 'interconnect@4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: sram@40304000: '#address-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: sram@40304000: '#size-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: sram@40304000: 'ranges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: ocp: $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: ocp: bandgap@4a002260:reg:0: [1241522784, 4, 1241522988, 4, 1241523064, 24] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/reg.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: interconnect@4a300000: $nodename:0: 'interconnect@4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
