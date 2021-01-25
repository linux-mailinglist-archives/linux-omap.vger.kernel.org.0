Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 742093030AB
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 00:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732447AbhAYX5q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Jan 2021 18:57:46 -0500
Received: from gloria.sntech.de ([185.11.138.130]:34260 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732068AbhAYX5l (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 25 Jan 2021 18:57:41 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.fritz.box)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l4Bih-00066j-UM; Tue, 26 Jan 2021 00:56:31 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Heiko Stuebner <heiko@sntech.de>, Tero Kristo <kristo@kernel.org>,
        Xing Zheng <zhengxing@rock-chips.com>,
        linux-clk@vger.kernel.org,
        Pragnesh Patel <Pragnesh.patel@sifive.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        Stephen Gallimore <stephen.gallimore@st.com>,
        linux-arm-kernel@lists.infradead.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Dinh Nguyen <dinguyen@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-rockchip@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        Zong Li <zong.li@sifive.com>,
        Kees Cook <keescook@chromium.org>,
        Pankaj Dev <pankaj.dev@st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
        Omri Itach <omrii@marvell.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        linux-riscv@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Thomas Abraham <thomas.ab@samsung.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Scott Branden <sbranden@broadcom.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-omap@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: Re: (subset) [PATCH 00/20] Rid W=1 warnings from Clock
Date:   Tue, 26 Jan 2021 00:56:22 +0100
Message-Id: <161161878917.2050283.12124477211963150680.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120093040.1719407-1-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 20 Jan 2021 09:30:20 +0000, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> We should have these nailed in ~2 patchsets.
> 
> Lee Jones (20):
>   clk: rockchip: clk: Demote non-conformant kernel-doc headers
>   clk: rockchip: clk-cpu: Remove unused/undocumented struct members
>   clk: rockchip: clk-pll: Demote kernel-doc abuses to standard comment
>     blocks
>   clk: rockchip: clk-half-divider: Demote non-conformant kernel-doc
>     header
>   clk: bcm: clk-iproc-pll: Demote kernel-doc abuse
>   clk: sifive: fu540-prci: Declare static const variable
>     'prci_clk_fu540' where it's used
>   clk: socfpga: clk-pll: Remove unused variable 'rc'
>   clk: socfpga: clk-pll-a10: Remove set but unused variable 'rc'
>   clk: mvebu: ap-cpu-clk: Demote non-conformant kernel-doc header
>   clk: imx: clk-imx31: Remove unused static const table 'uart_clks'
>   clk: st: clkgen-pll: Demote unpopulated kernel-doc header
>   clk: st: clkgen-fsyn: Fix worthy struct documentation demote partially
>     filled one
>   clk: ti: clockdomain: Fix description for 'omap2_init_clk_clkdm's hw
>     param
>   clk: sunxi: clk-sunxi: Demote a bunch of non-conformant kernel-doc
>     headers
>   clk: ti: dpll: Fix misnaming of '_register_dpll()'s 'user' parameter
>   clk: ti: gate: Fix possible doc-rot in
>     'omap36xx_gate_clk_enable_with_hsdiv_restore'
>   clk: sunxi: clk-a10-ve: Demote obvious kernel-doc abuse
>   clk: sunxi: clk-mod0: Demote non-conformant kernel-doc header
>   clk: versatile: clk-icst: Fix worthy struct documentation block
>   clk: zynq: clkc: Remove various instances of an unused variable 'clk'
> 
> [...]

Applied, thanks!

[01/20] clk: rockchip: clk: Demote non-conformant kernel-doc headers
        commit: 415173712003ad7e54de7198979d68a428440ed6
[02/20] clk: rockchip: clk-cpu: Remove unused/undocumented struct members
        commit: 274ae6da4b3275fea32f0807e6e20715695dd210
[03/20] clk: rockchip: clk-pll: Demote kernel-doc abuses to standard comment blocks
        commit: eee7b95589e61bd7250cada52ddd8039c63535ef
[04/20] clk: rockchip: clk-half-divider: Demote non-conformant kernel-doc header
        commit: d48fbef962b095f7cc22017642fb9055d57fdb53

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
