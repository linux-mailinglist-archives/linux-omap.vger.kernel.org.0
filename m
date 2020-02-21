Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78BF8168826
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 21:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgBUUPq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 15:15:46 -0500
Received: from muru.com ([72.249.23.125]:56950 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726443AbgBUUPq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 Feb 2020 15:15:46 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0EF00807E;
        Fri, 21 Feb 2020 20:16:29 +0000 (UTC)
Date:   Fri, 21 Feb 2020 12:15:42 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kbuild test robot <lkp@intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Andrew F . Davis" <afd@ti.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Steven Price <steven.price@arm.com>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH] ARM: OMAP2+: Fix compile if CONFIG_HAVE_ARM_SMCCC is not
 set
Message-ID: <20200221201542.GB37466@atomide.com>
References: <20200221180901.15812-1-tony@atomide.com>
 <CAK8P3a2C6EV0En1hGuFxCRGzgf2t3-5DAPDUDQc5BmGHm1-t9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2C6EV0En1hGuFxCRGzgf2t3-5DAPDUDQc5BmGHm1-t9w@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@arndb.de> [200221 20:06]:
> On Fri, Feb 21, 2020 at 7:09 PM Tony Lindgren <tony@atomide.com> wrote:
> >
> > Recent omap changes added runtime checks to use omap_smccc_smc()
> > when optee is configured in dts. As the omap-secure code can be
> > built for ARMv6 only without ARMv7 and use custom smc calls, we
> > now get a build error:
> >
> > omap-secure.c:(.text+0x94): undefined reference to `__arm_smccc_smc'
> >
> > Let's just ifdef out omap_smccc_smc() unless the CPU has selected
> > CONFIG_HAVE_ARM_SMCCC. The other option discussed was to add an
> > inline function to arm-smccc.h, but we'd still also have to add
> > ifdef around omap_smccc_smc() to avoid a warning for uninitialized
> > value for struct arm_smccc_res in omap_smccc_smc(). And we probably
> > should not start initializing values in arm-smccc.h if disabled.
> >
> > Let's also warn on trying to use omap_smccc_smc() if disabled as
> > suggested by Andrew F. Davis <afd@ti.com>.
> >
> > +#ifdef CONFIG_HAVE_ARM_SMCCC
> >  void omap_smccc_smc(u32 fn, u32 arg)
> >  {
> >         struct arm_smccc_res res;
> > @@ -85,6 +86,12 @@ void omap_smccc_smc(u32 fn, u32 arg)
> >                       0, 0, 0, 0, 0, 0, &res);
> >         WARN(res.a0, "Secure function call 0x%08x failed\n", fn);
> >  }
> > +#else
> 
> Looking through the callers again, this can and is only called
> for ARMv7 CPUs, so can't you just avoid the #else path and
> turn it into a link error if we ever get callers on ARMv6-only builds?

Hmm yeah maybe. If ARMv6 machines (basically n8x0) is not using
omap-smc.S at all, it's unlike it would need omap-secure.c either.

Regards,

Tony
