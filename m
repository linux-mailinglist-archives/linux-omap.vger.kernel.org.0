Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C988F04F
	for <lists+linux-omap@lfdr.de>; Tue, 30 Apr 2019 08:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbfD3GIy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Apr 2019 02:08:54 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56208 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbfD3GIy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Apr 2019 02:08:54 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3U68lEM082009;
        Tue, 30 Apr 2019 01:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556604527;
        bh=0M6lmMeJhzkU5LkeOUDGBKw3p7Z/SmATqnBWzbczRYU=;
        h=From:To:CC:Subject:Date;
        b=gtwmZLRyHDje9QfMHsnlB9wYrdnuA3gNOtVC1grL7ismRfVDVKlYMgpJdte4AHMyU
         MnLzAdHNVH5oV5l0pT2ZyUtEHYsEJJbZaOhsnnCgSYadMkvkoj6UH1ScJdCrk5bekV
         HbJFfFitgSA3W74xTwSTWOtDISZvMdUoBWN5ONgo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3U68lom099365
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 01:08:47 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 01:08:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 01:08:47 -0500
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3U68iK1119094;
        Tue, 30 Apr 2019 01:08:45 -0500
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
CC:     <mark.rutland@arm.com>, <robh+dt@kernel.org>, <tony@atomide.com>,
        <bcousson@baylibre.com>, <faiz_abbas@ti.com>
Subject: [PATCH] ARM: dts: dra76x: Update MMC2_HS200_MANUAL1 iodelay values
Date:   Tue, 30 Apr 2019 11:38:56 +0530
Message-ID: <20190430060856.18445-1-faiz_abbas@ti.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Update the MMC2_HS200_MANUAL1 iodelay values to match with the latest
dra76x data manual[1].

Also this particular pinctrl-array is using spaces instead of tabs for
spacing between the values and the comments. Fix this as well.

[1] http://www.ti.com/lit/ds/symlink/dra76p.pdf

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
---

Tested on dra76x-evm and am574x-idk.

 arch/arm/boot/dts/dra76x-mmc-iodelay.dtsi | 40 +++++++++++------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/dra76x-mmc-iodelay.dtsi b/arch/arm/boot/dts/dra76x-mmc-iodelay.dtsi
index baba7b00eca7..fdca48186916 100644
--- a/arch/arm/boot/dts/dra76x-mmc-iodelay.dtsi
+++ b/arch/arm/boot/dts/dra76x-mmc-iodelay.dtsi
@@ -22,7 +22,7 @@
  *
  * Datamanual Revisions:
  *
- * DRA76x Silicon Revision 1.0: SPRS993A, Revised July 2017
+ * DRA76x Silicon Revision 1.0: SPRS993E, Revised December 2018
  *
  */
 
