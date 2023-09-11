Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B188679A241
	for <lists+linux-omap@lfdr.de>; Mon, 11 Sep 2023 06:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbjIKEI5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Sep 2023 00:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjIKEI5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Sep 2023 00:08:57 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6A88DEB;
        Sun, 10 Sep 2023 21:08:53 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A3E658027;
        Mon, 11 Sep 2023 04:08:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 4/4] ARM: omap2+: Downgrade u-boot version warnings to debug statements
Date:   Mon, 11 Sep 2023 07:08:27 +0300
Message-ID: <20230911040828.39386-4-tony@atomide.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911040828.39386-1-tony@atomide.com>
References: <20230911040828.39386-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We should be able to see real issues with dmesg -l err,warn. The u-boot
revision warning should be a debug statement rather than a warning.

Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Carl Philipp Klemm <philipp@uvos.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/pm44xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/pm44xx.c b/arch/arm/mach-omap2/pm44xx.c
--- a/arch/arm/mach-omap2/pm44xx.c
+++ b/arch/arm/mach-omap2/pm44xx.c
@@ -99,7 +99,7 @@ static int omap4_pm_suspend(void)
 		 * possible causes.
 		 * http://www.spinics.net/lists/arm-kernel/msg218641.html
 		 */
-		pr_warn("A possible cause could be an old bootloader - try u-boot >= v2012.07\n");
+		pr_debug("A possible cause could be an old bootloader - try u-boot >= v2012.07\n");
 	} else {
 		pr_info("Successfully put all powerdomains to target state\n");
 	}
@@ -257,7 +257,7 @@ int __init omap4_pm_init(void)
 	 * http://www.spinics.net/lists/arm-kernel/msg218641.html
 	 */
 	if (cpu_is_omap44xx())
-		pr_warn("OMAP4 PM: u-boot >= v2012.07 is required for full PM support\n");
+		pr_debug("OMAP4 PM: u-boot >= v2012.07 is required for full PM support\n");
 
 	ret = pwrdm_for_each(pwrdms_setup, NULL);
 	if (ret) {
-- 
2.42.0
