Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1B03194B3
	for <lists+linux-omap@lfdr.de>; Thu, 11 Feb 2021 21:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbhBKUry (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Feb 2021 15:47:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:50166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230450AbhBKUrx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 11 Feb 2021 15:47:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6FD864E3B;
        Thu, 11 Feb 2021 20:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613076432;
        bh=vG0YvE0JNwxsy3Hevz/Y83+mEgLMI6DUHbIarDb9OXE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PVxo1LcX30rdtmFh6xUTj0kdmeNXam0jtuw6i0BLJQDVuKWEDUq9DsCKxKe5cZ7j1
         75/Mjac7W7cQpPmKJWeJ29DNvE8fjxy3nKld2+4lQpBanSpgWJPv4/VETRy6/iVUXD
         YLffOrahpYQWiA4lqBppMqKoxm6/rN83EQZJ5dnLQqqLrX1/UxngHD0L11G42nD4xd
         qvjtqSD9WCW+CnL5eGFhL75f7lIx+A81XawEnKMMXzZNi7lT9lmmZYGnIfE2z3+1iD
         UQ+OsCH6IuHmlXyDe7uIqmrktnI8W8QvKTviHz47x2lPSsVy5PWxgrUX3iMD7uVGnZ
         E90e1uh8zSx2A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
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
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 12:47:11 -0800
Message-ID: <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Lee Jones (2021-01-26 04:45:19)
> This set is part of a larger effort attempting to clean-up W=3D1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
>=20
> This is the last set.  Clock is clean after this.

Is it possible to slam in some patch that makes W=3D1 the default for the
clk directory? I'm trying to avoid seeing this patch series again.
