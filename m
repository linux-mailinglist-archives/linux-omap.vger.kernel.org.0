Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C23423788
	for <lists+linux-omap@lfdr.de>; Wed,  6 Oct 2021 07:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhJFFnr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Oct 2021 01:43:47 -0400
Received: from muru.com ([72.249.23.125]:41250 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229579AbhJFFnq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Oct 2021 01:43:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 458A980E1;
        Wed,  6 Oct 2021 05:42:25 +0000 (UTC)
Date:   Wed, 6 Oct 2021 08:41:53 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-omap@vger.kernel.org
Subject: Re: [tmlind-omap:for-next 3/12] drivers/bus/ti-sysc.c:2494:13:
 error: variable 'error' set but not used
Message-ID: <YV03ITgKyP3HtDRA@atomide.com>
References: <202110011055.W9vApCQ9-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202110011055.W9vApCQ9-lkp@intel.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* kernel test robot <lkp@intel.com> [211001 02:09]:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git for-next
> head:   7fd4d99072ce6b546bdcf99d32c8f7449abd7fa4
> commit: 9d881361206ebcf6285c2ec2ef275aff80875347 [3/12] bus: ti-sysc: Add quirk handling for reinit on context lost
> config: arm-allyesconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/commit/?id=9d881361206ebcf6285c2ec2ef275aff80875347
>         git remote add tmlind-omap https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git
>         git fetch --no-tags tmlind-omap for-next
>         git checkout 9d881361206ebcf6285c2ec2ef275aff80875347
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=arm 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/bus/ti-sysc.c: In function 'sysc_reinit_modules':
> >> drivers/bus/ti-sysc.c:2494:13: error: variable 'error' set but not used [-Werror=unused-but-set-variable]
>     2494 |         int error = 0;
>          |             ^~~~~
>    cc1: all warnings being treated as errors
> 
> 
> vim +/error +2494 drivers/bus/ti-sysc.c
> 
>   2487	
>   2488	/* Caller needs to take list_lock if ever used outside of cpu_pm */
>   2489	static void sysc_reinit_modules(struct sysc_soc_info *soc)
>   2490	{
>   2491		struct sysc_module *module;
>   2492		struct list_head *pos;
>   2493		struct sysc *ddata;
> > 2494		int error = 0;
>   2495	
>   2496		list_for_each(pos, &sysc_soc->restored_modules) {
>   2497			module = list_entry(pos, struct sysc_module, node);
>   2498			ddata = module->ddata;
>   2499			error = sysc_reinit_module(ddata, ddata->enabled);
>   2500		}
>   2501	}
>   2502	

Thanks for the report, I'll post a patch to fix this. Not much we can do here
on errors and we already log errors in sysc_reinit_module.

Regards,

Tony
