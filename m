Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E328122AC09
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 12:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgGWKBn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 06:01:43 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36334 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbgGWKBn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 06:01:43 -0400
Received: by mail-ed1-f65.google.com with SMTP id dg28so4076004edb.3;
        Thu, 23 Jul 2020 03:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hslSkDk2GV4smH9H5xKkxfOrQX9nbu5qQFnRZrSLifU=;
        b=RJhho/I+QbuF9egQiumAbcszur8GB1mv5ZrXupJsH9hQxGESyFin62m+Z1+f/vSP3L
         T1JxRDHozHQKTGXCT9mUHmp3T5St2mWp6L0CHj8XNp82QLolBNVqCs86v2WWyx9L31Xo
         mJBkRmOTxIRMNfeLjjKOcJx0Xif0cYNJ8gu26i7//qOy8ZfCKcAawGa2vGxihyU4uCq2
         b/bMZwLs9w5xAKdxGPQCJLj3ZarOifAqdZeklmxPjs+qWVAetX2NTdT3ST1KvyKLY4zl
         lp2wLgApMQhWuw/yzgpCSvTamnFuds9Ym1bN6uH/s6d3pul4qmMUKejH28Rfpt2XvrcM
         n3+w==
X-Gm-Message-State: AOAM530NagihXxMcXJIiXoTSByLMbZdgZozWLTUUdu2CxWRfig3EpLZY
        +kQrYsQzZmPT653MyFO7xY+p1A3Q17k=
X-Google-Smtp-Source: ABdhPJyI1dXtFK9c7xFGtDoq/er+m8wTtbHeKjPM3NBbXDh2gegj/He+I6/0VjA5aQ16XwVCcNk6hQ==
X-Received: by 2002:a05:6402:1a42:: with SMTP id bf2mr3292640edb.292.1595498500867;
        Thu, 23 Jul 2020 03:01:40 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id h24sm1689173ejg.53.2020.07.23.03.01.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jul 2020 03:01:40 -0700 (PDT)
Date:   Thu, 23 Jul 2020 12:01:36 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>,
        SoC Team <soc@kernel.org>, Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 14/23] memory: ti-emif-pm: Fix cast to iomem pointer
Message-ID: <20200723100136.GB30472@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-15-krzk@kernel.org>
 <CAK8P3a3btGD5oqmPXJk=UOmA=wuUxn-vOOO982uAjuRcE3crVg@mail.gmail.com>
 <20200723090230.GB25935@kozik-lap>
 <CAK8P3a2O4bCb_Bcpc+Y4BuXmrO6mbVwgo67aGF5E=uxHQpeTnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a2O4bCb_Bcpc+Y4BuXmrO6mbVwgo67aGF5E=uxHQpeTnw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 23, 2020 at 11:14:02AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 11:02 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Thu, Jul 23, 2020 at 10:48:19AM +0200, Arnd Bergmann wrote:
> > > On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > >
> > > > Cast pointer to iomem memory properly to fix sparse warning:
> > > >
> > > >     drivers/memory/ti-emif-pm.c:251:38: warning: incorrect type in argument 1 (different address spaces)
> > > >     drivers/memory/ti-emif-pm.c:251:38:    expected void const volatile [noderef] __iomem *addr
> > > >     drivers/memory/ti-emif-pm.c:251:38:    got void *
> > > >
> > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > ---
> > > >  drivers/memory/ti-emif-pm.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/memory/ti-emif-pm.c b/drivers/memory/ti-emif-pm.c
> > > > index 9c90f815ad3a..6c747c1e98cb 100644
> > > > --- a/drivers/memory/ti-emif-pm.c
> > > > +++ b/drivers/memory/ti-emif-pm.c
> > > > @@ -248,7 +248,7 @@ MODULE_DEVICE_TABLE(of, ti_emif_of_match);
> > > >  static int ti_emif_resume(struct device *dev)
> > > >  {
> > > >         unsigned long tmp =
> > > > -                       __raw_readl((void *)emif_instance->ti_emif_sram_virt);
> > > > +                       __raw_readl((void __iomem *)emif_instance->ti_emif_sram_virt);
> > > >
> > >
> > > Maybe this shouldn't even be __raw_readl(), but instead READ_ONCE()?
> >
> > Won't readl() be enough? Indeed it looks problematic.
> 
> readl() won't work on big-endian kernels, since this is a byte comparison.

Ah, right.

> 
> > > The other accesses in this file don't use MMIO wrappers either but just treat
> > > it as a pointer. The effect would be the same though.
> >
> > I think all the reads and writes are with readl() and writel().
> 
> I actually see only one other access:
> 
>         copy_addr = sram_exec_copy(emif_data->sram_pool_code,
>                                    (void *)emif_data->ti_emif_sram_virt,
>                                    &ti_emif_sram, ti_emif_sram_sz);
> 
> and this one ends up in a memcpy() that does not perform any byte
> swapping or barriers.

At least the barrier would come through mutex in sram_exec_copy() and
later spin locks for page table manipulation.

Anyway, I do not have the HW to test the changes or to confirm whether
this is real issue.  I guess the driver author/owner should follow up on
this report.

Best regards,
Krzysztof

