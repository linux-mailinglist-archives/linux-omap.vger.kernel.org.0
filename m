Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F07ABAA56
	for <lists+linux-omap@lfdr.de>; Sun, 22 Sep 2019 21:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730718AbfIVTZD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 22 Sep 2019 15:25:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:51620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407930AbfIVSwe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 22 Sep 2019 14:52:34 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62F4421479;
        Sun, 22 Sep 2019 18:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569178353;
        bh=Iqq+ihm3MEyO7MocIdtefL66drtCw5MVI0GpPu7TVtI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aIvRT1LNTOB5f/QhKIPGh4+vV+Au5fW1IuUZZCa1rICMVK5W3z6ChGTJslGVwE8FZ
         7iZvPUqlFedYUVunrUHB5FGrM8K/xF5MAm/33KFeLwRiIDAzC178ok5iKnvGZr/Ko9
         RG4VnykvY6EBdaxeELM7TN2PAabTd4OEM6ISj1Lw=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Keerthy <j-keerthy@ti.com>, Tony Lindgren <tony@atomide.com>,
        Sasha Levin <sashal@kernel.org>, linux-omap@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 109/185] ARM: OMAP2+: move platform-specific asm-offset.h to arch/arm/mach-omap2
Date:   Sun, 22 Sep 2019 14:48:07 -0400
Message-Id: <20190922184924.32534-109-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922184924.32534-1-sashal@kernel.org>
References: <20190922184924.32534-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Masahiro Yamada <yamada.masahiro@socionext.com>

[ Upstream commit ccf4975dca233b1d6a74752d6ab35c239edc0d58 ]

<generated/ti-pm-asm-offsets.h> is only generated and included by
arch/arm/mach-omap2/, so it does not need to reside in the globally
visible include/generated/.

I renamed it to arch/arm/mach-omap2/pm-asm-offsets.h since the prefix
'ti-' is just redundant in mach-omap2/.

My main motivation of this change is to avoid the race condition for
the parallel build (-j) when CONFIG_IKHEADERS is enabled.

When it is enabled, all the headers under include/ are archived into
kernel/kheaders_data.tar.xz and exposed in the sysfs.

In the parallel build, we have no idea in which order files are built.

 - If ti-pm-asm-offsets.h is built before kheaders_data.tar.xz,
   the header will be included in the archive. Probably nobody will
   use it, but it is harmless except that it will increase the archive
   size needlessly.

 - If kheaders_data.tar.xz is built before ti-pm-asm-offsets.h,
   the header will not be included in the archive. However, in the next
   build, the archive will be re-generated to include the newly-found
   ti-pm-asm-offsets.h. This is not nice from the build system point
   of view.

 - If ti-pm-asm-offsets.h and kheaders_data.tar.xz are built at the
   same time, the corrupted header might be included in the archive,
   which does not look nice either.

This commit fixes the race.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Tested-by: Keerthy <j-keerthy@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/mach-omap2/.gitignore  | 1 +
 arch/arm/mach-omap2/Makefile    | 5 +++--
 arch/arm/mach-omap2/sleep33xx.S | 2 +-
 arch/arm/mach-omap2/sleep43xx.S | 2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/mach-omap2/.gitignore

diff --git a/arch/arm/mach-omap2/.gitignore b/arch/arm/mach-omap2/.gitignore
new file mode 100644
index 0000000000000..79a8d6ea71520
--- /dev/null
+++ b/arch/arm/mach-omap2/.gitignore
@@ -0,0 +1 @@
+pm-asm-offsets.h
diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
index 85d1b13c9215b..26baeb6477aff 100644
--- a/arch/arm/mach-omap2/Makefile
+++ b/arch/arm/mach-omap2/Makefile
@@ -236,9 +236,10 @@ obj-y					+= omap_phy_internal.o
 
 obj-$(CONFIG_MACH_OMAP2_TUSB6010)	+= usb-tusb6010.o
 
-include/generated/ti-pm-asm-offsets.h: arch/arm/mach-omap2/pm-asm-offsets.s FORCE
+$(obj)/pm-asm-offsets.h: $(obj)/pm-asm-offsets.s FORCE
 	$(call filechk,offsets,__TI_PM_ASM_OFFSETS_H__)
 
-$(obj)/sleep33xx.o $(obj)/sleep43xx.o: include/generated/ti-pm-asm-offsets.h
+$(obj)/sleep33xx.o $(obj)/sleep43xx.o: $(obj)/pm-asm-offsets.h
 
 targets += pm-asm-offsets.s
+clean-files += pm-asm-offsets.h
diff --git a/arch/arm/mach-omap2/sleep33xx.S b/arch/arm/mach-omap2/sleep33xx.S
index 47a816468cdb4..a003769121aaa 100644
--- a/arch/arm/mach-omap2/sleep33xx.S
+++ b/arch/arm/mach-omap2/sleep33xx.S
@@ -6,7 +6,6 @@
  *	Dave Gerlach, Vaibhav Bedia
  */
 
-#include <generated/ti-pm-asm-offsets.h>
 #include <linux/linkage.h>
 #include <linux/platform_data/pm33xx.h>
 #include <linux/ti-emif-sram.h>
@@ -15,6 +14,7 @@
 
 #include "iomap.h"
 #include "cm33xx.h"
+#include "pm-asm-offsets.h"
 
 #define AM33XX_CM_CLKCTRL_MODULESTATE_DISABLED			0x00030000
 #define AM33XX_CM_CLKCTRL_MODULEMODE_DISABLE			0x0003
diff --git a/arch/arm/mach-omap2/sleep43xx.S b/arch/arm/mach-omap2/sleep43xx.S
index 0c1031442571f..27b13d47cf193 100644
--- a/arch/arm/mach-omap2/sleep43xx.S
+++ b/arch/arm/mach-omap2/sleep43xx.S
@@ -6,7 +6,6 @@
  *	Dave Gerlach, Vaibhav Bedia
  */
 
-#include <generated/ti-pm-asm-offsets.h>
 #include <linux/linkage.h>
 #include <linux/ti-emif-sram.h>
 #include <linux/platform_data/pm33xx.h>
@@ -19,6 +18,7 @@
 #include "iomap.h"
 #include "omap-secure.h"
 #include "omap44xx.h"
+#include "pm-asm-offsets.h"
 #include "prm33xx.h"
 #include "prcm43xx.h"
 
-- 
2.20.1

