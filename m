Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322A3332278
	for <lists+linux-omap@lfdr.de>; Tue,  9 Mar 2021 11:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbhCIKAS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Mar 2021 05:00:18 -0500
Received: from muru.com ([72.249.23.125]:41384 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230033AbhCIJ7r (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 9 Mar 2021 04:59:47 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 649D2802C;
        Tue,  9 Mar 2021 10:00:29 +0000 (UTC)
Date:   Tue, 9 Mar 2021 11:59:43 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     kernel test robot <rong.a.chen@intel.com>
Cc:     linux-omap@vger.kernel.org, kbuild-all@01.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 04/11] ARM: dts: Configure interconnect target module for
 omap5 gpmc
Message-ID: <YEdHD5ZvXjkVHUL2@atomide.com>
References: <20210308151143.27793-5-tony@atomide.com>
 <20210309065812.GI219708@shao2-debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309065812.GI219708@shao2-debian>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* kernel test robot <rong.a.chen@intel.com> [210309 06:59]:
> Hi Tony,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on omap/for-next balbi-usb/testing/next v5.12-rc2 next-20210305]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Tony-Lindgren/Update-omap5-dts-files-to-probe-with-genpd/20210308-231425
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: arm-defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce: make ARCH=arm dtbs_check
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> Error: arch/arm/boot/dts/omap5.dtsi:186.31-32 syntax error
>    FATAL ERROR: Unable to parse input tree
> 
> 
> "dtcheck warnings: (new ones prefixed by >>)"
>    make[2]: *** [scripts/Makefile.lib:336: arch/arm/boot/dts/omap5-cm-t54.dtb] Error 1
>    make[2]: *** [scripts/Makefile.lib:336: arch/arm/boot/dts/omap5-igep0050.dtb] Error 1
>    make[2]: *** [scripts/Makefile.lib:336: arch/arm/boot/dts/omap5-uevm.dtb] Error 1
>    make[2]: *** [scripts/Makefile.lib:336: arch/arm/boot/dts/omap5-sbc-t54.dtb] Error 1
> >> make[2]: *** [scripts/Makefile.lib:355: arch/arm/boot/dts/omap5-cm-t54.dt.yaml] Error 1
> >> make[2]: *** [scripts/Makefile.lib:355: arch/arm/boot/dts/omap5-igep0050.dt.yaml] Error 1
>    make[2]: *** [scripts/Makefile.lib:355: arch/arm/boot/dts/omap5-sbc-t54.dt.yaml] Error 1
>    make[2]: *** [scripts/Makefile.lib:355: arch/arm/boot/dts/omap5-uevm.dt.yaml] Error 1
>    make[2]: Target '__build' not remade because of errors.


I think we can ignore this error, this patch depends on patch:

"[PATCH 3/4] clk: ti: omap5: Add missing gpmc and ocmc clkctrl"

Regards,

Tony
