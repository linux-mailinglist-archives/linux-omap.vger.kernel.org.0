Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D86C12E5D5
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 12:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728227AbgABLtm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 06:49:42 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:47577 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728205AbgABLtm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 06:49:42 -0500
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MLi4W-1j4Vpj1NnE-00HetB; Thu, 02 Jan 2020 12:49:39 +0100
Received: by mail-qk1-f174.google.com with SMTP id x129so31153705qke.8;
        Thu, 02 Jan 2020 03:49:39 -0800 (PST)
X-Gm-Message-State: APjAAAUt30aUgn/jWEotCiTKYtcv+yBKK11T99O4I6k6pL3PNzPlJ9Ne
        AUgDUNhhUhb4i1F5Ws1J036IU6wwXiY/QrwfxiU=
X-Google-Smtp-Source: APXvYqxydssWmkTg9COOlagrp5A+51TGitaXs//MyLhzxeBFOq9tZRxhmj6IwWv8LnVZ3yHfar1ZPMwPeZq4rn9wkjU=
X-Received: by 2002:a05:620a:a5b:: with SMTP id j27mr66559974qka.286.1577965778074;
 Thu, 02 Jan 2020 03:49:38 -0800 (PST)
MIME-Version: 1.0
References: <20191228162929.GA29269@duo.ucw.cz> <20191228193622.GA13047@duo.ucw.cz>
 <20191230173507.GM35479@atomide.com> <20200102110025.GA29035@amd>
In-Reply-To: <20200102110025.GA29035@amd>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 2 Jan 2020 12:49:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Ya+GZRRA_THZBVDq7SWO8UYoUPwW5fEyorCVjPnd1qA@mail.gmail.com>
Message-ID: <CAK8P3a2Ya+GZRRA_THZBVDq7SWO8UYoUPwW5fEyorCVjPnd1qA@mail.gmail.com>
Subject: Re: Droid 4 regression in 5.5-rc1, armsoc-soc tree
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Tony Lindgren <tony@atomide.com>, Olof Johansson <olof@lixom.net>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>, nekit1000@gmail.com,
        Marcel Partap <mpartap@gmx.net>, merlijn@wizzup.org,
        martin_rysavy@centrum.cz
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:M1XUfSncVkbP6tuGpExIFJvtnZupwjb1X+Mo8MIMQvrtAc4/ais
 YEJ8NgvP6xABhyNdXS+RJt+hAJgvOMhlAa3SYhHlOnnSosYUgkPnSsgxB0j+3ceei5t6YCc
 YSqlHcQF9bNSFX5jE0NF6S5TzpfqYx8+ubLKJRgpOhRhXjzGU3IiU8alAfm1G53KPJ2iW7H
 zdXkmkBFH9FgF76NcVdaQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iroEBpD/4Mk=:e9ze52qfzaOp/SsVeTkl90
 WgLFOnmYcni54LMgU2wdKUhsxqiBF6MbSgPRJLjuOtrzlmevKbk7eInbC9rWyhBALGU9LzzGP
 n8DTqz5ZWQs7gOMIooSYntQ2v0qgy4Uy2/2gV7k7XNQVgpSbW5903EQDNX9h25tdm0UMJQdRO
 TVb1z5crRIM1rfV+TPXdtBrPuW0NlUyl8Cg2NnP9O0dY+nvsOXPyFFXBa+a+s6wUDrjvksnvt
 6afZO5ayvqPcnOztEbHsmN9RHyTBUNXLnpeBvjJPZ+0WIN112uKYYhX9uIGJWxfYecdRTAFit
 +y5XNLw1VDnN+8K65+B1Qb++SMpl1OqxJrZegLcFsr0hqtwuWtYGtkmyyydyNBlBwxCh3Vh4L
 v8un3gp4JUEOZqJLlvH9+i3pBwhQOT+F2dQLetS/Wn1nYwSyM7XcGw1gKR/BbVxv65tEFeNMS
 IN7ZmBSiM/b3EFI/90znIToUXV3wthz4UrYCjhoyUo8Ask8Od6CEFLoH68LHrZSWxMH+KHTDV
 ocUNEBvte/8j2faNz/FRE73uHHPhKmaXNyZ/krrfOcHgU1vmhPdYf4tIx1KjeO0uDZVg/+sfI
 aE7JNPkPgk8YxemiL1B9K+IHwclDdI/H/iqGX1ClkI2s7E2eDA4nAxO8xRfKfLZrN7LZHOfz4
 Vwc0BpD1sygKExt/PSIPVTf++tIProJMA+ClBEnQDznx6HkCM8GguP4tYQ0UzSK2A5DgQ0vI/
 asafJMr7CkkDcRxvY1U8I451OTfVKmTQPqIdJzzUdYTHjUe8mRBT9GrztcKUCD/ly4Wf2/A7s
 /pupnP2VYDKmeJUJa59R1qvP18s0bf2D7B8BjdInTh72DVYZ1tR0eR6UZCmcPQYfGrHO34lyq
 XwxqbM9jlVmi4eIBXxPQ==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jan 2, 2020 at 12:00 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> On Mon 2019-12-30 09:35:07, Tony Lindgren wrote:
