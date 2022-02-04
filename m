Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5394A9451
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 08:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348467AbiBDHO5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 02:14:57 -0500
Received: from muru.com ([72.249.23.125]:46232 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236288AbiBDHO5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 02:14:57 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 665BA80F0;
        Fri,  4 Feb 2022 07:14:39 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 0/8] Clock changes for TI dts reg and node name issues
Date:   Fri,  4 Feb 2022 09:14:41 +0200
Message-Id: <20220204071449.16762-1-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are TI clock changes that allow us to update the devicetree files to
use clock-output-names instead of non-standard node names for clocks.

The related devicetree binding changes have been sent and are the
folloing patches:

[PATCHv2] dt-bindings: clock: Add binding for TI clksel
[PATCH 1/3] dt-bindings: omap: Add clock-output-names and #clock-cells

In addition to these changes, also devicetree changes are needed. Some
SoCs also need patches to unify the internal clock names. I'll be
sending those out separately.

Regards,

Tony


Tony Lindgren (8):
  clk: ti: Constify clkctrl_name
  clk: ti: Preserve node in ti_dt_clocks_register()
  clk: ti: Optionally parse IO address from parent clock node
  clk: ti: Add ti_find_clock_provider() to use clock-output-names
  clk: ti: Use clock-output-names for clkctrl
  clk: ti: Add ti_dt_clk_name() helper to use clock-output-names
  clk: ti: Update pll and clockdomain clocks to use ti_dt_clk_name()
  clk: ti: Update component clocks to use ti_dt_clk_name()

 drivers/clk/ti/apll.c         | 13 ++++--
 drivers/clk/ti/autoidle.c     |  2 +-
 drivers/clk/ti/clk-dra7-atl.c |  6 ++-
 drivers/clk/ti/clk.c          | 86 +++++++++++++++++++++++++++++++----
 drivers/clk/ti/clkctrl.c      | 24 ++++++++--
 drivers/clk/ti/clock.h        |  1 +
 drivers/clk/ti/clockdomain.c  |  2 +-
 drivers/clk/ti/composite.c    |  6 ++-
 drivers/clk/ti/divider.c      |  6 ++-
 drivers/clk/ti/dpll.c         |  8 ++--
 drivers/clk/ti/fapll.c        | 11 +++--
 drivers/clk/ti/fixed-factor.c |  2 +-
 drivers/clk/ti/gate.c         |  4 +-
 drivers/clk/ti/interface.c    |  4 +-
 drivers/clk/ti/mux.c          |  4 +-
 15 files changed, 143 insertions(+), 36 deletions(-)

-- 
2.35.1
