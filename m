Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1515331ACD3
	for <lists+linux-omap@lfdr.de>; Sat, 13 Feb 2021 17:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbhBMQFk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 13 Feb 2021 11:05:40 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:39142 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229574AbhBMQFk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 13 Feb 2021 11:05:40 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1lAxPO-0064Gc-9F; Sat, 13 Feb 2021 17:04:34 +0100
Date:   Sat, 13 Feb 2021 17:04:34 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
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
        Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
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
        =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
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
Message-ID: <YCf4kkMsX+Ymgy6N@lunn.ch>
References: <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
 <20210211211054.GD4572@dell>
 <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
 <20210212092016.GF4572@dell>
 <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
 <20210212212503.GC179940@dell>
 <20210212212630.GD179940@dell>
 <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
 <20210212223739.GE179940@dell>
 <161317480301.1254594.16648868282165823277@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161317480301.1254594.16648868282165823277@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

> I'm trying to see if we can make lives better for everyone by exposing
> the warnings by default in the drivers/clk/ directory now that there are
> supposedly none left. Shouldn't we tighten the screws now that we've
> cleaned them?

Do you use patchwork? netdev has a bot attached which applies the
patch and does a W=1 build, and will report any new warnings. But it
does not email the developer, as far as i know. It is up to you as the
maintainer to reject the patch and say why.

	   Andrew
