Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A020D31A676
	for <lists+linux-omap@lfdr.de>; Fri, 12 Feb 2021 22:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhBLVDI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Feb 2021 16:03:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:58032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231289AbhBLVDD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 12 Feb 2021 16:03:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77F8864E05;
        Fri, 12 Feb 2021 21:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613163742;
        bh=W+5rNCA1AtqnGKfforyDrX1jEmPAq1AoeUYShAARidk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=L8vv2t4t8eAuoCqn8NxiLKXPHOLn2qbZG/rTldBEck1qE3UJ9ZQgBMmDyAS+LCWPW
         EzmQrYymjIjWzdM9L/7FXHZGGuj4mL3xtQEcEf8CqaYplO6L5RYs8XX06VCEcsrfdR
         DnZefkSwJ3C/7GBHqDkPzplqR/1x05jRlJKJ6qT2qfEMeI8gZgeYtGj7iTUFb1gaWJ
         0ewKJtGcnZgMY3nAWLZLIyhSM+nXjoN/Oz5tcLNPp2ONVxpr8E+MxgzJz7ExgeG7/5
         lQhWIt1CShxke8FA18oo80Hy1k04ysgkM9gd+JOi/WRC9EeZrRZTWgw/1ZKPKae8Jz
         RI+6N32IPbIKg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210212092016.GF4572@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org> <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com> <20210211211054.GD4572@dell> <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com> <20210212092016.GF4572@dell>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Boris BREZILLON <boris.brezillon@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Emilio =?utf-8?q?L=C3=B3pez?= <emilio@elopez.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, Loc Ho <lho@apm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Nancy Yuen <yuenn@google.com>,
        Nuvoton Technologies <tali.perry@nuvoton.com>,
        NXP Linux Team <linux-imx@nxp.com>, openbmc@lists.ozlabs.org,
        Patrick Venture <venture@google.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rajeev Kumar <rajeev-dlh.kumar@st.com>,
        Richard Woodruff <r-woodruff2@ti.com>,
        Russell King <linux@armlinux.org.uk>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        =?utf-8?q?S=C3=B6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Tero Kristo <kristo@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Date:   Fri, 12 Feb 2021 13:02:21 -0800
Message-ID: <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Lee Jones (2021-02-12 01:20:16)
> On Thu, 11 Feb 2021, Stephen Boyd wrote:
>=20
> > Quoting Lee Jones (2021-02-11 13:10:54)
> > > On Thu, 11 Feb 2021, Stephen Boyd wrote:
> > >=20
> > > > Quoting Lee Jones (2021-01-26 04:45:19)
> > > > > This set is part of a larger effort attempting to clean-up W=3D1
> > > > > kernel builds, which are currently overwhelmingly riddled with
> > > > > niggly little warnings.
> > > > >=20
> > > > > This is the last set.  Clock is clean after this.
> > > >=20
> > > > Is it possible to slam in some patch that makes W=3D1 the default f=
or the
> > > > clk directory? I'm trying to avoid seeing this patch series again.
> > >=20
> > > One of my main goals of this project is that everyone (contributors,
> > > maintainers auto-builder robots etc) will be enabling W=3D1 builds
> > > *locally*.
> > >=20
> > > This isn't something you'll want to do at a global (i.e. in Mainline)
> > > level.  That's kinda the point of W=3D1.
> > >=20
> >=20
> > Agreed, but is it possible to pass W=3D1 in the drivers/clk/Makefile?
>=20
> That would circumvent the point of W=3D1.  Level-1 warnings are deemed,
> and I'm paraphrasing/making this up "not worth rejecting pull-requests
> over".  In contrast, if Linus catches any W=3D0 warnings at pull-time,
> he will reject the pull-request as 'untested'.
>=20
> W=3D1 is defiantly something you'll want to enable locally though, and
> subsequently push back on contributors submitting code adding new
> ones.
>=20

Why should I install a land mine for others to trip over? Won't that
just take them more time because they won't know to compile with W=3D1 and
then will have to go for another round of review while I push back on
them submitting new warnings?