> > * Pavel Machek <pavel@ucw.cz> [191228 19:37]:
> > > Hi!
> > >
> > > > 5.4-based kernel works ok on my droid 4.
> > > >
> > > > 5.5-rc3 based kernel has problems; it reboots when I try to kexec it.
> > > >
> > > > Vanilla 5.5-rc3 reboots, too.
> > > >
> > > > If you have any ideas, let me know.
> > >
> > > I managed to get partial serial dump. This should be 5.5-rc3: And then
> > > a bit better serial dump (below). But it is silent for few seconds,
> > > and then it restarts...
> >
> > If spi or regulators have problems, nothing will really work..
>
> arm-soc merge seems to be responsible:
>
> bad 38206c24ab09b4f4c2a57de5c1af0bb2e69cf5b6 Merge tag 'armsoc-soc' of
> good d9e48dc2a71a836f17d1febbedb31470f957edb4 Merge tag
>
>                                                                         Pavel
>
> # bad: [738d2902773e30939a982c8df7a7f94293659810] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
> # good: [219d54332a09e8d8741c1e1982f5eae56099de85] Linux 5.4
> git bisect start '738d2902773e' '219d54332a09'
> # bad: [46cf053efec6a3a5f343fead837777efe8252a46] Linux 5.5-rc3
> git bisect bad 46cf053efec6a3a5f343fead837777efe8252a46
> # bad: [e42617b825f8073569da76dc4510bfa019b1c35a] Linux 5.5-rc1
> git bisect bad e42617b825f8073569da76dc4510bfa019b1c35a
> # good: [9a3d7fd275be4559277667228902824165153c80] Merge tag 'driver-core-5.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
> git bisect good 9a3d7fd275be4559277667228902824165153c80
> # good: [0b4295b5e2b9b42f3f3096496fe4775b656c9ba6] io_uring: fix a typo in a comment
> git bisect good 0b4295b5e2b9b42f3f3096496fe4775b656c9ba6
> # good: [056df578c2dcac1e624254567f5df5ddaa223234] Merge tag 'arc-5.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc
> git bisect good 056df578c2dcac1e624254567f5df5ddaa223234
> # bad: [25cfb0c7de3f14e283a43dcd6de903657f9f98c7] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu
> git bisect bad 25cfb0c7de3f14e283a43dcd6de903657f9f98c7
> # bad: [38206c24ab09b4f4c2a57de5c1af0bb2e69cf5b6] Merge tag 'armsoc-soc' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> git bisect bad 38206c24ab09b4f4c2a57de5c1af0bb2e69cf5b6
> # good: [d9e48dc2a71a836f17d1febbedb31470f957edb4] Merge tag 'pwm/for-5.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm
> git bisect good d9e48dc2a71a836f17d1febbedb31470f957edb4

In that branch, I see the following non-merge commits:

