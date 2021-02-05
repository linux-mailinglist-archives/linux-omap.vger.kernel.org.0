Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE8F531107B
	for <lists+linux-omap@lfdr.de>; Fri,  5 Feb 2021 19:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbhBERPW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Feb 2021 12:15:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:49990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233121AbhBERN2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 5 Feb 2021 12:13:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D95764EFE;
        Fri,  5 Feb 2021 18:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612551306;
        bh=l2A8CAgF/G7BGZq7431N93An0up6jDTvpRHYH8cBfG8=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=RPOj45dXJLj+vuNI8ahjCDXbfaAmoG+k7jRNp9Mp4pxf/xI3v4qYPHjTR0eZjUonW
         SIkvXTlfrM4M5V1csQXDB3KtpyaetGu3A6NSZYiVjly/E1FtXUuVDnKKj90+hT7kga
         72GNn9IGjtdxL9hhA7OKuQ0JoS0oaz+FFxGgl8kX1jZmqqDFq/kLas956fzVQg3+Tp
         cgoCrwd84QWZpwzQ6Ju8Ml1ADw81R8AIzyyJMcL7KtTYIWcDxWum6dtU8ejQXc+zPm
         cCC61w8Y3422l2yvWjt7AzjbIe5Cj51B0BEhUV+uecnjDzzoWzG0vHppylMCNsvTKj
         IHO260731sTEw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210203083155.GA2329016@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org> <20210203083155.GA2329016@dell>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
From:   Stephen Boyd <sboyd@kernel.org>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
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
        Lee Jones <lee.jones@linaro.org>, Loc Ho <lho@apm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Nancy Yuen <yuenn@google.com>,
        Nuvoton Technologies <tali.perry@nuvoton.com>,
        Patrick Venture <venture@google.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        P rashant Gaikwad <pgaikwad@nvidia.com>,
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
        Viresh Kumar <vireshk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        openbmc@lists.ozlabs.org
Date:   Fri, 05 Feb 2021 10:55:05 -0800
Message-ID: <161255130506.76967.8682382463883809207@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Lee Jones (2021-02-03 00:31:55)
> On Tue, 26 Jan 2021, Lee Jones wrote:
>=20
> > This set is part of a larger effort attempting to clean-up W=3D1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> >=20
> > This is the last set.  Clock is clean after this.
>=20
> Out of interest, what normally happens to the patches which aren't
> picked up by individual driver Maintainers?
>=20

I have to go in and figure it out! :)
