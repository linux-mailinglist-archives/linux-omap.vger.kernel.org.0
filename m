Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD20312AE5
	for <lists+linux-omap@lfdr.de>; Mon,  8 Feb 2021 07:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhBHGqo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Feb 2021 01:46:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:56792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229908AbhBHGqn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Feb 2021 01:46:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E47364E59;
        Mon,  8 Feb 2021 06:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612766761;
        bh=laV8svMkkIZgkEjMImPDqav9pFAGfCHDdtEUcbdDnvY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TGskujnEd6wHa7WkmlrA/txwqRTcJGBrt+G8G29pmkA5kZJTpP9p0uA0OBvZIqSvD
         JxUKjVIlJL7BN44ZogKx96Zw8qus91VU68qdycGrSWnEl44/V2NTQUC1OLOTCdF4Gu
         FGXrZfB1UlGCm0us6h06+bTEmrWyNdKdO1cQE50Xn9aYIA9cVXbE7c/MBRqdiuZ1jz
         yRAPPdGXm7pgspO8bff3EiWF+togadvuTOEFB2flyG4QXvLieVjLI1n9IWbF4cIrlT
         j4bPAIhCO/OgcnQj5qsi4LQSz7dkKfKSzdR46yYTRQHb0tQHuVB44086JDEOFAZDLc
         NgM8lbk2wAojg==
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Boris BREZILLON <boris.brezillon@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>,
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
        =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tali Perry <tali.perry1@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
From:   Tero Kristo <kristo@kernel.org>
Message-ID: <b801364c-951a-af9f-d7ad-2440afe1ed88@kernel.org>
Date:   Mon, 8 Feb 2021 08:45:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 26/01/2021 14:45, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> This is the last set.  Clock is clean after this.
> 
> Lee Jones (21):
>    clk: zynq: pll: Fix kernel-doc formatting in 'clk_register_zynq_pll's
>      header
>    clk: ti: clkt_dpll: Fix some kernel-doc misdemeanours
>    clk: ti: dpll3xxx: Fix some kernel-doc headers and promote other
>      worthy ones
>    clk: qcom: clk-regmap: Provide missing description for
>      'devm_clk_register_regmap()'s dev param
>    clk: sunxi: clk-sun9i-core: Demote non-conformant kernel-doc headers
>    clk: sunxi: clk-usb: Demote obvious kernel-doc abuse
>    clk: tegra: clk-tegra30: Remove unused variable 'reg'
>    clk: clkdev: Ignore suggestion to use gnu_printf() as it's not
>      appropriate here
>    clk: tegra: cvb: Provide missing description for
>      'tegra_cvb_add_opp_table()'s align param
>    clk: ti: dpll44xx: Fix some potential doc-rot
>    clk: renesas: renesas-cpg-mssr: Fix formatting issues for
>      'smstpcr_saved's documentation
>    clk: sunxi: clk-sun6i-ar100: Demote non-conformant kernel-doc header
>    clk: qcom: gcc-ipq4019: Remove unused variable 'ret'
>    clk: clk-fixed-mmio: Demote obvious kernel-doc abuse
>    clk: clk-npcm7xx: Remove unused static const tables 'npcm7xx_gates'
>      and 'npcm7xx_divs_fx'
>    clk: qcom: mmcc-msm8974: Remove unused static const tables
>      'mmcc_xo_mmpll0_1_2_gpll0{map}'
>    clk: clk-xgene: Add description for 'mask' and fix formatting for
>      'flags'
>    clk: qcom: clk-rpm: Remove a bunch of superfluous code
>    clk: spear: Move prototype to accessible header
>    clk: imx: Move 'imx6sl_set_wait_clk()'s prototype out to accessible
>      header
>    clk: zynqmp: divider: Add missing description for 'max_div'
> 
>   arch/arm/mach-imx/common.h             |   1 -
>   arch/arm/mach-imx/cpuidle-imx6sl.c     |   1 +
>   arch/arm/mach-imx/pm-imx6.c            |   1 +
>   arch/arm/mach-spear/generic.h          |  12 ---
>   arch/arm/mach-spear/spear13xx.c        |   1 +
>   drivers/clk/clk-fixed-mmio.c           |   2 +-
>   drivers/clk/clk-npcm7xx.c              | 108 -------------------------
>   drivers/clk/clk-xgene.c                |   5 +-
>   drivers/clk/clkdev.c                   |   7 ++
>   drivers/clk/imx/clk-imx6sl.c           |   1 +
>   drivers/clk/qcom/clk-regmap.c          |   1 +
>   drivers/clk/qcom/clk-rpm.c             |  63 ---------------
>   drivers/clk/qcom/gcc-ipq4019.c         |   7 +-
>   drivers/clk/qcom/mmcc-msm8974.c        |  16 ----
>   drivers/clk/renesas/renesas-cpg-mssr.c |   4 +-
>   drivers/clk/spear/spear1310_clock.c    |   1 +
>   drivers/clk/spear/spear1340_clock.c    |   1 +
>   drivers/clk/sunxi/clk-sun6i-ar100.c    |   2 +-
>   drivers/clk/sunxi/clk-sun9i-core.c     |   8 +-
>   drivers/clk/sunxi/clk-usb.c            |   2 +-
>   drivers/clk/tegra/clk-tegra30.c        |   5 +-
>   drivers/clk/tegra/cvb.c                |   1 +
>   drivers/clk/ti/clkt_dpll.c             |   3 +-
>   drivers/clk/ti/dpll3xxx.c              |  20 ++---
>   drivers/clk/ti/dpll44xx.c              |   6 +-

For the TI portions:

Reviewed-by: Tero Kristo <kristo@kernel.org>

>   drivers/clk/zynq/pll.c                 |  12 +--
>   drivers/clk/zynqmp/divider.c           |   1 +
>   include/linux/clk/imx.h                |  15 ++++
>   include/linux/clk/spear.h              |  23 ++++++
>   29 files changed, 92 insertions(+), 238 deletions(-)
>   create mode 100644 include/linux/clk/imx.h
>   create mode 100644 include/linux/clk/spear.h
> 
> Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Benjamin Fair <benjaminfair@google.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: "Emilio López" <emilio@elopez.com.ar>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Jan Kotas <jank@cadence.com>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Cc: Loc Ho <lho@apm.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Nancy Yuen <yuenn@google.com>
> Cc: Nuvoton Technologies <tali.perry@nuvoton.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: openbmc@lists.ozlabs.org
> Cc: Patrick Venture <venture@google.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
> Cc: Rajan Vaja <rajan.vaja@xilinx.com>
> Cc: Rajeev Kumar <rajeev-dlh.kumar@st.com>
> Cc: Richard Woodruff <r-woodruff2@ti.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
> Cc: "Sören Brinkmann" <soren.brinkmann@xilinx.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Tali Perry <tali.perry1@gmail.com>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Viresh Kumar <vireshk@kernel.org>
> 

