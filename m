Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F363731A750
	for <lists+linux-omap@lfdr.de>; Fri, 12 Feb 2021 23:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbhBLWG2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Feb 2021 17:06:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:41398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhBLWG1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 12 Feb 2021 17:06:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0132264DE0;
        Fri, 12 Feb 2021 22:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613167547;
        bh=x7+O4dfMkemD6U+vgZkpKlnW63NDjJ8hkv36eJK9x4o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=utCEACe2van290abpiVInryUj9yVn2FwsXMbagw9hbUab72VorrpgY32/Amx4utiN
         j7Mc9urIjizH+MO0kEXOEdRlO76JE8KDEfkf4VWZwpa5zwrsAHPR56JbVeQtLZm12M
         bt5NlZBF9WzNhSn0NR7WBJh7jZ+hZ/mTGX3E9sSXjoSfOubGx2bNNkcKvhIvonnWu6
         JniU8yhese97VZl+fQvPXwdJS917BMwsjIXpAOMxS4tvp7ZmpIAVtFA5fW1n1VvGsu
         HrqDR1yu8d1pn1hjR0JDtDenwDYyBO+cHSWBDZDx/N3OrSRsy+traSF5EdAtnY+kyN
         qSNMsCRFENbmg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210212212630.GD179940@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org> <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com> <20210211211054.GD4572@dell> <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com> <20210212092016.GF4572@dell> <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com> <20210212212503.GC179940@dell> <20210212212630.GD179940@dell>
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
Date:   Fri, 12 Feb 2021 14:05:45 -0800
Message-ID: <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Lee Jones (2021-02-12 13:26:30)
> On Fri, 12 Feb 2021, Lee Jones wrote:
>=20
> > The alternative is to not worry about it and review the slow drip of
> > fixes that will occur as a result.  The issues I just fixed were built
> > up over years.  They won't get to that level again.
> >=20
> > In my mind contributors should be compiling their submissions with W=3D1
> > enabled by default.  I'm fairly sure the auto-builders do this now.

That's good.

> >=20
> > Once W=3D1 warnings are down to an acceptable level in the kernel as a
> > whole, we can provide some guidance in SubmittingPatches (or similar)
> > on how to enable them (hint: you add "W=3D1" on the compile line).
> >=20
> > Enabling W=3D1 in the default build will only serve to annoy Linus IMHO.
> > If he wants them to be enabled by default, they wouldn't be W=3D1 in the
> > first place, they'd be W=3D0 which *is* the default build.
>=20
> Just to add real quick - my advice is to enable them for yourself and
> send back any issues along with your normal review.  A W=3D1 issue is no
> different to a semantic or coding style one.
>=20

I'd like to enable it for only files under drivers/clk/ but it doesn't
seem to work. I'm not asking to enable it at the toplevel Makefile. I'm
asking to enable it for drivers/clk/ so nobody has to think about it now
that you've done the hard work of getting the numbers in this directory
down to zero or close to zero.
