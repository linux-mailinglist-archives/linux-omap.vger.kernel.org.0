Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFD913F4DD
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 19:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437091AbgAPSwV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 13:52:21 -0500
Received: from muru.com ([72.249.23.125]:51316 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389427AbgAPSwV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Jan 2020 13:52:21 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8115980FC;
        Thu, 16 Jan 2020 18:53:02 +0000 (UTC)
Date:   Thu, 16 Jan 2020 10:52:17 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Matthijs van Duin <matthijsvanduin@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH] ARM: dts: Configure omap5 AESS
Message-ID: <20200116185217.GU5885@atomide.com>
References: <20200114150937.18304-1-tony@atomide.com>
 <202001162346.4yVlrA8l%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202001162346.4yVlrA8l%lkp@intel.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* kbuild test robot <lkp@intel.com> [200116 15:55]:
> Hi Tony,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on omap/for-next balbi-usb/next v5.5-rc6 next-20200115]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Tony-Lindgren/ARM-dts-Configure-omap5-AESS/20200115-114737
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: arm-defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.5.0 make.cross ARCH=arm 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> Error: arch/arm/boot/dts/omap5-l4-abe.dtsi:447.27-28 syntax error
>    FATAL ERROR: Unable to parse input tree

This patch has a dependency to a clock related patch as described in the
original patch email so this error can be ignored.

Regards,

Tony

