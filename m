Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40D617DD51C
	for <lists+linux-omap@lfdr.de>; Tue, 31 Oct 2023 18:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376435AbjJaRrT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 31 Oct 2023 13:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376395AbjJaRrT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 31 Oct 2023 13:47:19 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445D1B4;
        Tue, 31 Oct 2023 10:47:16 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575D6C433C8;
        Tue, 31 Oct 2023 17:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1698774435;
        bh=mzkYLKw++9kwZ4JCA90CK3PNLuy3nMbGy5UObs4nUXI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fWGabrB6a0Awt9kmMGGDNeflYTFY2EK6VHh0P8i3dD8AXtxlAnl8uYkW4aShqDOkl
         ANkyLW7e9uDQ49CKKLttQMZd4/qh2rKndUGs40Vdks5SNIhTGdZZUY7QRgmumtYcUQ
         Web7+daEVeWudwGf+/bz4yzVpbeRNdzcEoXSmWDg=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patches@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Vaibhav Hiremath <hvaibhav@ti.com>,
        Felipe Balbi <balbi@ti.com>, Tony Lindgren <tony@atomide.com>,
        Xunlei Pang <pang.xunlei@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Ingo Molnar <mingo@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.5 045/112] ARM: OMAP: timer32K: fix all kernel-doc warnings
Date:   Tue, 31 Oct 2023 18:00:46 +0100
Message-ID: <20231031165902.728892368@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031165901.318222981@linuxfoundation.org>
References: <20231031165901.318222981@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

6.5-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 7eeca8ccd1066c68d6002dbbe26433f8c17c53eb ]

Fix kernel-doc warnings reported by the kernel test robot:

timer32k.c:186: warning: cannot understand function prototype: 'struct timespec64 persistent_ts; '
timer32k.c:191: warning: Function parameter or member 'ts' not described in 'omap_read_persistent_clock64'
timer32k.c:216: warning: Function parameter or member 'vbase' not described in 'omap_init_clocksource_32k'
timer32k.c:216: warning: Excess function parameter 'pbase' description in 'omap_init_clocksource_32k'
timer32k.c:216: warning: Excess function parameter 'size' description in 'omap_init_clocksource_32k'
timer32k.c:216: warning: No description found for return value of 'omap_init_clocksource_32k'

Fixes: a451570c008b ("ARM: OMAP: 32k counter: Provide y2038-safe omap_read_persistent_clock() replacement")
Fixes: 1fe97c8f6a1d ("ARM: OMAP: Make OMAP clocksource source selection using kernel param")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/all/202310070106.8QSyJOm3-lkp@intel.com/
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Vaibhav Hiremath <hvaibhav@ti.com>
Cc: Felipe Balbi <balbi@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Xunlei Pang <pang.xunlei@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: linux-omap@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Message-ID: <20231007001603.24972-1-rdunlap@infradead.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/mach-omap1/timer32k.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-omap1/timer32k.c b/arch/arm/mach-omap1/timer32k.c
index 410d17d1d4431..f618a6df29382 100644
--- a/arch/arm/mach-omap1/timer32k.c
+++ b/arch/arm/mach-omap1/timer32k.c
@@ -176,17 +176,18 @@ static u64 notrace omap_32k_read_sched_clock(void)
 	return sync32k_cnt_reg ? readl_relaxed(sync32k_cnt_reg) : 0;
 }
 
+static struct timespec64 persistent_ts;
+static cycles_t cycles;
+static unsigned int persistent_mult, persistent_shift;
+
 /**
  * omap_read_persistent_clock64 -  Return time from a persistent clock.
+ * @ts: &struct timespec64 for the returned time
  *
  * Reads the time from a source which isn't disabled during PM, the
  * 32k sync timer.  Convert the cycles elapsed since last read into
  * nsecs and adds to a monotonically increasing timespec64.
  */
-static struct timespec64 persistent_ts;
-static cycles_t cycles;
-static unsigned int persistent_mult, persistent_shift;
-
 static void omap_read_persistent_clock64(struct timespec64 *ts)
 {
 	unsigned long long nsecs;
@@ -206,10 +207,9 @@ static void omap_read_persistent_clock64(struct timespec64 *ts)
 /**
  * omap_init_clocksource_32k - setup and register counter 32k as a
  * kernel clocksource
- * @pbase: base addr of counter_32k module
- * @size: size of counter_32k to map
+ * @vbase: base addr of counter_32k module
  *
- * Returns 0 upon success or negative error code upon failure.
+ * Returns: %0 upon success or negative error code upon failure.
  *
  */
 static int __init omap_init_clocksource_32k(void __iomem *vbase)
-- 
2.42.0



