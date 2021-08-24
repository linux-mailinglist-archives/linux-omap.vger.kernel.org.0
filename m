Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 030DE3F5D9A
	for <lists+linux-omap@lfdr.de>; Tue, 24 Aug 2021 14:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236880AbhHXMEw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Aug 2021 08:04:52 -0400
Received: from smtpbg587.qq.com ([113.96.223.105]:50970 "EHLO smtpbg587.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234787AbhHXMEv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 24 Aug 2021 08:04:51 -0400
X-QQ-mid: bizesmtp54t1629806534tjskznfw
Received: from localhost.localdomain (unknown [171.223.97.141])
        by esmtp6.qq.com (ESMTP) with 
        id ; Tue, 24 Aug 2021 20:02:13 +0800 (CST)
X-QQ-SSF: 01000000000000B0D000000A0000000
X-QQ-FEAT: X7NOTpAiNV9y2mUVjnG8y0XYRtp6ebttZyUfiBBe3EQj5Fcr2bdcWJe1rLBUf
        QmjOFhF9IG6VcW25vClp/mRXX3siqUCjxGywC/sT22vcuV9RkmX6G62J+RVEfvPx1N2yFlZ
        0eYpSp1OkmvI5LaA/f2HW1IbQFtAnuGQqRdbI8zMjh3RBOln9HpGxJq8j+1favQJDpKEs11
        f04qLunsOUBulhMAEc904aTgefcFsZgdbjRLsJ+ahvAElxsnAat7vUXjTB7YzX1Zs6bwwXK
        Dnba+Rzr7gMHCWXlf/rvT1aN9zmvfYmlwx3sLhEwbwuMYABm3/Sr5GB7F/mMQodBZqmoDSy
        zR6dq2c
X-QQ-GoodBg: 0
From:   Jason Wang <wangborong@cdjrlc.com>
To:     paul@pwsan.com
Cc:     bcousson@baylibre.com, tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] ARM: OMAP2+: Fix typo in some comments
Date:   Tue, 24 Aug 2021 20:01:23 +0800
Message-Id: <20210824120123.10899-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam3
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The double `the' in comment "get a struct clk * for the the hwmod's ..."
is repeated. Therefore, we should remove one of them from the comments.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/arm/mach-omap2/omap_hwmod.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 12b26e04686f..a78ef7e7ce23 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -812,7 +812,7 @@ static struct clk *_lookup_clkctrl_clk(struct omap_hwmod *oh)
 }
 
 /**
- * _init_main_clk - get a struct clk * for the the hwmod's main functional clk
+ * _init_main_clk - get a struct clk * for the hwmod's main functional clk
  * @oh: struct omap_hwmod *
  *
  * Called from _init_clocks().  Populates the @oh _clk (main
@@ -862,7 +862,7 @@ static int _init_main_clk(struct omap_hwmod *oh)
 }
 
 /**
- * _init_interface_clks - get a struct clk * for the the hwmod's interface clks
+ * _init_interface_clks - get a struct clk * for the hwmod's interface clks
  * @oh: struct omap_hwmod *
  *
  * Called from _init_clocks().  Populates the @oh OCP slave interface
@@ -901,7 +901,7 @@ static int _init_interface_clks(struct omap_hwmod *oh)
 }
 
 /**
- * _init_opt_clk - get a struct clk * for the the hwmod's optional clocks
+ * _init_opt_clk - get a struct clk * for the hwmod's optional clocks
  * @oh: struct omap_hwmod *
  *
  * Called from _init_clocks().  Populates the @oh omap_hwmod_opt_clk
-- 
2.32.0

