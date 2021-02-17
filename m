Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A5531DED5
	for <lists+linux-omap@lfdr.de>; Wed, 17 Feb 2021 19:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbhBQSJQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Feb 2021 13:09:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:43030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233065AbhBQSJN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 17 Feb 2021 13:09:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 254BD64E42;
        Wed, 17 Feb 2021 18:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613585312;
        bh=mlVck3mitGbq4KsjHsg+Yp+wLuiTRge4SmXhwvupCJA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pcpUB+bwniLXzIs+cBvLaPRAEjbhPwkCX4VK8YS1MQe3zULOCs4fJgwHYw7Uqo6We
         gu5Z5Ji2v15gLmkbSOWs4bsN2PwW/6RAAYgicliuB3fHgpcP1Jx2XlrROvRpUS/F9H
         bhmT6TbKs8+Lgqkb7Y4K5hcHMtuMsAjkmyGZ7XUfcVBaV9aKRFeEwI2wh4hXgPQ/yO
         xfUcGFLc3bRSqJBkHyzgX53Ubi4iYZOrJk6iQfSHxMloXEsRah/REjZYCj0738UQ2E
         eIURxqB8vya/y3sxmy0UoW4jXclmaE9h0FL1XeXDlv/1K2Ce7f3Il6dYkUHs7ri+Tc
         slowUVQ5DxHkA==
Date:   Wed, 17 Feb 2021 10:08:30 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>, Stephen Boyd <sboyd@kernel.org>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajeev Kumar <rajeev-dlh.kumar@st.com>,
        Jan Kotas <jank@cadence.com>,
        Russell King <linux@armlinux.org.uk>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        Boris BREZILLON <boris.brezillon@free-electrons.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Benjamin Fair <benjaminfair@google.com>,
        Emilio =?UTF-8?B?TMOzcGV6?= <emilio@elopez.com.ar>,
        Viresh Kumar <vireshk@kernel.org>, openbmc@lists.ozlabs.org,
        Michal Simek <michal.simek@xilinx.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>,
        Andy Gross <agross@kernel.org>, Loc Ho <lho@apm.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Richard Woodruff <r-woodruff2@ti.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Tero Kristo <kristo@kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Patrick Venture <venture@google.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Nuvoton Technologies <tali.perry@nuvoton.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210217100830.50db2195@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210216082046.GA4803@dell>
References: <20210212212503.GC179940@dell>
        <20210212212630.GD179940@dell>
        <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
        <20210212223739.GE179940@dell>
        <161317480301.1254594.16648868282165823277@swboyd.mtv.corp.google.com>
        <YCf4kkMsX+Ymgy6N@lunn.ch>
        <161333644244.1254594.4498059850307971318@swboyd.mtv.corp.google.com>
        <YCmUOHTtc+j4eLkO@lunn.ch>
        <20210215084952.GF179940@dell>
        <20210215094509.0b1f0bbf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
        <20210216082046.GA4803@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 16 Feb 2021 08:20:46 +0000 Lee Jones wrote:
> On Mon, 15 Feb 2021, Jakub Kicinski wrote:
> > On Mon, 15 Feb 2021 08:49:52 +0000 Lee Jones wrote:  
> > > Yes, please share.  
> > 
> > https://github.com/kuba-moo/nipa  
> 
> Thanks for this.
> 
> Oh, I see.  So you conduct tests locally, then post them up in a
> section called 'Checks' using the provided API.  

For some definition of "locally" - NIPA runs on a rented VM.

> I assume that Patchwork does not alert the user when something has
> gone awry?  Is this something Nipa does?

The way we run it on netdev is maintainer-centric, IOW we see 
the failures in patchwork and complain to people manually.
The netdev mailing list gets too many messages as is, if NIPA 
responded with results automatically (which is not that hard
technically) my concern is that people would be more likely to
send untested patches to the mailing list and rely on the bot.
