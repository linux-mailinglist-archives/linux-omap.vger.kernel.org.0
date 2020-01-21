Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFA7143B21
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2020 11:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729387AbgAUKhm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jan 2020 05:37:42 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:33124 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729764AbgAUKha (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jan 2020 05:37:30 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id sydS2100M5USYZQ01ydSK6; Tue, 21 Jan 2020 11:37:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1itquU-00011j-Cx; Tue, 21 Jan 2020 11:37:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1itquU-0000UR-Bk; Tue, 21 Jan 2020 11:37:26 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
        Olof Johansson <olof@lixom.net>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: [PATCH 15/20] ARM: omap2plus: Drop unneeded select of MIGHT_HAVE_CACHE_L2X0
Date:   Tue, 21 Jan 2020 11:37:17 +0100
Message-Id: <20200121103722.1781-15-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200121103722.1781-1-geert+renesas@glider.be>
References: <20200121103413.1337-1-geert+renesas@glider.be>
 <20200121103722.1781-1-geert+renesas@glider.be>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Support for TI AM43x SoCs depends on ARCH_MULTI_V7, which selects
ARCH_MULTI_V6_V7.
As the latter selects MIGHT_HAVE_CACHE_L2X0, there is no need for
SOC_AM43XX to select MIGHT_HAVE_CACHE_L2X0.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
---
All patches in this series are independent of each other.
Cover letter at https://lore.kernel.org/r/20200121103413.1337-1-geert+renesas@glider.be

 arch/arm/mach-omap2/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index dca7d06c0b938619..ea23205bf70f4df6 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -66,7 +66,6 @@ config SOC_AM43XX
 	select ARCH_OMAP2PLUS
 	select ARM_GIC
 	select MACH_OMAP_GENERIC
-	select MIGHT_HAVE_CACHE_L2X0
 	select HAVE_ARM_SCU
 	select GENERIC_CLOCKEVENTS_BROADCAST
 	select HAVE_ARM_TWD
-- 
2.17.1

