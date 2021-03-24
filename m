Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB4D347685
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 11:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234058AbhCXKvX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 06:51:23 -0400
Received: from muru.com ([72.249.23.125]:46378 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231646AbhCXKvF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 06:51:05 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B85088057;
        Wed, 24 Mar 2021 10:52:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] ARM: OMAP2+: Fix warning for omap_init_time_of()
Date:   Wed, 24 Mar 2021 12:51:02 +0200
Message-Id: <20210324105102.7286-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix warning: no previous prototype for 'omap_init_time_of'.

Fixes: e69b4e1a7577 ("ARM: OMAP2+: Add omap_init_time_of()")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/board-generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/board-generic.c b/arch/arm/mach-omap2/board-generic.c
--- a/arch/arm/mach-omap2/board-generic.c
+++ b/arch/arm/mach-omap2/board-generic.c
@@ -33,7 +33,7 @@ static void __init __maybe_unused omap_generic_init(void)
 }
 
 /* Clocks are needed early, see drivers/clocksource for the rest */
-void __init __maybe_unused omap_init_time_of(void)
+static void __init __maybe_unused omap_init_time_of(void)
 {
 	omap_clk_init();
 	timer_probe();
-- 
2.31.0