@@ -169,25 +169,25 @@
 	/* Corresponds to MMC2_HS200_MANUAL1 in datamanual */
 	mmc2_iodelay_hs200_conf: mmc2_iodelay_hs200_conf {
 		pinctrl-pin-array = <
-			0x190 A_DELAY_PS(384) G_DELAY_PS(0)       /* CFG_GPMC_A19_OEN */
-			0x194 A_DELAY_PS(0) G_DELAY_PS(174)       /* CFG_GPMC_A19_OUT */
-			0x1a8 A_DELAY_PS(410) G_DELAY_PS(0)       /* CFG_GPMC_A20_OEN */
-			0x1ac A_DELAY_PS(85) G_DELAY_PS(0)        /* CFG_GPMC_A20_OUT */
-			0x1b4 A_DELAY_PS(468) G_DELAY_PS(0)       /* CFG_GPMC_A21_OEN */
-			0x1b8 A_DELAY_PS(139) G_DELAY_PS(0)       /* CFG_GPMC_A21_OUT */
-			0x1c0 A_DELAY_PS(676) G_DELAY_PS(0)       /* CFG_GPMC_A22_OEN */
-			0x1c4 A_DELAY_PS(69) G_DELAY_PS(0)        /* CFG_GPMC_A22_OUT */
-			0x1d0 A_DELAY_PS(1062) G_DELAY_PS(154)	  /* CFG_GPMC_A23_OUT */
-			0x1d8 A_DELAY_PS(640) G_DELAY_PS(0)       /* CFG_GPMC_A24_OEN */
-			0x1dc A_DELAY_PS(0) G_DELAY_PS(0)         /* CFG_GPMC_A24_OUT */
-			0x1e4 A_DELAY_PS(356) G_DELAY_PS(0)       /* CFG_GPMC_A25_OEN */
-			0x1e8 A_DELAY_PS(0) G_DELAY_PS(0)         /* CFG_GPMC_A25_OUT */
-			0x1f0 A_DELAY_PS(579) G_DELAY_PS(0)       /* CFG_GPMC_A26_OEN */
-			0x1f4 A_DELAY_PS(0) G_DELAY_PS(0)         /* CFG_GPMC_A26_OUT */
-			0x1fc A_DELAY_PS(435) G_DELAY_PS(0)       /* CFG_GPMC_A27_OEN */
-			0x200 A_DELAY_PS(36) G_DELAY_PS(0)        /* CFG_GPMC_A27_OUT */
-			0x364 A_DELAY_PS(759) G_DELAY_PS(0)       /* CFG_GPMC_CS1_OEN */
-			0x368 A_DELAY_PS(72) G_DELAY_PS(0)        /* CFG_GPMC_CS1_OUT */
+			0x190 A_DELAY_PS(384) G_DELAY_PS(0)	/* CFG_GPMC_A19_OEN */
+			0x194 A_DELAY_PS(350) G_DELAY_PS(174)	/* CFG_GPMC_A19_OUT */
+			0x1a8 A_DELAY_PS(410) G_DELAY_PS(0)	/* CFG_GPMC_A20_OEN */
+			0x1ac A_DELAY_PS(335) G_DELAY_PS(0)	/* CFG_GPMC_A20_OUT */
+			0x1b4 A_DELAY_PS(468) G_DELAY_PS(0)	/* CFG_GPMC_A21_OEN */
+			0x1b8 A_DELAY_PS(339) G_DELAY_PS(0)	/* CFG_GPMC_A21_OUT */
+			0x1c0 A_DELAY_PS(676) G_DELAY_PS(0)	/* CFG_GPMC_A22_OEN */
+			0x1c4 A_DELAY_PS(219) G_DELAY_PS(0)	/* CFG_GPMC_A22_OUT */
+			0x1d0 A_DELAY_PS(1062) G_DELAY_PS(154)	/* CFG_GPMC_A23_OUT */
+			0x1d8 A_DELAY_PS(640) G_DELAY_PS(0)	/* CFG_GPMC_A24_OEN */
+			0x1dc A_DELAY_PS(150) G_DELAY_PS(0)	/* CFG_GPMC_A24_OUT */
+			0x1e4 A_DELAY_PS(356) G_DELAY_PS(0)	/* CFG_GPMC_A25_OEN */
+			0x1e8 A_DELAY_PS(150) G_DELAY_PS(0)	/* CFG_GPMC_A25_OUT */
+			0x1f0 A_DELAY_PS(579) G_DELAY_PS(0)	/* CFG_GPMC_A26_OEN */
+			0x1f4 A_DELAY_PS(200) G_DELAY_PS(0)	/* CFG_GPMC_A26_OUT */
+			0x1fc A_DELAY_PS(435) G_DELAY_PS(0)	/* CFG_GPMC_A27_OEN */
+			0x200 A_DELAY_PS(236) G_DELAY_PS(0)	/* CFG_GPMC_A27_OUT */
+			0x364 A_DELAY_PS(759) G_DELAY_PS(0)	/* CFG_GPMC_CS1_OEN */
+			0x368 A_DELAY_PS(372) G_DELAY_PS(0)	/* CFG_GPMC_CS1_OUT */
 	      >;
 	};
 
-- 
2.19.2

