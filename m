Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7922FCE9F
	for <lists+linux-omap@lfdr.de>; Wed, 20 Jan 2021 12:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbhATKxB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 Jan 2021 05:53:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731358AbhATJbZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 20 Jan 2021 04:31:25 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5F3C061757
        for <linux-omap@vger.kernel.org>; Wed, 20 Jan 2021 01:30:45 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id e15so2203095wme.0
        for <linux-omap@vger.kernel.org>; Wed, 20 Jan 2021 01:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P3Ne/irpWK0pToDck7DyYa8lVDXtVf5cRcYpLpq68u8=;
        b=KuC0tcq83evkt48H1DTelfTBUCctLJY2k5ngkdKKj1kOb9Fr80jIBxyi709606r835
         kOmy9ypLoUQ+GDljAe0My4xiMLrcnsIoqhIFxvTNmg2lWqFzzHttnh6OFCq4AHJ71vSz
         YE5XiV/l9Cd7CdzZJK7n7WDaU/so3lRjzed26NjLLWTN2VR8vsy6eyxQTvcgXFLOvC5d
         R9v8VyUtQfGRDV7uX+2cRx4LnoqMATLvVwu+7v8eLqfT8aStnftOqD0iV+oc0BcpzYiP
         INGUySpv+sm1lu1tjvnwMM2gfi/riSeLtJ0na9guXsJDA5GDgxKrJekjAGS0DgfyVOV7
         BX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P3Ne/irpWK0pToDck7DyYa8lVDXtVf5cRcYpLpq68u8=;
        b=BnuK2Sj4n2s0hDRw8U3AblJIH30xVAqzjBIC84RzpFD7eBgxmw38fvxDWnnR7cbycB
         DuGtMwf5pikzUzrnKs88GLHGCBBHJzvEXKz++yeesjbffk1Fuo0ZS4N5PvtjNCaaa7Hb
         +CyMgZGBQM/OeM47keZExfiz02qp5BXVYjmgH5Bs+WI0+LLTn50cy9kYTF4wA0Sz65gJ
         ZAWBhHN///4ZPLQRaeCnLwwtOROHSUzWT8pdQN9v4HHKM+fCbZSAl44MrglX9TWnvhwR
         A95396/tgf6e0UGquKFdM1ed/eJUh9SdyH76wbysGpkcuWj8QZQLOdUnaxqeyJQXfTid
         z/3A==
X-Gm-Message-State: AOAM532fPQVLMGMLxnNQkY6K6Mx/PBzmjVKJQfJ151AAnX4/5Btj6hCl
        8NDrBBhj16O/FGvu9e6mcunrRQ==
X-Google-Smtp-Source: ABdhPJwkuKGLiilCYOPl4yLZqSrXnQwbxkqU39jDuckh64x0mPe7YxmfrsGB2u5y5xzl0UGCbw8giA==
X-Received: by 2002:a1c:81cc:: with SMTP id c195mr3396693wmd.70.1611135044213;
        Wed, 20 Jan 2021 01:30:44 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:30:43 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        bcm-kernel-feedback-list@broadcom.com,
        Chen-Yu Tsai <wens@csie.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Kees Cook <keescook@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Omri Itach <omrii@marvell.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Pankaj Dev <pankaj.dev@st.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pragnesh Patel <Pragnesh.patel@sifive.com>,
        Ray Jui <rjui@broadcom.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Scott Branden <sbranden@broadcom.com>,
        Shawn Guo <shawnguo@kernel.org>,
        =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stephen Gallimore <stephen.gallimore@st.com>,
        Tero Kristo <kristo@kernel.org>,
        Thomas Abraham <thomas.ab@samsung.com>,
        Xing Zheng <zhengxing@rock-chips.com>,
        Zong Li <zong.li@sifive.com>
Subject: [PATCH 00/20] Rid W=1 warnings from Clock
Date:   Wed, 20 Jan 2021 09:30:20 +0000
Message-Id: <20210120093040.1719407-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

