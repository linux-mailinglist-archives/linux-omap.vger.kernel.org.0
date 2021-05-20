Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0D838B6F2
	for <lists+linux-omap@lfdr.de>; Thu, 20 May 2021 21:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237355AbhETTP5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 May 2021 15:15:57 -0400
Received: from smtp-34-i2.italiaonline.it ([213.209.12.34]:53932 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237292AbhETTPv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 May 2021 15:15:51 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([82.60.150.250])
        by smtp-34.iol.local with ESMTPA
        id jo6clK7DY5WrZjo6olTD8k; Thu, 20 May 2021 21:13:27 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621538007; bh=3Paw2xB98b+SDuV2alDurkaGEspLbA4rwbMXsFizNMM=;
        h=From;
        b=G2iS9HJO6Ysq4n5NwXUz0P0CG3jT+RshkULeAq+fxD31UfE/cFFy80I46QyrXuDGg
         605NZzMxDkDHrT31BU36vhTg67GNpuKTohnXLyWmUnnZUXom7mmtPDwFbeXptCZiwi
         HrnC7xvzTcIDMKZ4QVaHJj0/zZe+Hox1QvwOitvHpKtB9MIKDhqodRyq1OscRWYNuJ
         ZcDgcQJdRDregvi9wZU3HXv5G+lbbO99pdUgfQmp7TThpuUppfvQSF6yBYlBa4CG5h
         37ZPzgIrYJHnKaxBzvDTiA/8ciyID7NRuf8jLkrYlTh3QD83/W2xoJ8oIwwLOHc8u3
         Wn5hHicbn0leg==
X-CNFS-Analysis: v=2.4 cv=W4/96Tak c=1 sm=1 tr=0 ts=60a6b4d7 cx=a_exe
 a=QSJ1svMVA5tvcuOEAX2Bgw==:117 a=QSJ1svMVA5tvcuOEAX2Bgw==:17 a=2KMo9-giAAAA:8
 a=4mKMOZvguhLedlVR2KsA:9 a=2pGyGSWy5nf2n_rBi4rp:22 a=UeCTMeHK7YUBiLmz_SX7:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh@kernel.org>, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dario Binacchi <dariobin@libero.it>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v6 3/5] ARM: dts: am33xx-clocks: add spread spectrum support
Date:   Thu, 20 May 2021 21:13:03 +0200
Message-Id: <20210520191306.21711-4-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210520191306.21711-1-dariobin@libero.it>
References: <20210520191306.21711-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfCKKQ3/eQ89KdiBEt5W6BtCqUtO4ajIEXh1sso9w5esB447P6nUuZkK/dzWp3Yq1LqBYvx+cONwhGMQPUw4Xk6sKcifXuDGkZqu1T39bHEwOZ/5W0tkW
 om7buNCEeeVqYKYs7ooGDV/L4Gw0CP+rBQH1guOAFp6OuD1YQIPsHDwHhMDXoEdzASdJNztx7kXGSaKlinhTbSTcgLyNA+FsfdUqLzpHDzSfJqOxOZg3mBjc
 6jTVejzK/nHoqPV8MXY/Gwi1pMpXta/DXIbzcxoIldivpx8Mv0Wjt8LF1qAl13BHBA7D0TEpB6rYPOyqz2K5EQEDbAFLAh/kTZdU76RDsXFtHjNu1a68kdWR
 HfNuz8NfMDyrLwpTeNmGj8yEQcEJkpqkaYHmr2xuTyTSh4av8UcFhEc0x48vG3j5tHKFX06LfzH9/5SIUmp4oQzu2XRHOvXk+hIGBrUnwGUJ2eupMdsjJNQo
 BoyMe9pbHh42V5Rf/OSgOQjdp8mbN6ig513RB1nAQfmah3XS6SIsJqO1W3NFkJ53nw2XC0Dhkqenzd9HygB3R4qUcH/03E3i5BaktsYFCewDfVTHj9ptWNeK
 2QU=
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Registers for adjusting the spread spectrum clocking (SSC) have been
added. As reported by the TI spruh73x RM, SSC is supported only for LCD
and MPU PLLs, but the CM_SSC_DELTAMSTEP_DPLL_XXX and
CM_SSC_MODFREQDIV_DPLL_XXX registers, as well as the enable field in the
CM_CLKMODE_DPLL_XXX registers are mapped for all PLLs (CORE, MPU, DDR,
PER, DISP).

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Acked-by: Tony Lindgren <tony@atomide.com>

---

(no changes since v4)

Changes in v4:
- Add SSC registers for CORE, DDR and PER PLLs.
- Update commit message.

Changes in v3:
- Add Tony Lindgren acked tag.

Changes in v2:
- Remove SSC registers from dpll_core_ck@490 node (SSC is not supported)
- Add SSC registers to dpll_mpu_ck@488 node.

 arch/arm/boot/dts/am33xx-clocks.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-clocks.dtsi b/arch/arm/boot/dts/am33xx-clocks.dtsi
index dced92a8970e..b7b7106f2dee 100644
--- a/arch/arm/boot/dts/am33xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am33xx-clocks.dtsi
@@ -164,7 +164,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-core-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x0490>, <0x045c>, <0x0468>;
+		reg = <0x0490>, <0x045c>, <0x0468>, <0x0460>, <0x0464>;
 	};
 
 	dpll_core_x2_ck: dpll_core_x2_ck {
@@ -204,7 +204,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x0488>, <0x0420>, <0x042c>;
+		reg = <0x0488>, <0x0420>, <0x042c>, <0x0424>, <0x0428>;
 	};
 
 	dpll_mpu_m2_ck: dpll_mpu_m2_ck@4a8 {
@@ -220,7 +220,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-no-gate-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x0494>, <0x0434>, <0x0440>;
+		reg = <0x0494>, <0x0434>, <0x0440>, <0x0438>, <0x043c>;
 	};
 
 	dpll_ddr_m2_ck: dpll_ddr_m2_ck@4a0 {
@@ -244,7 +244,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-no-gate-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x0498>, <0x0448>, <0x0454>;
+		reg = <0x0498>, <0x0448>, <0x0454>, <0x044c>, <0x0450>;
 	};
 
 	dpll_disp_m2_ck: dpll_disp_m2_ck@4a4 {
@@ -261,7 +261,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-no-gate-j-type-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x048c>, <0x0470>, <0x049c>;
+		reg = <0x048c>, <0x0470>, <0x049c>, <0x0474>, <0x0478>;
 	};
 
 	dpll_per_m2_ck: dpll_per_m2_ck@4ac {
-- 
2.17.1

