Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3C411F489
	for <lists+linux-omap@lfdr.de>; Sat, 14 Dec 2019 23:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbfLNWEt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Dec 2019 17:04:49 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:8942 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727487AbfLNWEt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 14 Dec 2019 17:04:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576361087;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=LpDKj822zUyMoXRXIUjh14hwRFU++ehi8QyZ3hnuTeM=;
        b=o0P9bskBDGdMd5VTy1bXG+PG0rxRVwOXWpsg2FoO1KHInvhur2FZdxqFIDwysauxHu
        Mty8ytkOpInYDAXfyAMlwXPJa/kxtBZjZwS2ks+t7qgAWeXvJzx6hYTHUjFahg71dAhI
        5BXUBGUveSC1u0rHRMWPybYbq+aRppbAuVqgAcT11GPH4K7mOSn9snfyoR4M5s/aIASy
        JPHIIWORz25GcAc1IEb6mOF1CNiBHLEPj0NONSs2vV2Lc2YkuewQHnsAFhg7zLZQqBnu
        s5ojNrUv+jYwYLvyNYuo8HC4zyU6ETSCVyjChswXRgqB8Z+AUOMxvdPCJEL3z9PwZf2G
        lqHQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2AyOEF/Q6ay"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.0.7 DYNA|AUTH)
        with ESMTPSA id i03ca8vBEM4SCNB
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 14 Dec 2019 23:04:28 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Stefan Wahren <wahrenst@gmx.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     linux@armlinux.org.uk,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rpi-kernel@lists.infradead.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2] ARM: bcm: Fix support for BCM2711 SoC which breaks other ARM platforms
Date:   Sat, 14 Dec 2019 23:04:27 +0100
Message-Id: <0d7bef0622d69bd4f1129afe26b358669e639ae8.1576361067.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

commit 781fa0a95424 ("ARM: bcm: Add support for BCM2711 SoC")

breaks boot of many other platforms (e.g. OMAP or i.MX6) if
CONFIG_ARCH_BCM2835 is enabled in addition to some multiplatform
config (e.g. omap2plus_defconfig). The symptom is that the OMAP
based board does not show any activity beyond "Starting Kernel ..."
even with earlycon.

Reverting the mentioned commit makes it work again.

The real fix is to add the missing NULL sentinel to the
bcm2711_compat[] variable-length array.

Fixes: 781fa0a95424 ("ARM: bcm: Add support for BCM2711 SoC")
Acked-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/mach-bcm/bcm2711.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-bcm/bcm2711.c b/arch/arm/mach-bcm/bcm2711.c
index dbe296798647..fa0300d8c79d 100644
--- a/arch/arm/mach-bcm/bcm2711.c
+++ b/arch/arm/mach-bcm/bcm2711.c
@@ -13,6 +13,7 @@ static const char * const bcm2711_compat[] = {
 #ifdef CONFIG_ARCH_MULTI_V7
 	"brcm,bcm2711",
 #endif
+	NULL
 };
 
 DT_MACHINE_START(BCM2711, "BCM2711")
-- 
2.23.0

