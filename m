Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC2111F6D3
	for <lists+linux-omap@lfdr.de>; Sun, 15 Dec 2019 08:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbfLOHtY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Dec 2019 02:49:24 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:27640 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfLOHtY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 15 Dec 2019 02:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576396162;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=LpDKj822zUyMoXRXIUjh14hwRFU++ehi8QyZ3hnuTeM=;
        b=iLO1ZWXBJ+7uX7gEI7zFf0aBf3+FrmdAggJ4tFbf2ZO+A4vgKzzQTtZHjrvZSPNJHb
        cTOKuWydC7bqNtnYllIwzH4+pN2iRoYM6d5ichTNlK412Ig7Dhv015uikmiHVnGxlvgJ
        gbaw5PxuFaZ+bGVPmcmHDSDG3306jhYqE6oD5GlQbGJe0etP2AM59daU0Ap2bNIwoXZ5
        NHmlJ3HDIjfj7KwGVsFVyXC5t4o4kbVqeY4vhcN6oiekJ/eH42ytzIbvwbdQbYpnMPBb
        Zd1tElSHJ/07uE4BVp/12vbTOEwv8xCdc58eGriByIDkhBGVwhhhn6HRVOnetphKEXA/
        Utaw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7Nk1c1UM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.0.7 DYNA|AUTH)
        with ESMTPSA id i03ca8vBF7n2D4c
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 15 Dec 2019 08:49:02 +0100 (CET)
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
Subject: [PATCH v3] ARM: bcm: Add missing sentinel to bcm2711_compat[]
Date:   Sun, 15 Dec 2019 08:49:02 +0100
Message-Id: <b8f2060dacd4c4f27e0e1791cb12462ce740927d.1576396141.git.hns@goldelico.com>
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