We should have these nailed in ~2 patchsets.

Lee Jones (20):
  clk: rockchip: clk: Demote non-conformant kernel-doc headers
  clk: rockchip: clk-cpu: Remove unused/undocumented struct members
  clk: rockchip: clk-pll: Demote kernel-doc abuses to standard comment
    blocks
  clk: rockchip: clk-half-divider: Demote non-conformant kernel-doc
    header
  clk: bcm: clk-iproc-pll: Demote kernel-doc abuse
  clk: sifive: fu540-prci: Declare static const variable
    'prci_clk_fu540' where it's used
  clk: socfpga: clk-pll: Remove unused variable 'rc'
  clk: socfpga: clk-pll-a10: Remove set but unused variable 'rc'
  clk: mvebu: ap-cpu-clk: Demote non-conformant kernel-doc header
  clk: imx: clk-imx31: Remove unused static const table 'uart_clks'
  clk: st: clkgen-pll: Demote unpopulated kernel-doc header
  clk: st: clkgen-fsyn: Fix worthy struct documentation demote partially
    filled one
  clk: ti: clockdomain: Fix description for 'omap2_init_clk_clkdm's hw
    param
  clk: sunxi: clk-sunxi: Demote a bunch of non-conformant kernel-doc
    headers
  clk: ti: dpll: Fix misnaming of '_register_dpll()'s 'user' parameter
  clk: ti: gate: Fix possible doc-rot in
    'omap36xx_gate_clk_enable_with_hsdiv_restore'
  clk: sunxi: clk-a10-ve: Demote obvious kernel-doc abuse
  clk: sunxi: clk-mod0: Demote non-conformant kernel-doc header
  clk: versatile: clk-icst: Fix worthy struct documentation block
  clk: zynq: clkc: Remove various instances of an unused variable 'clk'

 drivers/clk/bcm/clk-iproc-pll.c         |  2 +-
 drivers/clk/imx/clk-imx31.c             | 10 ----
 drivers/clk/mvebu/ap-cpu-clk.c          |  2 +-
 drivers/clk/rockchip/clk-cpu.c          |  4 --
 drivers/clk/rockchip/clk-half-divider.c |  2 +-
 drivers/clk/rockchip/clk-pll.c          |  6 +-
 drivers/clk/rockchip/clk.c              |  4 +-
 drivers/clk/sifive/fu540-prci.h         |  5 --
 drivers/clk/sifive/sifive-prci.c        |  5 ++
 drivers/clk/socfpga/clk-pll-a10.c       |  3 +-
 drivers/clk/socfpga/clk-pll.c           |  3 +-
 drivers/clk/st/clkgen-fsyn.c            |  6 +-
 drivers/clk/st/clkgen-pll.c             |  3 +-
 drivers/clk/sunxi/clk-a10-ve.c          |  2 +-
 drivers/clk/sunxi/clk-mod0.c            |  2 +-
 drivers/clk/sunxi/clk-sunxi.c           | 32 +++++------
 drivers/clk/ti/clockdomain.c            |  2 +-
 drivers/clk/ti/dpll.c                   |  2 +-
 drivers/clk/ti/gate.c                   |  2 +-
 drivers/clk/versatile/clk-icst.c        |  7 ++-
 drivers/clk/zynq/clkc.c                 | 73 ++++++++++++-------------
 21 files changed, 79 insertions(+), 98 deletions(-)

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: "Emilio López" <emilio@elopez.com.ar>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Omri Itach <omrii@marvell.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Pankaj Dev <pankaj.dev@st.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Pragnesh Patel <Pragnesh.patel@sifive.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: "Sören Brinkmann" <soren.brinkmann@xilinx.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Stephen Gallimore <stephen.gallimore@st.com>
Cc: Tero Kristo <kristo@kernel.org>
Cc: Thomas Abraham <thomas.ab@samsung.com>
Cc: Xing Zheng <zhengxing@rock-chips.com>
Cc: Zong Li <zong.li@sifive.com>
-- 
2.25.1

