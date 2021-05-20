Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0F038B6DC
	for <lists+linux-omap@lfdr.de>; Thu, 20 May 2021 21:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236750AbhETTOy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 May 2021 15:14:54 -0400
Received: from smtp-34.italiaonline.it ([213.209.10.34]:36002 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236863AbhETTOw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 May 2021 15:14:52 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([82.60.150.250])
        by smtp-34.iol.local with ESMTPA
        id jo6clK7DY5WrZjo6plTD8z; Thu, 20 May 2021 21:13:30 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621538010; bh=PPTo8GvjIIsaEKU5B1TIF8N7cm5fuyUf7SEXiLKXv5E=;
        h=From;
        b=NCeFT0a0nEAKInyX/QskClahvicdc/d9j3ukQ15BUUFr/Yg/rsU4jQM3lCdBe1gG4
         79OtmjsmuVOkHjVKtpOIgKU8JZ1SPQrwMPfG/UDNCPcHr+eN9rpSe6kCg34vX0qoMl
         XKCsRNDvWGxYItyWasGTZQ4RAWumDa+dc1wM/aNAbGcTnm4Bame10ApTWtrDDZekEc
         LH2LMusz8PsVTSmLzs54HRThz+aXYsg0ORLEZ6tzTIz9bOOS9cKAq2CRMQ8UUL7G2e
         fBv/4uAIFNt8Wb3hobmUf+Y72Nc3uTiTVjj2bWkDChiuoTe/jXRSlLwFxYi9w8RYkN
         tQru74qiB/Kug==
X-CNFS-Analysis: v=2.4 cv=W4/96Tak c=1 sm=1 tr=0 ts=60a6b4da cx=a_exe
 a=QSJ1svMVA5tvcuOEAX2Bgw==:117 a=QSJ1svMVA5tvcuOEAX2Bgw==:17
 a=2OX5x-OEy5pyK2UBO5QA:9
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
Subject: [PATCH v6 4/5] ARM: dts: am43xx-clocks: add spread spectrum support
Date:   Thu, 20 May 2021 21:13:04 +0200
Message-Id: <20210520191306.21711-5-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210520191306.21711-1-dariobin@libero.it>
References: <20210520191306.21711-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfKFqPfFrm9NguM98g1PGePGjdLAxOgmqBsKdOo6VzMURxaUNiApycFskdgIi/4Y2BJ+RHGvjJZB+UQ0XHjY6hv124Cx++UIh4AMaWVb6odeJysE+Alzt
 lVfVcDuUugjHeNo83ptAt2VbT84lesy3N0AIqawi34ezcteXgeYk2jEdY56G/WLk7QNC4fEZcQ2DeXdmimzlfAWF5GXKseD5EmoyjLiI6jdhlUZqNgFZDUe6
 BgV/hNSspke2GALjWhyl1G0Qogj/c0UIMhKERPD6BWHjyoRcX0xzYQVAjqOGxUWOvPj4p+/MgmEu899VTDXAKYUrKZWpNqBc/ns1Sg56kbj58jpHx1aFA6oE
 UBuT6A4NbMTRQcysUiSfoC3Em26/4o+6OZ9rQneBDdc2yZJzZh4h1YZ2O+dBaXWEyvFU/8KZKnsLkpKhobGmlkXWlmWtbi08T/SCAbdShbk2NELxLf6PX5Zk
 bKOvC3AGwEOnu7A0w9p1S4fJ1SR61axM2aiRK+SN8ZUP0pQewg11CcRoDRaYRcRjdX2DI/RH92NCCzKnxBoMYLvQHoeMkLfMqM4XGSetnFsvNAleYoXt+ORA
 TFM=
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Registers for adjusting the spread spectrum clocking (SSC) have been
added. As reported by the TI spruhl7x RM, SSC is supported only for LCD
and MPU PLLs, but the PRCM_CM_SSC_DELTAMSTEP_DPLL_XXX and
PRCM_CM_SSC_MODFREQDIV_DPLL_XXX registers, as well as the enable field
in the PRCM_CM_CLKMODE_DPLL_XXX registers are mapped for all PLLs (CORE,
MPU, DDR, PER, DISP, EXTDEV).

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

(no changes since v1)

 arch/arm/boot/dts/am43xx-clocks.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/am43xx-clocks.dtsi b/arch/arm/boot/dts/am43xx-clocks.dtsi
index c726cd8dbdf1..314fc5975acb 100644
--- a/arch/arm/boot/dts/am43xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am43xx-clocks.dtsi
@@ -204,7 +204,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-core-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x2d20>, <0x2d24>, <0x2d2c>;
+		reg = <0x2d20>, <0x2d24>, <0x2d2c>, <0x2d48>, <0x2d4c>;
 	};
 
 	dpll_core_x2_ck: dpll_core_x2_ck {
@@ -250,7 +250,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x2d60>, <0x2d64>, <0x2d6c>;
+		reg = <0x2d60>, <0x2d64>, <0x2d6c>, <0x2d88>, <0x2d8c>;
 	};
 
 	dpll_mpu_m2_ck: dpll_mpu_m2_ck@2d70 {
@@ -276,7 +276,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x2da0>, <0x2da4>, <0x2dac>;
+		reg = <0x2da0>, <0x2da4>, <0x2dac>, <0x2dc8>, <0x2dcc>;
 	};
 
 	dpll_ddr_m2_ck: dpll_ddr_m2_ck@2db0 {
@@ -294,7 +294,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x2e20>, <0x2e24>, <0x2e2c>;
+		reg = <0x2e20>, <0x2e24>, <0x2e2c>, <0x2e48>, <0x2e4c>;
 	};
 
 	dpll_disp_m2_ck: dpll_disp_m2_ck@2e30 {
@@ -313,7 +313,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-j-type-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x2de0>, <0x2de4>, <0x2dec>;
+		reg = <0x2de0>, <0x2de4>, <0x2dec>, <0x2e08>, <0x2e0c>;
 	};
 
 	dpll_per_m2_ck: dpll_per_m2_ck@2df0 {
@@ -557,7 +557,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x2e60>, <0x2e64>, <0x2e6c>;
+		reg = <0x2e60>, <0x2e64>, <0x2e6c>, <0x2e88>, <0x2e8c>;
 	};
 
 	dpll_extdev_m2_ck: dpll_extdev_m2_ck@2e70 {
-- 
2.17.1

