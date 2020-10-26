Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E065A298B43
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1772373AbgJZK63 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 06:58:29 -0400
Received: from muru.com ([72.249.23.125]:46444 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1771833AbgJZK63 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 06:58:29 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D72298196;
        Mon, 26 Oct 2020 10:58:31 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] ARM: OMAP2+: Fix location for select PM_GENERIC_DOMAINS
Date:   Mon, 26 Oct 2020 12:58:09 +0200
Message-Id: <20201026105812.38418-2-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026105812.38418-1-tony@atomide.com>
References: <20201026105812.38418-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I accidentally misplaced select PM_GENERIC_DOMAINS, it should be
selected for all the SoCs instead.

Fixes: 58cbff023bfa ("soc: ti: omap-prm: Add basic power domain support")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -7,7 +7,6 @@ config ARCH_OMAP2
 	depends on ARCH_MULTI_V6
 	select ARCH_OMAP2PLUS
 	select CPU_V6
-	select PM_GENERIC_DOMAINS if PM
 	select SOC_HAS_OMAP2_SDRC
 
 config ARCH_OMAP3
@@ -106,6 +105,7 @@ config ARCH_OMAP2PLUS
 	select OMAP_DM_TIMER
 	select OMAP_GPMC
 	select PINCTRL
+	select PM_GENERIC_DOMAINS if PM
 	select RESET_CONTROLLER
 	select SOC_BUS
 	select TI_SYSC
-- 
2.29.1
