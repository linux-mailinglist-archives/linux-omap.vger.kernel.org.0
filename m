Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7E87D1065
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 15:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731178AbfJINln (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 09:41:43 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:58307 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731180AbfJINln (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 09:41:43 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iICDj-0007du-4z; Wed, 09 Oct 2019 14:41:39 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iICDi-0007W7-EQ; Wed, 09 Oct 2019 14:41:38 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Kevin Hilman <khilman@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: OMAP2+: pm33xx-core: make am43xx_get_rtc_base_addr static
Date:   Wed,  9 Oct 2019 14:41:37 +0100
Message-Id: <20191009134137.28852-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Make am43xx_get_rtc_base_addr as is not used outside of
this file. Fixes the following sparse warning:

arch/arm/mach-omap2/pm33xx-core.c:190:14: warning: symbol 'am43xx_get_rtc_base_addr' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Kevin Hilman <khilman@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/mach-omap2/pm33xx-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/pm33xx-core.c b/arch/arm/mach-omap2/pm33xx-core.c
index f11442ed3eff..05ad017796f8 100644
--- a/arch/arm/mach-omap2/pm33xx-core.c
+++ b/arch/arm/mach-omap2/pm33xx-core.c
@@ -187,7 +187,7 @@ static struct am33xx_pm_sram_addr *amx3_get_sram_addrs(void)
 		return NULL;
 }
 
-void __iomem *am43xx_get_rtc_base_addr(void)
+static void __iomem *am43xx_get_rtc_base_addr(void)
 {
 	rtc_oh = omap_hwmod_lookup("rtc");
 
-- 
2.23.0

