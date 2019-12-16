Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49521120707
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2019 14:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbfLPNWB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Dec 2019 08:22:01 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:38087 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbfLPNWB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Dec 2019 08:22:01 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MGhi0-1iT9Ch3e2k-00DrdU; Mon, 16 Dec 2019 14:21:34 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Tony Lindgren <tony@atomide.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <santosh.shilimkar@oracle.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap2plus: select RESET_CONTROLLER
Date:   Mon, 16 Dec 2019 14:21:26 +0100
Message-Id: <20191216132132.3330811-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Wm5RTpZAgx5UpDGIoWv7v4EV7gdfDKQbLqHRuQjOl+FrgU30CXT
 axQk9AW0xPd7KS/ckntU087e9UeSzC5puiBOhiDC2jXNCLtwnF7z+3SGrPJDn5SrDkCBSfJ
 uaaXALhckSIy8qrY87GXPTv53Ehouq3yWA+xHHc9uk4WUVKG5qBHqn4arqcPnS1mAJ1LS67
 1beLDQLKqRcI96Xz4pJ3Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Hrhxfp/VpYg=:3otAal51aHHrkXXep6RH3D
 7F0TWQqaWvIE6pZWycdW0E94YlOXWPMFP6aMmQvxiv1V+yLiY2VWmBia32ctSmLwaqXqDfRon
 pvhuknI9ImJtknZepqcWir9QoV61iyewoOYhWlh/TAb533Du5IpXnN+EpnZ/RLRbSfRNswjnv
 SVeX3cGJZZUFTaQldEZ7dSukka3ZgyFdVELyWO9lbJTbNY2usV4AEZLs+cU7vEnkWX5SmKpV7
 Wjh2GIYbkYJZgJXnHPLFS3IBzczQr9AR7supnUl1r5+QIx4P8QiPkyBgQL+ulfOG/TwHu+UT+
 TAvzHq/vmlFxQVJbr+gPGUWz+bfZUTcJgySg0B6PYMSWsckQ3EwtzyfKq9rS1Tf4TEN41PbOd
 9MTGtmwxzpbsNOxYJXzm/3R/GWgSSj2Ws6No7WFdeSyG+o+qWPQrJvIBOjUPmQt/N5VgdSbsH
 9/UmgMUJlFPZRVfQwd2ksC34toKEjbL6Pj+pnrzrQQeAHJKFfnJ/en/nmx4ePAJNxDOaSi34t
 n9k8kisZWjgEoL9UkqlPzN9PPKioK6KVWt8DPQVQo49jsJDIgUyfho/hWLQwOb2Oj2yiHpLPj
 hs6J9TPJv+vc09ftQI2x2ar3Qo9Sf4K+X7gHcpSaSVmMQt+w1p18DEKsaKKik03Cm1AZx930O
 FQsf7nrtKzqa57ux1XvcYb1qXkP4E5XKcnNm9TnE+KWVdu+xSAZVML3jAtPt2gH0pOZN3Vp0I
 ZqcPfdT7utDoewzkX7bHJx7AgSFSny7N+OkdsgTiQwjJZnrbbdslnq5Z/yCMn7sIHsc7ZSxEg
 eVaUCaX1Ulxe54UoREM+4uNOjYLy5HHCdVyPTpcff+DIoRgazBOxWn/vJICZcGIzMtY64yXYh
 HWZNCOLHk4g6rke0sltg==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With the new omap_prm driver added unconditionally, omap2 builds
fail when the reset controller subsystem is disabled:

drivers/soc/ti/omap_prm.o: In function `omap_prm_probe':
omap_prm.c:(.text+0x2d4): undefined reference to `devm_reset_controller_register'

Fixes: 3e99cb214f03 ("soc: ti: add initial PRM driver with reset control support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap2/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index fe0f82efb1de..639bc38567a7 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -95,6 +95,7 @@ config ARCH_OMAP2PLUS
 	bool
 	select ARCH_HAS_BANDGAP
 	select ARCH_HAS_HOLES_MEMORYMODEL
+	select ARCH_HAS_RESET_CONTROLLER
 	select ARCH_OMAP
 	select CLKSRC_MMIO
 	select GENERIC_IRQ_CHIP
@@ -105,11 +106,11 @@ config ARCH_OMAP2PLUS
 	select OMAP_DM_TIMER
 	select OMAP_GPMC
 	select PINCTRL
+	select RESET_CONTROLLER
 	select SOC_BUS
 	select TI_SYSC
 	select OMAP_IRQCHIP
 	select CLKSRC_TI_32K
-	select ARCH_HAS_RESET_CONTROLLER
 	help
 	  Systems based on OMAP2, OMAP3, OMAP4 or OMAP5
 
-- 
2.20.0

