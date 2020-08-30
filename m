Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17FE7257048
	for <lists+linux-omap@lfdr.de>; Sun, 30 Aug 2020 21:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgH3TuG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Aug 2020 15:50:06 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:33371 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgH3TuB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Aug 2020 15:50:01 -0400
Received: from buildfff.adridolf.com ([188.192.134.246]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N3bnP-1kdvyC3bIB-010bc4; Sun, 30 Aug 2020 21:49:55 +0200
From:   Adrian Schmutzler <freifunk@adrianschmutzler.de>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: dra7xx: replace status value "ok" by "okay"
Date:   Sun, 30 Aug 2020 21:48:41 +0200
Message-Id: <20200830194841.60766-1-freifunk@adrianschmutzler.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JgLlJVc9nZLH9H4+BlEn7RI0+CWPcWf/3TF7WobNVZUSuFMzejC
 U/M9x7FLQt5RecGfo/VcdMZijIHQOe236bhFm3LOraxh3WLNpooc9oKkNOcPAI9LxWydMfs
 pRElXaOMK+EPf3cqa1lVZFNT/ufWmHPbI1SUo+CdSjwL3/44P3X4sBGVNSPAPFkqLZ/VAXn
 RHIe7hfUCsy4w4NGx+mOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aC9tBLW0Dbs=:vPGWQmSon4leYuQK6u5dq/
 Jtfwj+mbyHusYpZGOmBI9R+uFTFbApbJHTLygkfj51OnhTitn8mvGrx/Od3eNo9h6B0EIryli
 0qNfzr3SsRfT+47IPe4xu/bd0c9y/uoySWEu2Y1Q2jpKup+YUEaCs3aQ/l/vPo4tjN13d5mIx
 1WvLhqaPVUzKlgZzkmK5yCRaS2J14k8i0Wgy7kNZ+VibeqqP1p0ampQqBocr6gJeOjJ0AJPsX
 eEYfEmkEDl/IsP2qvQcZs0T0DaVCrh+loVJhqWNWMAIy+b+l05imdel1xJBS6H+HHi5ij5IZX
 fkI1iaU7KGJQsW0HsZObSycBgGYDzvgwJrBdWfQFGfF4i8Hkq6/U3eMz1Jg/r1QT/XC/r5wND
 IgX3wX4x54r9ZhGBCZlDXL0e4fy2TPSfl5g05Yo5+1eYawGJd5rOhaLxjrE8O33jFydOIifZr
 Dm31JQwDIdFx/5S8xgNSCsbdV1Nfr+GO5M43rs9XzBrOmwx2YiQbwsjsV5rrH3c6+paYuu7Md
 R2nJHcbtef0Ff5DwP6sFLhK7vXSvXkG+wExhcK5A0OqfASIkRhpJW0oyH8DN8kJdSfq/lTnKy
 HfmpkuCI3qxjf8Dxj9dcTs0IBGavVnSsdJQ9dZfSioQq0zAkV3OH6FFwh0w4paF21NCjUvBfZ
 ypab1XcBpY4j5HZVmyhqYhxCdJf+jl1C8xmUYU/OkXbBWn8C+etrFoCchfcUf9vV+nQtKniwH
 1Q2Dti4SMguqiyyYFBlRbGSrFecLVIsLLgMGzr1mukadQ27gavm0SAv9AKIwZ6ix3oYDPe+Qz
 sVji1YMKXpe8XyK6lEvFKAJacawO6kMazMqpwyPSQx1bGVxAFRA0PsLL/vr69XM6sc8rHdPNO
 TEVAyLftlGr816gQ4ZcQ==
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
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi | 6 +++---
 arch/arm/boot/dts/am57xx-sbc-am57x.dts          | 4 ++--
 arch/arm/boot/dts/dra7-evm.dts                  | 2 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi         | 6 +++---
 arch/arm/boot/dts/dra76-evm.dts                 | 4 ++--
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
index b3a0206ebd6c..1809f97d491d 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
@@ -582,13 +582,13 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	vdda_video-supply = <&ldoln_reg>;
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 	vdda-supply = <&ldo4_reg>;
 
 	port {
@@ -599,7 +599,7 @@
 };
 
 &pcie1_rc {
-	status = "ok";
+	status = "okay";
 	gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
 };
 
diff --git a/arch/arm/boot/dts/am57xx-sbc-am57x.dts b/arch/arm/boot/dts/am57xx-sbc-am57x.dts
index ce5bf1d92eab..beef63e8a005 100644
--- a/arch/arm/boot/dts/am57xx-sbc-am57x.dts
+++ b/arch/arm/boot/dts/am57xx-sbc-am57x.dts
@@ -120,7 +120,7 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 
 	vdda_video-supply = <&ldoln_reg>;
 
@@ -148,7 +148,7 @@
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 	vdda-supply = <&ldo4_reg>;
 
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
index a952d934fcf2..bda6f7eeef4f 100644
--- a/arch/arm/boot/dts/dra7-evm.dts
+++ b/arch/arm/boot/dts/dra7-evm.dts
@@ -565,7 +565,7 @@
 };
 
 &dcan1 {
-	status = "ok";
+	status = "okay";
 	pinctrl-names = "default", "sleep", "active";
 	pinctrl-0 = <&dcan1_pins_sleep>;
 	pinctrl-1 = <&dcan1_pins_sleep>;
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index 9273a7d6fa29..7506e415b08f 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -467,7 +467,7 @@
 };
 
 &dcan1 {
-	status = "ok";
+	status = "okay";
 	pinctrl-names = "default", "sleep", "active";
 	pinctrl-0 = <&dcan1_pins_sleep>;
 	pinctrl-1 = <&dcan1_pins_sleep>;
@@ -536,11 +536,11 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 
 	port {
 		hdmi_out: endpoint {
diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index 803981cc762e..81590ef36937 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -522,12 +522,12 @@
 };
 
 &dss {
-	status = "ok";
+	status = "okay";
 	vdda_video-supply = <&ldo5_reg>;
 };
 
 &hdmi {
-	status = "ok";
+	status = "okay";
 
 	vdda-supply = <&ldo1_reg>;
 
-- 
2.20.1

