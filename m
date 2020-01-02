Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71C2012E613
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 13:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbgABM3M (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 07:29:12 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:34426 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728260AbgABM3M (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 07:29:12 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A8BD71C25FD; Thu,  2 Jan 2020 13:29:10 +0100 (CET)
Date:   Thu, 2 Jan 2020 13:29:10 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>, Olof Johansson <olof@lixom.net>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>, nekit1000@gmail.com,
        Marcel Partap <mpartap@gmx.net>, merlijn@wizzup.org,
        martin_rysavy@centrum.cz
Subject: Re: Droid 4 regression in 5.5-rc1, armsoc-soc tree
Message-ID: <20200102122910.zcodrxmkslrpcd2m@ucw.cz>
References: <20191228162929.GA29269@duo.ucw.cz>
 <20191228193622.GA13047@duo.ucw.cz>
 <20191230173507.GM35479@atomide.com>
 <20200102110025.GA29035@amd>
 <CAK8P3a2Ya+GZRRA_THZBVDq7SWO8UYoUPwW5fEyorCVjPnd1qA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2Ya+GZRRA_THZBVDq7SWO8UYoUPwW5fEyorCVjPnd1qA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi!

> > > > I managed to get partial serial dump. This should be 5.5-rc3: And then
> > > > a bit better serial dump (below). But it is silent for few seconds,
> > > > and then it restarts...
> > >
> > > If spi or regulators have problems, nothing will really work..
> >
> > arm-soc merge seems to be responsible:
> >
> > bad 38206c24ab09b4f4c2a57de5c1af0bb2e69cf5b6 Merge tag 'armsoc-soc' of
> > good d9e48dc2a71a836f17d1febbedb31470f957edb4 Merge tag
> >
> Among these, the most likely candidates would be
> 
> 0b491904f053 ARM: OMAP2+: Add missing put_device() call in omapdss_init_of()
> 06bd77f965ae ARM: OMAP2+: make omap44xx_sha0_hwmod and
> omap44xx_l3_main_2__des static
> c145649bf262 ARM: OMAP2+: Configure voltage controller for cpcap to low-speed
> 71065d3fe82d ARM: OMAP2+: Configure voltage controller for retention
> 21a18129edd7 ARM: OMAP2+: Simplify code for clkdm_clock_enable and disable
> 4873843718f9 ARM: OMAP2+: Initialize voltage controller for omap4
> caf8c87d7ff2 ARM: OMAP2+: Allow core oswr for omap4
> 623429d5b901 ARM: OMAP2+: Allow per oswr for omap4
> d44fa156dcb2 ARM: OMAP2+: Configure voltage controller for cpcap
> 32236a84906f ARM: OMAP2+: Update 4430 voltage controller operating points
> ccd369455a23 ARM: OMAP2+: Remove bogus warnings for machines without twl PMIC
> dfc065aa8963 ARM: OMAP2+: Drop bogus wkup domain oswr setting
> 5395b5557acb ARM: OMAP2+: Remove unused wakeup_cpu
> 
> Maybe try reverting these on top of the latest version to narrow it
> down further?

Thanks for your support. I'm continuing the bisect, should have result
soon. (Unless all the "good"s in a row are sign of something strange.)

# bad: [38206c24ab09b4f4c2a57de5c1af0bb2e69cf5b6] Merge tag 'armsoc-soc'
# of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect bad 38206c24ab09b4f4c2a57de5c1af0bb2e69cf5b6
# good: [d9e48dc2a71a836f17d1febbedb31470f957edb4] Merge tag
# 'pwm/for-5.5-rc1' of
# git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm
git bisect good d9e48dc2a71a836f17d1febbedb31470f957edb4
# good: [cd4744645959ebfc97e4b0c676006d2d76d34f25] Merge tag
# 'omap-for-v5.5/soc-signed' of
# git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
# arm/soc
git bisect good cd4744645959ebfc97e4b0c676006d2d76d34f25
# good: [3166c3dd4c87d118cbf66f827f4b41765a0b1ba6] Merge tag
# 'samsung-soc-5.5' of
# https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into
# arm/soc
git bisect good 3166c3dd4c87d118cbf66f827f4b41765a0b1ba6
# good: [0f3dac611060058524c68dadcc0ddaf923c84d1c] Merge tag
# 'imx-soc-5.5' of
# git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
# arm/soc
git bisect good 0f3dac611060058524c68dadcc0ddaf923c84d1c


Best regards,
