Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 010231684E4
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 18:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728576AbgBUR0g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 12:26:36 -0500
Received: from muru.com ([72.249.23.125]:56738 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728103AbgBUR0f (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 Feb 2020 12:26:35 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 90018807E;
        Fri, 21 Feb 2020 17:27:19 +0000 (UTC)
Date:   Fri, 21 Feb 2020 09:26:31 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "Andrew F. Davis" <afd@ti.com>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        kbuild test robot <lkp@intel.com>,
        linux-omap@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>
Subject: Re: omap-secure.c:undefined reference to `__arm_smccc_smc'
Message-ID: <20200221172631.GY37466@atomide.com>
References: <20200220155429.GH37466@atomide.com>
 <55ddcd29-ed8b-529e-dd54-cbac5cf74e42@ti.com>
 <20200220162012.GI37466@atomide.com>
 <d7b685b6-16a2-3743-1786-a5240726ed9c@ti.com>
 <20200220163703.GK37466@atomide.com>
 <20200220171305.GL37466@atomide.com>
 <281e895b-720d-5bab-63cf-8b3e389dc767@ti.com>
 <20200220175744.GQ37466@atomide.com>
 <20200220181141.GR37466@atomide.com>
 <333dd36f-e760-64b3-9e0f-3a316df9ad10@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <333dd36f-e760-64b3-9e0f-3a316df9ad10@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andrew F. Davis <afd@ti.com> [200220 10:23]:
> On 2/20/20 1:11 PM, Tony Lindgren wrote:
> > * Tony Lindgren <tony@atomide.com> [200220 17:58]:
> >> * Andrew F. Davis <afd@ti.com> [200220 17:39]:
> >>> If the machine has SMCCC then it will also have the
> >>> CONFIG_HAVE_ARM_SMCCC set and so nothing would change.
> >>
> >> Hmm yeah good point.
> > 
> > So the patch below seems like the way to go then. Anybody have issues
> > with the patch below?
> > 
> > Regards,
> > 
> > Tony
> > 
> > 8< -------------------------
> > diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> > --- a/include/linux/arm-smccc.h
> > +++ b/include/linux/arm-smccc.h
> > @@ -121,6 +121,7 @@ struct arm_smccc_quirk {
> >  	} state;
> >  };
> >  
> > +#ifdef CONFIG_HAVE_ARM_SMCCC
> >  /**
> >   * __arm_smccc_smc() - make SMC calls
> >   * @a0-a7: arguments passed in registers 0 to 7
> > @@ -137,6 +138,14 @@ asmlinkage void __arm_smccc_smc(unsigned long a0, unsigned long a1,
> >  			unsigned long a2, unsigned long a3, unsigned long a4,
> >  			unsigned long a5, unsigned long a6, unsigned long a7,
> >  			struct arm_smccc_res *res, struct arm_smccc_quirk *quirk);
> > +#else
> > +static inline void __arm_smccc_smc(unsigned long a0, unsigned long a1,
> > +			unsigned long a2, unsigned long a3, unsigned long a4,
> > +			unsigned long a5, unsigned long a6, unsigned long a7,
> > +			struct arm_smccc_res *res, struct arm_smccc_quirk *quirk)
> > +{
> 
> 
> Maybe a warning? If you do not have SMC on your platform but are still
> making SMC calls then something is broken and it looks like it would
> fail silently here.

OK I'll add that and send out a  proper patch.

Thanks,

Tony
