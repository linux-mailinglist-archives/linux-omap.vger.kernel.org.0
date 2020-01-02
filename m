Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6832812E709
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 15:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728405AbgABOGM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 09:06:12 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44534 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728288AbgABOGM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 09:06:12 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B853A1C25FD; Thu,  2 Jan 2020 15:06:09 +0100 (CET)
Date:   Thu, 2 Jan 2020 15:06:09 +0100
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
Message-ID: <20200102140609.7vsfwcjyvbbrmcjx@ucw.cz>
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

> > > > > 5.4-based kernel works ok on my droid 4.
> > > > >
> > > > > 5.5-rc3 based kernel has problems; it reboots when I try to kexec it.
> > > > >
> > > > > Vanilla 5.5-rc3 reboots, too.
> > > > >
> > > > > If you have any ideas, let me know.
> > > >
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

I ended up with this:

pavel@amd:/data/l/k$ git bisect log
# bad: [738d2902773e30939a982c8df7a7f94293659810] Merge
# git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
# good: [219d54332a09e8d8741c1e1982f5eae56099de85] Linux 5.4
git bisect start '738d2902773e' '219d54332a09'
# bad: [46cf053efec6a3a5f343fead837777efe8252a46] Linux 5.5-rc3
git bisect bad 46cf053efec6a3a5f343fead837777efe8252a46
# bad: [e42617b825f8073569da76dc4510bfa019b1c35a] Linux 5.5-rc1
git bisect bad e42617b825f8073569da76dc4510bfa019b1c35a
# good: [9a3d7fd275be4559277667228902824165153c80] Merge tag
# 'driver-core-5.5-rc1' of
# git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
git bisect good 9a3d7fd275be4559277667228902824165153c80
# good: [0b4295b5e2b9b42f3f3096496fe4775b656c9ba6] io_uring: fix a typo
# in a comment
git bisect good 0b4295b5e2b9b42f3f3096496fe4775b656c9ba6
# good: [056df578c2dcac1e624254567f5df5ddaa223234] Merge tag
# 'arc-5.5-rc1' of
# git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc
git bisect good 056df578c2dcac1e624254567f5df5ddaa223234
# bad: [25cfb0c7de3f14e283a43dcd6de903657f9f98c7] Merge branch
# 'for-next' of
# git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu
git bisect bad 25cfb0c7de3f14e283a43dcd6de903657f9f98c7
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
# good: [7b6560b4bc623dd1344de32404fd5a901cd1b28e] OMAP2: fixup doc
# comments in omap_device
git bisect good 7b6560b4bc623dd1344de32404fd5a901cd1b28e
# good: [82b711c251c628bf48f4043e42dab8488d624247] Merge tag
# 'omap-for-v5.5/soc-late-signed' of
# git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
# arm/soc
git bisect good 82b711c251c628bf48f4043e42dab8488d624247
# good: [ab818f0999dc73af3f966194d087e9f6650f939f] Merge tag
# 'omap-for-v5.5/maintainers-signed' of
# git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
# arm/soc
git bisect good ab818f0999dc73af3f966194d087e9f6650f939f
# first bad commit: [38206c24ab09b4f4c2a57de5c1af0bb2e69cf5b6] Merge tag
# 'armsoc-soc' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc

...and am not sure how to interpret the result, or what to do next :(.

								Pavel