0b491904f053 ARM: OMAP2+: Add missing put_device() call in omapdss_init_of()
7b6560b4bc62 OMAP2: fixup doc comments in omap_device
dafd24c727e8 ARM: OMAP1: drop duplicated dependency on ARCH_OMAP1
a3ee4fea24e8 ARM: ASPEED: update default ARCH_NR_GPIO for ARCH_ASPEED
d7eb28d2740f ARM: imx: use generic function to exit coherency
91d7ff5aa7e3 ARM: tegra: Use WFE for power-gating on Tegra30
d70f7d31a9e2 ARM: tegra: Fix FLOW_CTLR_HALT register clobbering by
tegra_resume()
4134b762eb13 ARM: exynos: Enable exynos-asv driver for ARCH_EXYNOS
603bba8d0e05 ARM: s3c: Rename s5p_usb_phy functions
e966fedeabe1 ARM: s3c: Rename s3c64xx_spi_setname() function
8267ff89b713 ARM: imx: Add serial number support for i.MX6/7 SoCs
427fca60ee45 ARM: imx: Drop imx_anatop_usb_chrg_detect_disable()
3d4e0158c1db arm64: Introduce config for S32
88ae095b2855 ARM: hisi: drop useless depend on ARCH_MULTI_V7
e3ca9556f75c arm64: realtek: Select reset controller
0a4319b5c87a ARM: shmobile: rcar-gen2: Drop legacy DT clock support
0a4818c19221 ARM: OMAP2+: Remove duplicated include from pmic-cpcap.c
ed2b6b129c2b ARM: OMAP1: ams-delta FIQ: Fix a typo ("Initiaize")
93a212ebfb08 MAINTAINERS: Add logicpd-som-lv and logicpd-torpedo to OMAP TREE
1994ebd1f746 ARM: OMAP2+: pdata-quirks: drop TI_ST/KIM support
06bd77f965ae ARM: OMAP2+: make omap44xx_sha0_hwmod and
omap44xx_l3_main_2__des static
89ffcdba95bd ARM: OMAP2+: prm44xx: make prm_{save,restore}_context static
607295af8870 ARM: OMAP2+: make dra7xx_sha0_hwmod static
87c59ca22b48 ARM: OMAP2+: do not export am43xx_control functions
3a828f5eda30 MAINTAINERS: Add mailing list for Realtek SoCs
c145649bf262 ARM: OMAP2+: Configure voltage controller for cpcap to low-speed
71065d3fe82d ARM: OMAP2+: Configure voltage controller for retention
821093e1fd3c ARM: OMAP2+: Make some functions static
759c2837f7e4 MAINTAINERS: mmp: add Git repository
dde465457fc9 ARM: mmp: remove MMP3 USB PHY registers from regs-usb.h
32adcaa010fa ARM: mmp: move cputype.h to include/linux/soc/
d093bc0378f5 ARM: mmp: add SMP support
a9372a5fb205 ARM: mmp: add support for MMP3 SoC
199c936e37f9 ARM: mmp: define MMP_CHIPID by the means of CIU_REG()
1732050f48a3 ARM: mmp: DT: convert timer driver to use TIMER_OF_DECLARE
e69fd5090dbd ARM: mmp: map the PGU as well
df8bf2d8a020 ARM: mmp: don't select CACHE_TAUROS2 on all ARCH_MMP
b513d3ff267d ARM: l2c: add definition for FWA in PL310 aux register
b47879aa85ed ARM: bcm: fix missing __iomem in bcm_kona_smc.c
d67fa6caae51 ARM: bcm: include local platsmp.h for bcm2836_smp_ops
21a18129edd7 ARM: OMAP2+: Simplify code for clkdm_clock_enable and disable
645ad6f3ca45 ARM: OMAP2+: Drop unused enable_wakeup and disable_wakeup
4873843718f9 ARM: OMAP2+: Initialize voltage controller for omap4
caf8c87d7ff2 ARM: OMAP2+: Allow core oswr for omap4
623429d5b901 ARM: OMAP2+: Allow per oswr for omap4
d44fa156dcb2 ARM: OMAP2+: Configure voltage controller for cpcap
32236a84906f ARM: OMAP2+: Update 4430 voltage controller operating points
ccd369455a23 ARM: OMAP2+: Remove bogus warnings for machines without twl PMIC
dfc065aa8963 ARM: OMAP2+: Drop bogus wkup domain oswr setting
5395b5557acb ARM: OMAP2+: Remove unused wakeup_cpu
781fa0a95424 ARM: bcm: Add support for BCM2711 SoC

Among these, the most likely candidates would be

0b491904f053 ARM: OMAP2+: Add missing put_device() call in omapdss_init_of()
06bd77f965ae ARM: OMAP2+: make omap44xx_sha0_hwmod and
omap44xx_l3_main_2__des static
c145649bf262 ARM: OMAP2+: Configure voltage controller for cpcap to low-speed
71065d3fe82d ARM: OMAP2+: Configure voltage controller for retention
21a18129edd7 ARM: OMAP2+: Simplify code for clkdm_clock_enable and disable
4873843718f9 ARM: OMAP2+: Initialize voltage controller for omap4
caf8c87d7ff2 ARM: OMAP2+: Allow core oswr for omap4
623429d5b901 ARM: OMAP2+: Allow per oswr for omap4
d44fa156dcb2 ARM: OMAP2+: Configure voltage controller for cpcap
32236a84906f ARM: OMAP2+: Update 4430 voltage controller operating points
ccd369455a23 ARM: OMAP2+: Remove bogus warnings for machines without twl PMIC
dfc065aa8963 ARM: OMAP2+: Drop bogus wkup domain oswr setting
5395b5557acb ARM: OMAP2+: Remove unused wakeup_cpu

Maybe try reverting these on top of the latest version to narrow it
down further?

       Arnd
