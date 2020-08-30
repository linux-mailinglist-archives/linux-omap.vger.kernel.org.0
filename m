Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF109257033
	for <lists+linux-omap@lfdr.de>; Sun, 30 Aug 2020 21:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgH3Tkh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Aug 2020 15:40:37 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:43495 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgH3Tkd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Aug 2020 15:40:33 -0400
Received: from buildfff.adridolf.com ([188.192.134.246]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mj831-1kpOyj3AEX-00fCme; Sun, 30 Aug 2020 21:40:24 +0200
From:   Adrian Schmutzler <freifunk@adrianschmutzler.de>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: omap: replace status value "ok" by "okay"
Date:   Sun, 30 Aug 2020 21:38:59 +0200
Message-Id: <20200830193859.40594-1-freifunk@adrianschmutzler.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:30qXm2b36lRh0teRoZ9Y/rVnSFfz6iThWxFFDpytJLlTp2U3ofL
 uk3gocdd1hKyFuOkg9IA+FCHOVdk2YqbCPCfQBr68AlmEIZhIPGlSrZ5Xg95D7RduvBuNEq
 7gewiT2xk6DLHiATc7oYMM5Ug/K17LhUHSt258La/luN55qTVODhYHroIZKrWoOgPIdpif6
 dFrKicKL0ISZvSk6TdxiQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vGWlrZwgAzk=:WuENrlqYUjrSTuy5Lr4rP+
 h3k44HFWYJOS0jqf+x48wuF63BzOOCel0z+JcgSb3q87Cc16khNnKn5TsTKgcJxqykEbzmkWQ
 VuHbyKBIp9mo9iEzuk+NktTYWsxueaen5iiY7O5b0PO8nxuXJJtp4R2BGlrOgJV9ff7S2pdmP
 u6KzBTdt4t2Tjpq9z9kfZ6EqIBXj30Sh/FihshpK6kUq/hjxU2NM/Kba0/mm72nZGxLM6grxQ
 mfBj+TNiOlt+/cjWAw20E8vSuYBLdyYHgJlzksL67+MvCuQ7WHbQ2Uc+LqH293MtuPDDfVOxD
 ccm24U4wtMpsRQ7LNW/AYxjIo6pyImpgNfRjBXaC4QE3FJ8d6S0VJZsWwYcICO5x2v1pyhLYB
 mJu2bU+Nsho5NAFxFoxJUR+EdfnpASi3UC80srMjYJdQYympO9KC8qXuin40pDOm38pCHuO7E
 /YhbAgV4EfotG/yir0R3PQbh7r741zWwfl15jU0XGzmlK1apE4fFo74ZY5FmLKBO/gPSbxhVR
 RVAVk8wz/SSoW3ZUJeqsnACpcq291AEL0sQAASStEnnnsel1JQtGVv0OBfOZCbm1/7B9bDqhM
 63WlawVzsj6PGDTebNtmAdmDtbvMUi1gGenOX5k92jdEySYnIPmIYBrPxnWHmCp/qAU7POVNI
 JdBwr61hm9/UssgKWasCUW/wayfnJU66sgNx2IrRZILIk34VZQ80fDn6TSjp+i/MTGk8AkuCJ
 QQwxJ5lxr9yoskzGt9qYYjCMFP383AZnbrZFeo2+iddHjrn3X8ZkkQVuA0FMpks6VF5UUyVCy
 xV55pSqZi5B1rGnKzghkDSLGUK027x0D3K2SjsaKLO+PaymvHpWqYWNvaJS2Nl33gShbSa5WQ
 KwUy1s9P3Bphjj1g/pxw==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

While the DT parser recognizes "ok" as a valid value for the
"status" property, it is actually mentioned nowhere. Use the
proper value "okay" instead, as done in the majority of files
already.

Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>
---
 arch/arm/boot/dts/am3517-evm-ui.dtsi                 | 4 ++--
 arch/arm/boot/dts/am3517-evm.dts                     | 2 +-
 arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi      | 2 +-
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi     | 2 +-
 arch/arm/boot/dts/omap3-beagle-xm.dts                | 4 ++--
 arch/arm/boot/dts/omap3-beagle.dts                   | 6 +++---
 arch/arm/boot/dts/omap3-cm-t3517.dts                 | 2 +-
 arch/arm/boot/dts/omap3-cm-t3530.dts                 | 2 +-
 arch/arm/boot/dts/omap3-cm-t3730.dts                 | 2 +-
 arch/arm/boot/dts/omap3-cm-t3x.dtsi                  | 4 ++--
 arch/arm/boot/dts/omap3-devkit8000-common.dtsi       | 4 ++--
 arch/arm/boot/dts/omap3-gta04.dtsi                   | 8 ++++----
 arch/arm/boot/dts/omap3-ha-lcd.dts                   | 2 +-
 arch/arm/boot/dts/omap3-igep0020-common.dtsi         | 2 +-
 arch/arm/boot/dts/omap3-n900.dts                     | 6 +++---
 arch/arm/boot/dts/omap3-n950.dts                     | 4 ++--
 arch/arm/boot/dts/omap3-overo-common-dvi.dtsi        | 2 +-
 arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi      | 2 +-
 arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi      | 2 +-
 arch/arm/boot/dts/omap3-pandora-common.dtsi          | 4 ++--
 arch/arm/boot/dts/omap3-panel-sharp-ls037v7dw01.dtsi | 2 +-
 arch/arm/boot/dts/omap3-thunder.dts                  | 2 +-
 arch/arm/boot/dts/omap34xx.dtsi                      | 2 +-
 arch/arm/boot/dts/omap36xx.dtsi                      | 2 +-
 arch/arm/boot/dts/omap4-duovero-parlor.dts           | 4 ++--
 arch/arm/boot/dts/omap4-panda-common.dtsi            | 6 +++---
 arch/arm/boot/dts/omap4-sdp.dts                      | 8 ++++----
 arch/arm/boot/dts/omap5-board-common.dtsi            | 4 ++--
 arch/arm/boot/dts/omap5-cm-t54.dts                   | 6 +++---
 29 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/arch/arm/boot/dts/am3517-evm-ui.dtsi b/arch/arm/boot/dts/am3517-evm-ui.dtsi
index 250c40da2535..7d8f32bf70db 100644
--- a/arch/arm/boot/dts/am3517-evm-ui.dtsi
+++ b/arch/arm/boot/dts/am3517-evm-ui.dtsi
@@ -183,14 +183,14 @@
 };
 
 &mcbsp1 {
-	status = "ok";
+	status = "okay";
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcbsp1_pins>;
 };
 
 &mcbsp2 {
-	status = "ok";
+	status = "okay";
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcbsp2_pins>;
diff --git a/arch/arm/boot/dts/am3517-evm.dts b/arch/arm/boot/dts/am3517-evm.dts
index 04f20e7680b1..0d2fac98ce7d 100644
--- a/arch/arm/boot/dts/am3517-evm.dts
+++ b/arch/arm/boot/dts/am3517-evm.dts
@@ -176,7 +176,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
diff --git a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
index 100396f6c2fe..133e2ab5cda5 100644
--- a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
@@ -77,7 +77,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 	vdds_dsi-supply = <&vpll2>;
 	vdda_video-supply = <&video_reg>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
index 381f0e82bb70..39539724e236 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
@@ -113,7 +113,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 	vdds_dsi-supply = <&vpll2>;
 	vdda_video-supply = <&vpll2>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/omap3-beagle-xm.dts b/arch/arm/boot/dts/omap3-beagle-xm.dts
index 05077f3c75cd..252507cf300b 100644
--- a/arch/arm/boot/dts/omap3-beagle-xm.dts
+++ b/arch/arm/boot/dts/omap3-beagle-xm.dts
@@ -389,7 +389,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <
@@ -406,7 +406,7 @@
 };
 
 &venc {
-	status = "ok";
+	status = "okay";
 
 	vdda-supply = <&vdac>;
 
diff --git a/arch/arm/boot/dts/omap3-beagle.dts b/arch/arm/boot/dts/omap3-beagle.dts
index 79bc710c05fc..f9f34b8458e9 100644
--- a/arch/arm/boot/dts/omap3-beagle.dts
+++ b/arch/arm/boot/dts/omap3-beagle.dts
@@ -386,7 +386,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
@@ -400,7 +400,7 @@
 };
 
 &venc {
-	status = "ok";
+	status = "okay";
 
 	vdda-supply = <&vdac>;
 
@@ -413,7 +413,7 @@
 };
 
 &gpmc {
-	status = "ok";
+	status = "okay";
 	ranges = <0 0 0x30000000 0x1000000>;	/* CS0 space, 16MB */
 
 	/* Chip select 0 */
diff --git a/arch/arm/boot/dts/omap3-cm-t3517.dts b/arch/arm/boot/dts/omap3-cm-t3517.dts
index 632f52efdf98..3b8349094baa 100644
--- a/arch/arm/boot/dts/omap3-cm-t3517.dts
+++ b/arch/arm/boot/dts/omap3-cm-t3517.dts
@@ -147,7 +147,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <
diff --git a/arch/arm/boot/dts/omap3-cm-t3530.dts b/arch/arm/boot/dts/omap3-cm-t3530.dts
index 32dbaeaed147..bc545ee23e71 100644
--- a/arch/arm/boot/dts/omap3-cm-t3530.dts
+++ b/arch/arm/boot/dts/omap3-cm-t3530.dts
@@ -49,7 +49,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <
diff --git a/arch/arm/boot/dts/omap3-cm-t3730.dts b/arch/arm/boot/dts/omap3-cm-t3730.dts
index 683819bf0915..48e48b0c8190 100644
--- a/arch/arm/boot/dts/omap3-cm-t3730.dts
+++ b/arch/arm/boot/dts/omap3-cm-t3730.dts
@@ -87,7 +87,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <
diff --git a/arch/arm/boot/dts/omap3-cm-t3x.dtsi b/arch/arm/boot/dts/omap3-cm-t3x.dtsi
index cdb632df152a..e61b8a2bfb7d 100644
--- a/arch/arm/boot/dts/omap3-cm-t3x.dtsi
+++ b/arch/arm/boot/dts/omap3-cm-t3x.dtsi
@@ -246,7 +246,7 @@
 };
 
 &venc {
-	status = "ok";
+	status = "okay";
 
 	port {
 		venc_out: endpoint {
@@ -257,7 +257,7 @@
 };
 
 &mcbsp2 {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcbsp2_pins>;
diff --git a/arch/arm/boot/dts/omap3-devkit8000-common.dtsi b/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
index ac3d996cec5c..2c19d6e255bd 100644
--- a/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
+++ b/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
@@ -337,7 +337,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
@@ -361,7 +361,7 @@
 };
 
 &venc {
-	status = "ok";
+	status = "okay";
 
 	vdda-supply = <&vdac>;
 
diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
index ecc45862b4f3..c8745bc800f7 100644
--- a/arch/arm/boot/dts/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/omap3-gta04.dtsi
@@ -822,27 +822,27 @@
 };
 
 &mcbsp1 { /* FM Transceiver PCM */
-	status = "ok";
+	status = "okay";
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcbsp1_pins>;
 };
 
 &mcbsp2 { /* TPS65950 I2S */
-	status = "ok";
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcbsp2_pins>;
 };
 
 &mcbsp3 { /* Bluetooth PCM */
-	status = "ok";
+	status = "okay";
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcbsp3_pins>;
 };
 
 &mcbsp4 { /* GSM voice PCM */
-	status = "ok";
+	status = "okay";
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcbsp4_pins>;
diff --git a/arch/arm/boot/dts/omap3-ha-lcd.dts b/arch/arm/boot/dts/omap3-ha-lcd.dts
index b3f7f9966c3c..643283f0c3db 100644
--- a/arch/arm/boot/dts/omap3-ha-lcd.dts
+++ b/arch/arm/boot/dts/omap3-ha-lcd.dts
@@ -100,7 +100,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
diff --git a/arch/arm/boot/dts/omap3-igep0020-common.dtsi b/arch/arm/boot/dts/omap3-igep0020-common.dtsi
index 91caa50b74c4..af8aa5f0feb7 100644
--- a/arch/arm/boot/dts/omap3-igep0020-common.dtsi
+++ b/arch/arm/boot/dts/omap3-igep0020-common.dtsi
@@ -245,7 +245,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	port {
 		dpi_out: endpoint {
diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index bc24e3dc7cda..32335d4ce478 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -1083,7 +1083,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_sdi_pins>;
@@ -1106,7 +1106,7 @@
 };
 
 &venc {
-	status = "ok";
+	status = "okay";
 
 	vdda-supply = <&vdac>;
 
@@ -1119,7 +1119,7 @@
 };
 
 &mcbsp2 {
-	status = "ok";
+	status = "okay";
 };
 
 &ssi_port1 {
diff --git a/arch/arm/boot/dts/omap3-n950.dts b/arch/arm/boot/dts/omap3-n950.dts
index 31d47a1fad84..6a260998a837 100644
--- a/arch/arm/boot/dts/omap3-n950.dts
+++ b/arch/arm/boot/dts/omap3-n950.dts
@@ -205,13 +205,13 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	vdda_video-supply = <&vdac>;
 };
 
 &dsi {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dsi_pins>;
diff --git a/arch/arm/boot/dts/omap3-overo-common-dvi.dtsi b/arch/arm/boot/dts/omap3-overo-common-dvi.dtsi
index c9e62e414abb..339a51fa4119 100644
--- a/arch/arm/boot/dts/omap3-overo-common-dvi.dtsi
+++ b/arch/arm/boot/dts/omap3-overo-common-dvi.dtsi
@@ -48,7 +48,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
diff --git a/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi b/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi
index 185ce53de0ec..1d6e88f99eb3 100644
--- a/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi
+++ b/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi
@@ -76,7 +76,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
diff --git a/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi b/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi
index 7fe0f9148232..7e30f9d45790 100644
--- a/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi
+++ b/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi
@@ -75,7 +75,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
diff --git a/arch/arm/boot/dts/omap3-pandora-common.dtsi b/arch/arm/boot/dts/omap3-pandora-common.dtsi
index 150d5be42d27..37608af6c07f 100644
--- a/arch/arm/boot/dts/omap3-pandora-common.dtsi
+++ b/arch/arm/boot/dts/omap3-pandora-common.dtsi
@@ -702,7 +702,7 @@
 };
 
 &venc {
-	status = "ok";
+	status = "okay";
 
 	vdda-supply = <&vdac>;
 
@@ -718,7 +718,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = < &dss_dpi_pins >;
 
-	status = "ok";
+	status = "okay";
 	vdds_dsi-supply = <&vpll2>;
 
 	port {
diff --git a/arch/arm/boot/dts/omap3-panel-sharp-ls037v7dw01.dtsi b/arch/arm/boot/dts/omap3-panel-sharp-ls037v7dw01.dtsi
index b8b9fcc41ef1..2dbb687d4df2 100644
--- a/arch/arm/boot/dts/omap3-panel-sharp-ls037v7dw01.dtsi
+++ b/arch/arm/boot/dts/omap3-panel-sharp-ls037v7dw01.dtsi
@@ -46,7 +46,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 	port {
 		dpi_out: endpoint {
 			remote-endpoint = <&lcd_in>;
diff --git a/arch/arm/boot/dts/omap3-thunder.dts b/arch/arm/boot/dts/omap3-thunder.dts
index f7930f198ce5..d82cab8e213a 100644
--- a/arch/arm/boot/dts/omap3-thunder.dts
+++ b/arch/arm/boot/dts/omap3-thunder.dts
@@ -64,7 +64,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.dtsi
index 9c3ee4ac8165..fc9753b134a8 100644
--- a/arch/arm/boot/dts/omap34xx.dtsi
+++ b/arch/arm/boot/dts/omap34xx.dtsi
@@ -182,7 +182,7 @@
 };
 
 &ssi {
-	status = "ok";
+	status = "okay";
 
 	clocks = <&ssi_ssr_fck>,
 		 <&ssi_sst_fck>,
diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
index 9c3beefc0fe0..593aad1a54ad 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -234,7 +234,7 @@
 };
 
 &ssi {
-	status = "ok";
+	status = "okay";
 
 	clocks = <&ssi_ssr_fck>,
 		 <&ssi_sst_fck>,
diff --git a/arch/arm/boot/dts/omap4-duovero-parlor.dts b/arch/arm/boot/dts/omap4-duovero-parlor.dts
index 4548d87534e3..b294c22177cb 100644
--- a/arch/arm/boot/dts/omap4-duovero-parlor.dts
+++ b/arch/arm/boot/dts/omap4-duovero-parlor.dts
@@ -171,11 +171,11 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 	vdda-supply = <&vdac>;
 
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
index 3e78caefa2b8..609a8dea946b 100644
--- a/arch/arm/boot/dts/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
@@ -566,7 +566,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	port {
 		dpi_out: endpoint {
@@ -577,12 +577,12 @@
 };
 
 &dsi2 {
-	status = "ok";
+	status = "okay";
 	vdd-supply = <&vcxio>;
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 	vdda-supply = <&vdac>;
 
 	port {
diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-sdp.dts
index 79e7a41ecb7e..5aa84db5e2be 100644
--- a/arch/arm/boot/dts/omap4-sdp.dts
+++ b/arch/arm/boot/dts/omap4-sdp.dts
@@ -648,11 +648,11 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 };
 
 &dsi1 {
-	status = "ok";
+	status = "okay";
 	vdd-supply = <&vcxio>;
 
 	port {
@@ -677,7 +677,7 @@
 };
 
 &dsi2 {
-	status = "ok";
+	status = "okay";
 	vdd-supply = <&vcxio>;
 
 	port {
@@ -702,7 +702,7 @@
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 	vdda-supply = <&vdac>;
 
 	port {
diff --git a/arch/arm/boot/dts/omap5-board-common.dtsi b/arch/arm/boot/dts/omap5-board-common.dtsi
index edf1906016c8..d8f13626cfd1 100644
--- a/arch/arm/boot/dts/omap5-board-common.dtsi
+++ b/arch/arm/boot/dts/omap5-board-common.dtsi
@@ -743,11 +743,11 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 
 	/* vdda-supply populated in board specific dts file */
 
diff --git a/arch/arm/boot/dts/omap5-cm-t54.dts b/arch/arm/boot/dts/omap5-cm-t54.dts
index e78d3718f145..ca759b7b8a58 100644
--- a/arch/arm/boot/dts/omap5-cm-t54.dts
+++ b/arch/arm/boot/dts/omap5-cm-t54.dts
@@ -653,7 +653,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins>;
@@ -677,12 +677,12 @@
 };
 
 &dsi2 {
-	status = "ok";
+	status = "okay";
 	vdd-supply = <&ldo4_reg>;
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 	vdda-supply = <&ldo4_reg>;
 
 	pinctrl-names = "default";
-- 
2.20.1

