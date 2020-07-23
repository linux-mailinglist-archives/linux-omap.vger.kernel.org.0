Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 117E022AB8F
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 11:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbgGWJOW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 05:14:22 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:51077 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgGWJOW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 05:14:22 -0400
Received: from mail-qk1-f175.google.com ([209.85.222.175]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MtOT0-1korCv3xzq-00uuXD; Thu, 23 Jul 2020 11:14:20 +0200
Received: by mail-qk1-f175.google.com with SMTP id e13so4675853qkg.5;
        Thu, 23 Jul 2020 02:14:19 -0700 (PDT)
X-Gm-Message-State: AOAM530c1r2tqj0+pTyvty7kjYk4SMUa/1GIVMv2myeL/w/bEa8ujy+a
        suKa7UbgST6wBCj0JMjHny8MpKGjW61ErLfaSlI=
X-Google-Smtp-Source: ABdhPJyfIhx6eiKVKg4rHbAuRO6OkD2w5iLBrvPotu3J5hOQmvUiK3e54tHiHcXr7T/fRPeYMXzXCv1u/Kq2bJSXU54=
X-Received: by 2002:a05:620a:1654:: with SMTP id c20mr4131860qko.138.1595495658635;
 Thu, 23 Jul 2020 02:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org> <20200723073744.13400-15-krzk@kernel.org>
 <CAK8P3a3btGD5oqmPXJk=UOmA=wuUxn-vOOO982uAjuRcE3crVg@mail.gmail.com> <20200723090230.GB25935@kozik-lap>
In-Reply-To: <20200723090230.GB25935@kozik-lap>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 23 Jul 2020 11:14:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2O4bCb_Bcpc+Y4BuXmrO6mbVwgo67aGF5E=uxHQpeTnw@mail.gmail.com>
Message-ID: <CAK8P3a2O4bCb_Bcpc+Y4BuXmrO6mbVwgo67aGF5E=uxHQpeTnw@mail.gmail.com>
Subject: Re: [PATCH 14/23] memory: ti-emif-pm: Fix cast to iomem pointer
To:     Krzysztof Kozlowski <krzk@kernel.org>
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
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:BuZuoFhwqlQyuJf6Z1sCO9jIZRWDzAo/haAFTgt/rZzZgZ//LSH
 0ndDvl6EQ76bgSvScovAZPdKFvJatGUeLyDdwt+X5t8CdIUkrsZ2IqRw1Sot/xhIdKcuHzF
 A4SIKANE+tAo//V9/Tg2ksfMo+HTYnmZord/6fRWdIK+pKuqnfN/y5ERk1t7SDqfc+03riV
 7dyl8VUkdru8NYKDfUWQw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:B1XF1uwrRNY=:791O7UeUV/gA5nU7AtAo9P
 2C0wVmz5DnoWttCr8guFLY5lcd8mO9hdagyKd5wb76z4ogpdTRpKh6JKAKOVzWj8UVNPhy8X9
 yCaM0tu9zbLNNR4WecH69ycjtlrHjJeot25bEl0Ar6LltfG99JHJNT7v/buXZ7fP7u9hCTRjB
 6u7CqUmDFfndFaDwZ9FQXQoCFY8DOPdEsyveoaer1PaJQ4+WBkZbZTjWvGJc2nuyw08T8+5Yi
 1MyFsOdhbYzGfIk8VBilGy4Qc2MDa/qUALaubhNJR+YsUJu8te7mjUkhH2N/R1muWZKlkkwvL
 Pn+khxaysuQWMLmj9W5KeJk7O71yrome7IxU7pqNvc0hgkzgNN5u94kLYhruwPPi9PXGg2rVQ
 uUf8SPLmlKHsUEYlF+r25jnDDD0+IPWGpimfTEEdJxXYmk9kLHJWfrvpcdEnffSbz2NamDMBl
 12USBpeQJJ6yimuFc1iBwt4j+fBxDhXnHQ1cXYyuKqOgcS3Z+D2M/yNSFjhiCW1j5szmfBjHx
 UfaholMuT+SFjEYtjdybANqymr0eEzO7JFtFyITAfPu3FGr+b++mbP4z/YxZ8xWQoD83IqsPS
 9Hx3VjCh2wiJSTtIMtagH5qkrgJYkyVUA3EtQVk7wMaZSlVOhVR6gDCKYhV5oMiUduCj26JwK
 rBf03W3ejPtfSmxwxrpWl2mjCq6jtwTEjlmjiKkg3kHk04+Kal0MuZezqwC/uFp78ehinyKN2
 G27EXwTMEflySH88UPREMcnSjXpGCm3bLMtviTBGCY0qFIPQewIAS6QmTKUMjWEv2Jx8zgirj
 yuo6sBl4rwgisFVmD7clpx4d3aUkAB+aOZgNzhVvIBJMEUzQXBSZzLQl8THEKqp4YjMrd3iaK
 eUfA3MF/TItoVxtlMb15LVLuLF7HwaWNYevG9NndNkiRiVpqPXbd0kMdpvJeISZbC3UuuRfBo
 qP5wtHk0LJyJ5kvT/Bm4aGZvU9b8Ky0RsTefW+VvOzA/JnBgbP+1S
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 23, 2020 at 11:02 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, Jul 23, 2020 at 10:48:19AM +0200, Arnd Bergmann wrote:
> > On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > Cast pointer to iomem memory properly to fix sparse warning:
> > >
> > >     drivers/memory/ti-emif-pm.c:251:38: warning: incorrect type in argument 1 (different address spaces)
> > >     drivers/memory/ti-emif-pm.c:251:38:    expected void const volatile [noderef] __iomem *addr
> > >     drivers/memory/ti-emif-pm.c:251:38:    got void *
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > ---
> > >  drivers/memory/ti-emif-pm.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/memory/ti-emif-pm.c b/drivers/memory/ti-emif-pm.c
> > > index 9c90f815ad3a..6c747c1e98cb 100644
> > > --- a/drivers/memory/ti-emif-pm.c
> > > +++ b/drivers/memory/ti-emif-pm.c
> > > @@ -248,7 +248,7 @@ MODULE_DEVICE_TABLE(of, ti_emif_of_match);
> > >  static int ti_emif_resume(struct device *dev)
> > >  {
> > >         unsigned long tmp =
> > > -                       __raw_readl((void *)emif_instance->ti_emif_sram_virt);
> > > +                       __raw_readl((void __iomem *)emif_instance->ti_emif_sram_virt);
> > >
> >
> > Maybe this shouldn't even be __raw_readl(), but instead READ_ONCE()?
>
> Won't readl() be enough? Indeed it looks problematic.

readl() won't work on big-endian kernels, since this is a byte comparison.

> > The other accesses in this file don't use MMIO wrappers either but just treat
> > it as a pointer. The effect would be the same though.
>
> I think all the reads and writes are with readl() and writel().

I actually see only one other access:

        copy_addr = sram_exec_copy(emif_data->sram_pool_code,
                                   (void *)emif_data->ti_emif_sram_virt,
                                   &ti_emif_sram, ti_emif_sram_sz);

and this one ends up in a memcpy() that does not perform any byte
swapping or barriers.

     Arnd
