Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6439166338
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 17:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgBTQhH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 11:37:07 -0500
Received: from muru.com ([72.249.23.125]:56356 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728090AbgBTQhH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 Feb 2020 11:37:07 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C21028080;
        Thu, 20 Feb 2020 16:37:50 +0000 (UTC)
Date:   Thu, 20 Feb 2020 08:37:03 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "Andrew F. Davis" <afd@ti.com>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        kbuild test robot <lkp@intel.com>,
        linux-omap@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: omap-secure.c:undefined reference to `__arm_smccc_smc'
Message-ID: <20200220163703.GK37466@atomide.com>
References: <202002131856.VeW4PhBJ%lkp@intel.com>
 <20200220155429.GH37466@atomide.com>
 <55ddcd29-ed8b-529e-dd54-cbac5cf74e42@ti.com>
 <20200220162012.GI37466@atomide.com>
 <d7b685b6-16a2-3743-1786-a5240726ed9c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7b685b6-16a2-3743-1786-a5240726ed9c@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andrew F. Davis <afd@ti.com> [200220 16:24]:
> On 2/20/20 11:20 AM, Tony Lindgren wrote:
> > * Andrew F. Davis <afd@ti.com> [200220 16:04]:
> >> On 2/20/20 10:54 AM, Tony Lindgren wrote:
> >>> Andrew,
> >>>
> >>> * kbuild test robot <lkp@intel.com> [200213 10:27]:
> >>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> >>>> head:   0bf999f9c5e74c7ecf9dafb527146601e5c848b9
> >>>> commit: c37baa06f8a970e4a533d41f7d33e5e57de5ad25 ARM: OMAP2+: Fix undefined reference to omap_secure_init
> >>>> date:   3 weeks ago
> >>>> config: arm-randconfig-a001-20200213 (attached as .config)
> >>>> compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
> >>>> reproduce:
> >>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>>>         chmod +x ~/bin/make.cross
> >>>>         git checkout c37baa06f8a970e4a533d41f7d33e5e57de5ad25
> >>>>         # save the attached .config to linux build tree
> >>>>         GCC_VERSION=7.5.0 make.cross ARCH=arm 
> >>>>
> >>>> If you fix the issue, kindly add following tag
> >>>> Reported-by: kbuild test robot <lkp@intel.com>
> >>>>
> >>>> All errors (new ones prefixed by >>):
> >>>>
> >>>>    arch/arm/mach-omap2/omap-secure.o: In function `omap_smccc_smc':
> >>>>>> omap-secure.c:(.text+0x94): undefined reference to `__arm_smccc_smc'
> >>>
> >>> Have you looked at this one? Looks like there's still an unhandled
> >>> randconfig build case.
> >>>
> >>
> >>
> >> I've had a quick look, all the ARM config does:
> >>
> >> select HAVE_ARM_SMCCC if CPU_V7
> >>
> >> so I don't think this will happen in any real config, but if we want to
> >> prevent randconfig issue this we could force ARCH_OMAP2PLUS to "depend"
> >> on it.
> > 
> > Seems to happen at least with omap2 only config where we don't have
> > CPU_V7. Something like below seems to fix it.
> > 
> > If that looks OK to you, I'll send out a proper fix.
> > 
> 
> 
> This looks fine to me.
> 
> A better later fix might be to later stub out the actual __arm_smccc_smc
> in common code if CONFIG_HAVE_ARM_SMCCC is not set, so any platform will
> get the fix.

Yeah seems that might be better. Adding Aaro and Marc to Cc.

Regards,

Tony

> > 8< -----------------------
> > diff --git a/arch/arm/mach-omap2/omap-secure.c b/arch/arm/mach-omap2/omap-secure.c
> > --- a/arch/arm/mach-omap2/omap-secure.c
> > +++ b/arch/arm/mach-omap2/omap-secure.c
> > @@ -77,6 +77,7 @@ u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 nargs, u32 arg1, u32 arg2,
> >  	return ret;
> >  }
> >  
> > +#ifdef CONFIG_HAVE_ARM_SMCCC
> >  void omap_smccc_smc(u32 fn, u32 arg)
> >  {
> >  	struct arm_smccc_res res;
> > @@ -85,6 +86,11 @@ void omap_smccc_smc(u32 fn, u32 arg)
> >  		      0, 0, 0, 0, 0, 0, &res);
> >  	WARN(res.a0, "Secure function call 0x%08x failed\n", fn);
> >  }
> > +#else
> > +void omap_smccc_smc(u32 fn, u32 arg)
> > +{
> > +}
> > +#endif
> >  
> >  void omap_smc1(u32 fn, u32 arg)
> >  {
> > 
