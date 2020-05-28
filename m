Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907D11E6C9E
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 22:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407095AbgE1UeO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 16:34:14 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:60063 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407020AbgE1UeL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 May 2020 16:34:11 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MLzSD-1jN9ST1zHt-00HxmW; Thu, 28 May 2020 22:34:08 +0200
Received: by mail-qk1-f169.google.com with SMTP id q8so189060qkm.12;
        Thu, 28 May 2020 13:34:08 -0700 (PDT)
X-Gm-Message-State: AOAM53019TbOTyNAzJ28LSBVyxyYKKfQPlavHZUd/nt5UfcNqrfbaz2o
        DCrSnE5f5SFWY1ubfmA3JYZ+HlgiIEGpb1E1hec=
X-Google-Smtp-Source: ABdhPJw35+vBI63bF7SfK+zLRpe/uowGSJPEFF3GisVzMhFz/CLIpy+Xs9Ye1mQuxA5jYglGf/r9jzeY5QW4ONbtd8k=
X-Received: by 2002:ae9:de85:: with SMTP id s127mr3586078qkf.352.1590698047221;
 Thu, 28 May 2020 13:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200528091923.2951100-1-arnd@arndb.de> <20200528134621.GN37466@atomide.com>
 <20200528135057.GO37466@atomide.com> <20200528155759.GP37466@atomide.com> <34e8fb61-b452-529b-b2c6-3849b2395096@oracle.com>
In-Reply-To: <34e8fb61-b452-529b-b2c6-3849b2395096@oracle.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 28 May 2020 22:33:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0AaH+pAdhu7jzEAGC-bECgmz7w=D8PN6NOUjj2kxevkg@mail.gmail.com>
Message-ID: <CAK8P3a0AaH+pAdhu7jzEAGC-bECgmz7w=D8PN6NOUjj2kxevkg@mail.gmail.com>
Subject: Re: [PATCH] ARM: omap2: drop broken broadcast timer hack
To:     Santosh Shilimkar <santosh.shilimkar@oracle.com>
Cc:     Tony Lindgren <tony@atomide.com>, arm-soc <arm@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lokesh Vutla <lokeshvutla@ti.com>, Keerthy <j-keerthy@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>, Olof Johansson <olof@lixom.net>,
        linux-omap <linux-omap@vger.kernel.org>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dTgnDJci0MeHtLUnNuT55fdZMzCKbWbDgHGAo7MqI955pVb+bPO
 ksWB2ZJmwKkDagByGouBJnVMv41N9B5ct5Hvzpo99i+UUz7jFIRW8EItJJ3PNkQtZYlcgOi
 sU2sIpN1nucmmNQysdXOYNorrJ6cmUIaDFIq9o+fM2kuVmCcFYCdhb4srDQg4xavtKkEp68
 2fCMqB8n1P6nCJJBDn0ww==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TzSOWCib3zs=:Q/eh1aK8wnA0/6Pi6Cp5zB
 g4/tbCPUYq0KTyYvLkkbF6x0weq2icg4EmUDtr087yzWTh74SFAUqQHVsZTxRChCQy3/6Qrcz
 dsKUSAaSG+X/HaVklFFW+EX0j6b2dytTKkQRvE94XfI8bK5IoxIx8d54G7n+vCnysWMiFggxm
 ngmWo5cWsMInzm5sezqrdTKYG1XUCBQ1C3YCKZU38tTXkrO5Xdb/jf2GMAm+A+sb3mpbC46Kn
 SbaR08nrG5/coCEl3HGR8BEP60S24DP7l370R9ne9VEhXNgGW9gh+fCB+Rq89JEfygJEOE+MN
 ShxHfBCun/6x/eCqwHXbMJUDRvobawMQqD1yoWkvoe7Le7LiaVJcuSF3PIyWfLMyH/jGQg06a
 r2ITwu7taaL01mndHUIrue0LUyH1Mfa/7Ir/3qRsP0TUZbiwhZf6x1Pr65G+Zl/fxUitZ+Tll
 9SPKkuwP2xx7O1Pboqs4nyR0Hc1Pjb6QfJip6jBcXGJR/G0GQBskPtFPb9OBL/Rkan4rG9zNX
 ++3e8pbP4GJAIym62ODfg/+9i5jNzedTB2M3bUxu31ySwEh8901CypP2onQ4CLNKtM88oij3Q
 oLylLYjBsqIw20Vz0gA55x/KXTf6Buk39T03d8h4dKSPy4HRVJT4LrBS0nSF/tl4WAwRY4BCA
 lceFiqNlfwoJkkxgGz2pNMbYKe3HK+yCYBL3dWrcehsTKONsNQqI7IvAtAhEDep2Tt27DckBx
 CEtTvDM3Z12TO4uuoZkxCev8OsIwrZWA5T0I5Aem29eWyETbBKGT4KCuMNr+jnGo9hTfOT6f+
 l5YCkUeq6PB51fRrGSAMEyfEm2YKilx/bFqKkGkcOQdCsBwjGQ=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 28, 2020 at 6:18 PM <santosh.shilimkar@oracle.com> wrote:
> On 5/28/20 8:57 AM, Tony Lindgren wrote:
> > * Tony Lindgren <tony@atomide.com> [200528 13:51]:
> >> * Tony Lindgren <tony@atomide.com> [200528 13:47]:
> >>> * Arnd Bergmann <arnd@arndb.de> [200528 09:20]:
> >>>> The OMAP4 timer code had a special hack for using the broadcast timer
> >>>> without SMP. Since the dmtimer is now gone, this also needs to be dropped
> >>>> to avoid a link failure for non-SMP AM43xx configurations:
> >>>>
> >>>> kernel/time/tick-broadcast.o: in function `tick_device_uses_broadcast':
> >>>> tick-broadcast.c:(.text+0x130): undefined reference to `tick_broadcast'
> >>>
> >>> Hmm this sounds like a regression though. Isn't this needed for using
> >>> the ARM local timers on non-SMP SoC, so a separate timer from dmtimer?
> >>>
> >>> I've probably removed something accidentally to cause this.
> >>
> >> Sounds like arch/arm/mach-omap2/Makefile change needs to be removed
> >> to always still build in timer.o. And probably timer.c needs back
> >> the ifdef for CONFIG_SOC_HAS_REALTIME_COUNTER.
> >>
> >> I'll take a look today.
> >
> > I've sent a patch along those lines as:
> >
> > [PATCH] ARM: OMAP2+: Fix regression for using local timer on non-SMP SoCs
> >
> > A link for the patch at [0] below.
> >
> CPU local timers not being in always ON power domain use to be the
> reason on early version of the SOCs but later SOC moved the CPU local
> timer also in always on domain. Probably AM43xx does loose local timer
> on CPU PD in low power so yes broadcast would be needed with dmtimer
> help.
>
> >
> > [0] https://lore.kernel.org/linux-omap/20200528155453.8585-1-tony@atomide.com/T/#u
> >
> This should restore it.

Should I apply the fix directly to the arm/soc branch that has the
other changes then?

     Arnd
