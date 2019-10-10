Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57433D1D30
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 02:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732017AbfJJAMa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 20:12:30 -0400
Received: from muru.com ([72.249.23.125]:36736 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731916AbfJJAMa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Oct 2019 20:12:30 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C091381CA;
        Thu, 10 Oct 2019 00:13:03 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 2/8] ARM: OMAP2+: Drop bogus wkup domain oswr setting
Date:   Wed,  9 Oct 2019 17:12:18 -0700
Message-Id: <20191010001224.41826-3-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010001224.41826-1-tony@atomide.com>
References: <20191010001224.41826-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The wkup domain is always on and does not have logic off setting. This
got accidentally added by commit f74297dd9354 ("ARM: OMAP2+: Make sure
LOGICRETSTATE bits are not cleared") but is harmless.

Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/pm44xx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/pm44xx.c b/arch/arm/mach-omap2/pm44xx.c
--- a/arch/arm/mach-omap2/pm44xx.c
+++ b/arch/arm/mach-omap2/pm44xx.c
@@ -137,8 +137,7 @@ static int __init pwrdms_setup(struct powerdomain *pwrdm, void *unused)
 	 * smsc911x at least if per hits retention during idle.
 	 */
 	if (!strncmp(pwrdm->name, "core", 4) ||
-	    !strncmp(pwrdm->name, "l4per", 5) ||
-	    !strncmp(pwrdm->name, "wkup", 4))
+	    !strncmp(pwrdm->name, "l4per", 5))
 		pwrdm_set_logic_retst(pwrdm, PWRDM_POWER_RET);
 
 	pwrst = kmalloc(sizeof(struct power_state), GFP_ATOMIC);
-- 
2.23.0
