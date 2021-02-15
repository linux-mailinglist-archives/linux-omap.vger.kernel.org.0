Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3056C31C0EE
	for <lists+linux-omap@lfdr.de>; Mon, 15 Feb 2021 18:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhBORqu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Feb 2021 12:46:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:54534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232184AbhBORpz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 15 Feb 2021 12:45:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EAEA60C3D;
        Mon, 15 Feb 2021 17:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613411111;
        bh=H142txNXU7FRt9uW2Sv16n19CyrevXPqFbx8ThdGOrI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uglK3kwezVaW8PF9O7FxFnlzq7edOQYRV4JhCChBfp7IC1sZiO5UIKu4xOQ6CEbW0
         9xuJibheu2jwvY9Fk3sEeGOyqm9b9LEUm3T7vPODQumpsqGUaGbMWpwakK5tdZRLh1
         FsNuf+PV84M6z3tZ3okItznTl+4JAB0yOYeo3t1y+v8MvauJ89KKKgCMB+tqVRnAiC
         4rXdPqCkNqgMoVW068L3bL/2Z7i5JSJoqmsEdsMsvAQ5RAsgsjvO+7jHs+gsVpMxXY
         BOgODid5IqWfH0ncdktLpmuQr59nm0hZpCcT8hBeZWUwySMhkBk8M9e+yLrhjzfbZC
         lDA4fVbX9OE7g==
Date:   Mon, 15 Feb 2021 09:45:09 -0800
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
Message-ID: <20210215094509.0b1f0bbf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210215084952.GF179940@dell>
References: <20210212092016.GF4572@dell>
        <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
        <20210212212503.GC179940@dell>
        <20210212212630.GD179940@dell>
        <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
        <20210212223739.GE179940@dell>
        <161317480301.1254594.16648868282165823277@swboyd.mtv.corp.google.com>
        <YCf4kkMsX+Ymgy6N@lunn.ch>
        <161333644244.1254594.4498059850307971318@swboyd.mtv.corp.google.com>
        <YCmUOHTtc+j4eLkO@lunn.ch>
        <20210215084952.GF179940@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 15 Feb 2021 08:49:52 +0000 Lee Jones wrote:
> > Jakub can explain how he added these checks.  
> 
> Yes, please share.

https://github.com/kuba-moo/nipa
