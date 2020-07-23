Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C280B22AB3E
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 11:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgGWJCg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 05:02:36 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:41843 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728047AbgGWJCg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 05:02:36 -0400
Received: by mail-ej1-f66.google.com with SMTP id w9so5537841ejc.8;
        Thu, 23 Jul 2020 02:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SP17WTfOStR1f/zhDqqAukFagjGeQ43CPtbR6JVcAtM=;
        b=UdMAGS5GV336AvtRObsuflGMGwCjBEL+RzCvWzaYHkdtqcCoSTrPi/NtGi/IAy/hhP
         GageRiGOPKFk9XDwzHE3i1+UCqz8BMxqdB9gaBfIiAmqrnNNiHZkUM8JVUGuhPiUOKH4
         i0AzKumvJZVxkBwnt0vSY4imORUqAi3MhkJ018qbtHaEufuVZAtTmoDJ6fLG9HB0OZvt
         lHEtGiq90LKZe07vtX8GoQkgBXdMtwo5xtUMmoVe2fButxFQUqTktUY41X8/rWMU+Ojs
         N+afj2e1qA2uOga344gpUM/6G05xtRvERu6VRtfiYdj2enj20a75qWXQvaCbAKBbHkR0
         JGBA==
X-Gm-Message-State: AOAM531Ys0J7iyz7qM8Tgcz8HTOiQ72mPCD2HzkJP7Yoqczrle2XcjHy
        rPuj+ZOAMEZYQlnxUOsZq0g=
X-Google-Smtp-Source: ABdhPJzZvryybJpj7wOJimQ2Cyt/LNy/AugUNbqr7zzcp389gJSHaS+UZayp1LGVwYwITNeIoG5eTA==
X-Received: by 2002:a17:906:57c5:: with SMTP id u5mr3270775ejr.311.1595494953946;
        Thu, 23 Jul 2020 02:02:33 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id h8sm660427edv.28.2020.07.23.02.02.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jul 2020 02:02:33 -0700 (PDT)
Date:   Thu, 23 Jul 2020 11:02:30 +0200
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
Message-ID: <20200723090230.GB25935@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-15-krzk@kernel.org>
 <CAK8P3a3btGD5oqmPXJk=UOmA=wuUxn-vOOO982uAjuRcE3crVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a3btGD5oqmPXJk=UOmA=wuUxn-vOOO982uAjuRcE3crVg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 23, 2020 at 10:48:19AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Cast pointer to iomem memory properly to fix sparse warning:
> >
> >     drivers/memory/ti-emif-pm.c:251:38: warning: incorrect type in argument 1 (different address spaces)
> >     drivers/memory/ti-emif-pm.c:251:38:    expected void const volatile [noderef] __iomem *addr
> >     drivers/memory/ti-emif-pm.c:251:38:    got void *
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  drivers/memory/ti-emif-pm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/memory/ti-emif-pm.c b/drivers/memory/ti-emif-pm.c
> > index 9c90f815ad3a..6c747c1e98cb 100644
> > --- a/drivers/memory/ti-emif-pm.c
> > +++ b/drivers/memory/ti-emif-pm.c
> > @@ -248,7 +248,7 @@ MODULE_DEVICE_TABLE(of, ti_emif_of_match);
> >  static int ti_emif_resume(struct device *dev)
> >  {
> >         unsigned long tmp =
> > -                       __raw_readl((void *)emif_instance->ti_emif_sram_virt);
> > +                       __raw_readl((void __iomem *)emif_instance->ti_emif_sram_virt);
> >
> 
> Maybe this shouldn't even be __raw_readl(), but instead READ_ONCE()?

Won't readl() be enough? Indeed it looks problematic.

> 
> The other accesses in this file don't use MMIO wrappers either but just treat
> it as a pointer. The effect would be the same though.

I think all the reads and writes are with readl() and writel().

Best regards,
Krzysztof

