Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 528E419ED97
	for <lists+linux-omap@lfdr.de>; Sun,  5 Apr 2020 21:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbgDETXn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Apr 2020 15:23:43 -0400
Received: from mail-eopbgr00111.outbound.protection.outlook.com ([40.107.0.111]:12774
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727548AbgDETXn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 5 Apr 2020 15:23:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1esRMlsyD1GdIZNgfMBukqR4sRcl7nwQLoX9uMkINxU6UbGDO+vICe0Ufo7Pj4wUrQ9kvHzDunQy+s1MvnTW3fjvqCyxlbnprvgYh3ExbD9hQwAyHyWxOtKtMnd0CMDoUuXDbetJPIKH+fR2zSi51N05uEP9b4EsrwOy33dQevD0fzZ7lDneQTgmaLz1yKww5L3AKBJ66b0KUZIh5ViqHLZMh0qwfUJE0/IpM4GMmQCs9SIlJF90n1nKmjBpmnnXHCYsCVg2tI9KL7Ijx9y7GXJZekOdy+pn6OUkgRvU1Gymn4MR/m5bbvmzPUETxxGv/aVVcbzHxMwbZ04I4T3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZ/9we2MRoUwuFBL1eK4ydBrJ2isvU5LTtqDXwherRo=;
 b=lk5dpA3RJJ3encmU4ktTvLw9iqtCskltO2G9WWlhGuxY5Ko9vHyc98pHjHlMk3aOCHzHFzewScI/j3daxN2IlxOI/I3kSQ+QPjymZWJe0qwLW6wSWr/ku4r5U9m7RYuuT7k8jlb3Lviwg5cHgyUG2uQZYwxOMxNSy1b+JBQabCnf26mrJky61W+acKMMEAX5gjW60iV//oZRdOnGm5YipbLv0ZurqFjrR9z1bsw+SuWAgk7O2HiJaDT52NYDMHwGi4X6iY4+s/yoEMsQIrs0TlJ79ZP+xTDCj6LcA8bS9j2cVZQPQf13vvmwS0AX5Tr7aescPI5z56q/qnPHsK9leQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZ/9we2MRoUwuFBL1eK4ydBrJ2isvU5LTtqDXwherRo=;
 b=Xlo/VK5Clp9ku/UOIRvsgIEizXggN7F++dFYB8VOVVQcvCpCuvoGxKwYL5zPfu0SacHkgPeKe4mgt4bFcJxTITcbEIAsiZpHUMkKjGjhtJ2yr9rFTUgt7grVD0JzX8rrx/p+wlxkisnqNVzpm1ImZzUuJlz7oH2Tx97KOSvXzS4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (2603:10a6:802:1c::24)
 by VI1PR05MB5373.eurprd05.prod.outlook.com (2603:10a6:803:b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Sun, 5 Apr
 2020 19:23:05 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::7cdd:4feb:a8b6:a6d2]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::7cdd:4feb:a8b6:a6d2%7]) with mapi id 15.20.2878.018; Sun, 5 Apr 2020
 19:23:05 +0000
From:   Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To:     devicetree@vger.kernel.org
Cc:     Paul Barker <pbarker@konsulko.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Igor Opaniuk <igor.opaniuk@toradex.com>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Chen-Yu Tsai <wens@csie.org>,
        David Lechner <david@lechnology.com>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Sekhar Nori <nsekhar@ti.com>, Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tony Lindgren <tony@atomide.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH v2 6/6] arm: dts: pwm: replace flag 0 with PWM_NOFLAGS
Date:   Sun,  5 Apr 2020 22:22:46 +0300
Message-Id: <20200405192246.3741784-7-oleksandr.suvorov@toradex.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200405192246.3741784-1-oleksandr.suvorov@toradex.com>
References: <20200405192246.3741784-1-oleksandr.suvorov@toradex.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0047.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::16) To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (82.193.109.226) by ZR0P278CA0047.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Sun, 5 Apr 2020 19:23:04 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [82.193.109.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3835125f-9d47-49f2-b4be-08d7d996c3a4
X-MS-TrafficTypeDiagnostic: VI1PR05MB5373:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB5373202BBB7C59EBF9F2BE2AF9C50@VI1PR05MB5373.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 03648EFF89
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR05MB3279.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(346002)(376002)(366004)(396003)(39840400004)(136003)(54906003)(6486002)(55236004)(81156014)(2906002)(8676002)(508600001)(86362001)(30864003)(52116002)(6496006)(26005)(81166006)(316002)(8936002)(36756003)(6666004)(956004)(66946007)(2616005)(7406005)(7416002)(1076003)(186003)(16526019)(66556008)(66476007)(44832011)(6916009)(5660300002)(4326008)(95444002);DIR:OUT;SFP:1102;
Received-SPF: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yaXeIqIo+peHV70+PBLL4ETvAqGOY3GK9P3gLZ9Ra/VifriQsOPlb8Cbf3ssiJOA9iWfiQdPQk9V3vhd5alejxMMTv78S8lrWNpzRVABuxZv1a+NASg+b8PcQbugGZp0utYC3iSshGjmmdHHmuO48YtYR38D9tlPFWAMr6k50wHiWqUDw8NyN/OvpG/fB1zC+6AmKcLeeB0EJFdFjGiOYuXInXQRE1NjZkvq4Ga4245T+/1apAtVYWa67yHtccCu47kq7wVH+RCYeeGVcYjGKJVGi7dv94wAvkvTYC8nIrlypdM2Ia/V0D4+vfWCNYyyzrl9KbCZZBK+HOF8LQeaGIONZTOWxol4Syju4jQ7Y15L85Sm39LPv/Y/mCBVF4CG6kiu1//LaffuInk8qkqNl52Nah4w+/YJkNP0IcWmx6eoiNaAW/BYSEiIEhA/JzZ9AYEGddaCfnexFO3BMi0ajZj8PmZkAugjgR6Jd+8tYchvTBSolsAkh8i/eFxlEOzG
X-MS-Exchange-AntiSpam-MessageData: urnWWzyqAYY0GGn31gnnV6uRaRGk+mTGeV8ItnUQM1+zlRoofguUG0FiMEHKbkhhBvQZhy0k5xNTDC8Iu+5EiHN84unlXeFZ3pNoRo2osiyJNn8eU0uz9Mkx2rsDAvufaW8I0+0Ght2cnEzclBpbmw==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3835125f-9d47-49f2-b4be-08d7d996c3a4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2020 19:23:04.9905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPN3xPCtFKSkigYh5Cl6FrNH+ZlEifHhnKp7XfkqRYEW8TorYg0WojQwnFY5mUqP3ynXOREqkJ5y65hE3Au+yBioQXTa6JajkAN2627j3P8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5373
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The raw value '0' in the 3rd cell of the "pwms" property means there are
no flags to be set.

This patch converts '0' value into PWM_NOFLAGS.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---

Changes in v2:
- remove the driver part of patchset as dangerous and senseless.
- use PWM_NOFLAGS instead of PWM_POLARITY_NORMAL to avoid possible
  conflict with enum pwm_polarity in <linux/pwm.h>. Also, this name
  reflects the sense of this value more precisely.

 arch/arm/boot/dts/am335x-cm-t335.dts               | 2 +-
 arch/arm/boot/dts/am335x-evm.dts                   | 2 +-
 arch/arm/boot/dts/am3517-evm.dts                   | 2 +-
 arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi      | 2 +-
 arch/arm/boot/dts/at91-kizbox2-common.dtsi         | 6 +++---
 arch/arm/boot/dts/at91-kizbox3_common.dtsi         | 8 ++++----
 arch/arm/boot/dts/at91-kizboxmini-common.dtsi      | 6 +++---
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts        | 2 +-
 arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts        | 2 +-
 arch/arm/boot/dts/at91sam9n12ek.dts                | 2 +-
 arch/arm/boot/dts/at91sam9x5dm.dtsi                | 2 +-
 arch/arm/boot/dts/berlin2cd-google-chromecast.dts  | 4 ++--
 arch/arm/boot/dts/da850-evm.dts                    | 2 +-
 arch/arm/boot/dts/da850-lego-ev3.dts               | 4 ++--
 arch/arm/boot/dts/exynos4412-midas.dtsi            | 2 +-
 arch/arm/boot/dts/exynos4412-odroidu3.dts          | 2 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi      | 2 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts          | 2 +-
 arch/arm/boot/dts/exynos5420-peach-pit.dts         | 2 +-
 arch/arm/boot/dts/exynos5422-odroidhc1.dts         | 2 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 2 +-
 arch/arm/boot/dts/exynos5422-odroidxu4.dts         | 2 +-
 arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi    | 4 ++--
 arch/arm/boot/dts/exynos5800-peach-pi.dts          | 2 +-
 arch/arm/boot/dts/imx53-tx53-x13x.dts              | 5 +++--
 arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts          | 2 +-
 arch/arm/boot/dts/imx6q-display5.dtsi              | 2 +-
 arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts       | 2 +-
 arch/arm/boot/dts/imx6q-tx6q-1020-comtft.dts       | 2 +-
 arch/arm/boot/dts/imx6qdl-tx6-lvds.dtsi            | 4 ++--
 arch/arm/boot/dts/imx7-colibri.dtsi                | 4 +++-
 arch/arm/boot/dts/imx7d-nitrogen7.dts              | 3 ++-
 arch/arm/boot/dts/imx7d-pico.dtsi                  | 3 ++-
 arch/arm/boot/dts/imx7d-sdb.dts                    | 3 ++-
 arch/arm/boot/dts/imx7ulp-evk.dts                  | 3 ++-
 arch/arm/boot/dts/iwg20d-q7-common.dtsi            | 2 +-
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi   | 2 +-
 arch/arm/boot/dts/meson8b-ec100.dts                | 4 ++--
 arch/arm/boot/dts/meson8b-mxq.dts                  | 4 ++--
 arch/arm/boot/dts/meson8b-odroidc1.dts             | 4 ++--
 arch/arm/boot/dts/motorola-mapphone-common.dtsi    | 3 ++-
 arch/arm/boot/dts/omap3-gta04.dtsi                 | 2 +-
 arch/arm/boot/dts/omap3-n900.dts                   | 2 +-
 arch/arm/boot/dts/rk3288-veyron-edp.dtsi           | 2 +-
 arch/arm/boot/dts/rk3288-veyron.dtsi               | 2 +-
 arch/arm/boot/dts/rv1108-evb.dts                   | 2 +-
 arch/arm/boot/dts/s3c6410-mini6410.dts             | 2 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi               | 2 +-
 arch/arm/boot/dts/s5pv210-smdkv210.dts             | 2 +-
 arch/arm/boot/dts/sun5i-gr8-evb.dts                | 2 +-
 arch/arm/boot/dts/vf-colibri.dtsi                  | 4 +++-
 51 files changed, 76 insertions(+), 66 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-cm-t335.dts b/arch/arm/boot/dts/am335x-cm-t335.dts
index c6fe9db660e2..5ccca3c3e243 100644
--- a/arch/arm/boot/dts/am335x-cm-t335.dts
+++ b/arch/arm/boot/dts/am335x-cm-t335.dts
@@ -48,7 +48,7 @@ vwlan_fixed: fixedregulator2 {
 
 	backlight {
 		compatible = "pwm-backlight";
-		pwms = <&ecap0 0 50000 0>;
+		pwms = <&ecap0 0 50000 PWM_NOFLAGS>;
 		brightness-levels = <0 51 53 56 62 75 101 152 255>;
 		default-brightness-level = <8>;
 	};
diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
index 68252dab32c3..c9f351e27c2d 100644
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -115,7 +115,7 @@ switch10 {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&ecap0 0 50000 0>;
+		pwms = <&ecap0 0 50000 PWM_NOFLAGS>;
 		brightness-levels = <0 51 53 56 62 75 101 152 255>;
 		default-brightness-level = <8>;
 	};
diff --git a/arch/arm/boot/dts/am3517-evm.dts b/arch/arm/boot/dts/am3517-evm.dts
index a1fd3e63e86e..02fa18ae499b 100644
--- a/arch/arm/boot/dts/am3517-evm.dts
+++ b/arch/arm/boot/dts/am3517-evm.dts
@@ -144,7 +144,7 @@ bl: backlight {
 		pinctrl-names = "default";
 		power-supply = <&vdd_io_reg>;
 		pinctrl-0 = <&backlight_pins>;
-		pwms = <&pwm11 0 5000000 0>;
+		pwms = <&pwm11 0 5000000 PWM_NOFLAGS>;
 		brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;
 		default-brightness-level = <7>;
 		enable-gpios = <&gpio6 22 GPIO_ACTIVE_HIGH>; /* gpio_182 */
diff --git a/arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi b/arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi
index bea920b192b6..e20ba0f6f759 100644
--- a/arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi
+++ b/arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi
@@ -10,7 +10,7 @@
 / {
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&hlcdc_pwm 0 50000 0>;
+		pwms = <&hlcdc_pwm 0 50000 PWM_NOFLAGS>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
 		status = "okay";
diff --git a/arch/arm/boot/dts/at91-kizbox2-common.dtsi b/arch/arm/boot/dts/at91-kizbox2-common.dtsi
index af38253a6e7a..12c78f47e56a 100644
--- a/arch/arm/boot/dts/at91-kizbox2-common.dtsi
+++ b/arch/arm/boot/dts/at91-kizbox2-common.dtsi
@@ -63,21 +63,21 @@ pwm_leds {
 
 		blue {
 			label = "pwm:blue:user";
-			pwms = <&pwm0 2 10000000 0>;
+			pwms = <&pwm0 2 10000000 PWM_NOFLAGS>;
 			max-brightness = <255>;
 			linux,default-trigger = "none";
 		};
 
 		green {
 			label = "pwm:green:user";
-			pwms = <&pwm0 1 10000000 0>;
+			pwms = <&pwm0 1 10000000 PWM_NOFLAGS>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
 		red {
 			label = "pwm:red:user";
-			pwms = <&pwm0 0 10000000 0>;
+			pwms = <&pwm0 0 10000000 PWM_NOFLAGS>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
diff --git a/arch/arm/boot/dts/at91-kizbox3_common.dtsi b/arch/arm/boot/dts/at91-kizbox3_common.dtsi
index 299e74d23184..ca3121c5a80b 100644
--- a/arch/arm/boot/dts/at91-kizbox3_common.dtsi
+++ b/arch/arm/boot/dts/at91-kizbox3_common.dtsi
@@ -73,7 +73,7 @@ &pinctrl_pwm0_pwm_h2
 
 		red {
 			label = "pwm:red:user";
-			pwms = <&pwm0 0 10000000 0>;
+			pwms = <&pwm0 0 10000000 PWM_NOFLAGS>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 			status = "disabled";
@@ -81,7 +81,7 @@ red {
 
 		green {
 			label = "pwm:green:user";
-			pwms = <&pwm0 1 10000000 0>;
+			pwms = <&pwm0 1 10000000 PWM_NOFLAGS>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 			status = "disabled";
@@ -89,14 +89,14 @@ green {
 
 		blue {
 			label = "pwm:blue:user";
-			pwms = <&pwm0 2 10000000 0>;
+			pwms = <&pwm0 2 10000000 PWM_NOFLAGS>;
 			max-brightness = <255>;
 			status = "disabled";
 		};
 
 		white {
 			label = "pwm:white:user";
-			pwms = <&pwm0 3 10000000 0>;
+			pwms = <&pwm0 3 10000000 PWM_NOFLAGS>;
 			max-brightness = <255>;
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/at91-kizboxmini-common.dtsi b/arch/arm/boot/dts/at91-kizboxmini-common.dtsi
index fddf267b2d17..09a8f3dc378e 100644
--- a/arch/arm/boot/dts/at91-kizboxmini-common.dtsi
+++ b/arch/arm/boot/dts/at91-kizboxmini-common.dtsi
@@ -59,7 +59,7 @@ leds: pwm_leds {
 
 		led_blue: pwm_blue {
 			label = "pwm:blue:user";
-			pwms = <&pwm0 2 10000000 0>;
+			pwms = <&pwm0 2 10000000 PWM_NOFLAGS>;
 			max-brightness = <255>;
 			linux,default-trigger = "none";
 			status = "disabled";
@@ -67,14 +67,14 @@ led_blue: pwm_blue {
 
 		led_green: pwm_green {
 			label = "pwm:green:user";
-			pwms = <&pwm0 0 10000000 0>;
+			pwms = <&pwm0 0 10000000 PWM_NOFLAGS>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
 		led_red: pwm_red {
 			label = "pwm:red:user";
-			pwms = <&pwm0 1 10000000 0>;
+			pwms = <&pwm0 1 10000000 PWM_NOFLAGS>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
diff --git a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
index 4f123477e631..ac6465117ee2 100644
--- a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
+++ b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
@@ -42,7 +42,7 @@ bl_reg: backlight-regulator {
 
 	panel_bl: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&hlcdc_pwm 0 100000 0>;
+		pwms = <&hlcdc_pwm 0 100000 PWM_NOFLAGS>;
 
 		brightness-levels = < 0  1  2  3  4  5  6  7  8  9
 				     10 11 12 13 14 15 16 17 18 19
diff --git a/arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts b/arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts
index 4d7cee569ff2..b7928c738f9a 100644
--- a/arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts
+++ b/arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts
@@ -105,7 +105,7 @@ pinctrl_usba_vbus: usba_vbus {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&hlcdc_pwm 0 50000 0>;
+		pwms = <&hlcdc_pwm 0 50000 PWM_NOFLAGS>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
 		status = "okay";
diff --git a/arch/arm/boot/dts/at91sam9n12ek.dts b/arch/arm/boot/dts/at91sam9n12ek.dts
index d36e162a8817..d317e9178036 100644
--- a/arch/arm/boot/dts/at91sam9n12ek.dts
+++ b/arch/arm/boot/dts/at91sam9n12ek.dts
@@ -189,7 +189,7 @@ usb0: ohci@500000 {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&hlcdc_pwm 0 50000 0>;
+		pwms = <&hlcdc_pwm 0 50000 PWM_NOFLAGS>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
 		power-supply = <&bl_reg>;
diff --git a/arch/arm/boot/dts/at91sam9x5dm.dtsi b/arch/arm/boot/dts/at91sam9x5dm.dtsi
index a9278038af3b..e4e124025f76 100644
--- a/arch/arm/boot/dts/at91sam9x5dm.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5dm.dtsi
@@ -11,7 +11,7 @@
 / {
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&hlcdc_pwm 0 50000 0>;
+		pwms = <&hlcdc_pwm 0 50000 PWM_NOFLAGS>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
 		power-supply = <&bl_reg>;
diff --git a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
index 56fa951bc86f..2ad7b60c73f1 100644
--- a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
+++ b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
@@ -41,14 +41,14 @@ leds {
 
 		white {
 			label = "white";
-			pwms = <&pwm 0 600000 0>;
+			pwms = <&pwm 0 600000 PWM_NOFLAGS>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
 		red {
 			label = "red";
-			pwms = <&pwm 1 600000 0>;
+			pwms = <&pwm 1 600000 PWM_NOFLAGS>;
 			max-brightness = <255>;
 		};
 	};
diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index f2e7609e5346..50c7d79da6b9 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -34,7 +34,7 @@ backlight: backlight-pwm {
 		 * schematic needs to be 1015171 (15 March 2010), Rev A
 		 * or newer.
 		 */
-		pwms = <&ecap2 0 50000 0>;
+		pwms = <&ecap2 0 50000 PWM_NOFLAGS>;
 		brightness-levels = <0 10 20 30 40 50 60 70 80 90 99>;
 		default-brightness-level = <7>;
 	};
diff --git a/arch/arm/boot/dts/da850-lego-ev3.dts b/arch/arm/boot/dts/da850-lego-ev3.dts
index afd04a423856..407ea61615e2 100644
--- a/arch/arm/boot/dts/da850-lego-ev3.dts
+++ b/arch/arm/boot/dts/da850-lego-ev3.dts
@@ -118,7 +118,7 @@ sound {
 		compatible = "pwm-beeper";
 		pinctrl-names = "default";
 		pinctrl-0 = <&ehrpwm0b_pins>;
-		pwms = <&ehrpwm0 1 1000000 0>;
+		pwms = <&ehrpwm0 1 1000000 PWM_NOFLAGS>;
 		amp-supply = <&amp>;
 	};
 
@@ -185,7 +185,7 @@ bt_slow_clk: bt-clock {
 		compatible = "pwm-clock";
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
-		pwms = <&ecap2 0 30518 0>;
+		pwms = <&ecap2 0 30518 PWM_NOFLAGS>;
 	};
 
 	/* ARM local RAM */
diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index 2c8111c6b065..aaf26b7e8b7b 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -172,7 +172,7 @@ charger_reg: CHARGER {
 			max77693_haptic {
 				compatible = "maxim,max77693-haptic";
 				haptic-supply = <&ldo26_reg>;
-				pwms = <&pwm 0 38022 0>;
+				pwms = <&pwm 0 38022 PWM_NOFLAGS>;
 			};
 
 			charger {
diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index 8ff243ba4542..7b9799f814ee 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -33,7 +33,7 @@ led1 {
 
 	fan0: pwm-fan {
 		compatible = "pwm-fan";
-		pwms = <&pwm 0 10000 0>;
+		pwms = <&pwm 0 10000 PWM_NOFLAGS>;
 		#cooling-cells = <2>;
 		cooling-levels = <0 102 170 230>;
 	};
diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
index c952a615148e..801c56e7cc8b 100644
--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
@@ -196,7 +196,7 @@ xxti {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&pwm 0 1000000 0>;
+		pwms = <&pwm 0 1000000 PWM_NOFLAGS>;
 		brightness-levels = <0 100 500 1000 1500 2000 2500 2800>;
 		default-brightness-level = <7>;
 		enable-gpios = <&gpx3 0 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index 4f9297ae0763..201281b56ef2 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -37,7 +37,7 @@ emmc_pwrseq: pwrseq {
 
 	fan0: pwm-fan {
 		compatible = "pwm-fan";
-		pwms = <&pwm 0 20972 0>;
+		pwms = <&pwm 0 20972 PWM_NOFLAGS>;
 		#cooling-cells = <2>;
 		cooling-levels = <0 130 170 230>;
 	};
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 2bcbdf8a39bf..0d832df21959 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -34,7 +34,7 @@ aliases {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&pwm 0 1000000 0>;
+		pwms = <&pwm 0 1000000 PWM_NOFLAGS>;
 		brightness-levels = <0 100 500 1000 1500 2000 2500 2800>;
 		default-brightness-level = <7>;
 		power-supply = <&tps65090_fet1>;
diff --git a/arch/arm/boot/dts/exynos5422-odroidhc1.dts b/arch/arm/boot/dts/exynos5422-odroidhc1.dts
index 812659260278..0b7a6b4a2fd0 100644
--- a/arch/arm/boot/dts/exynos5422-odroidhc1.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidhc1.dts
@@ -20,7 +20,7 @@ pwmleds {
 
 		blueled {
 			label = "blue:heartbeat";
-			pwms = <&pwm 2 2000000 0>;
+			pwms = <&pwm 2 2000000 PWM_NOFLAGS>;
 			pwm-names = "pwm2";
 			max_brightness = <255>;
 			linux,default-trigger = "heartbeat";
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 5da2d81e3be2..548b5e95e51e 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -43,7 +43,7 @@ emmc_pwrseq: pwrseq {
 
 	fan0: pwm-fan {
 		compatible = "pwm-fan";
-		pwms = <&pwm 0 20972 0>;
+		pwms = <&pwm 0 20972 PWM_NOFLAGS>;
 		#cooling-cells = <2>;
 		cooling-levels = <0 130 170 230>;
 	};
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu4.dts b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
index 892d389d6d09..e55534158ddf 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
@@ -22,7 +22,7 @@ pwmleds {
 
 		blueled {
 			label = "blue:heartbeat";
-			pwms = <&pwm 2 2000000 0>;
+			pwms = <&pwm 2 2000000 PWM_NOFLAGS>;
 			pwm-names = "pwm2";
 			max_brightness = <255>;
 			linux,default-trigger = "heartbeat";
diff --git a/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi b/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
index 56acd832f0b3..a26e864262cb 100644
--- a/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
+++ b/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
@@ -16,7 +16,7 @@ pwmleds {
 
 		greenled {
 			label = "green:mmc0";
-			pwms = <&pwm 1 2000000 0>;
+			pwms = <&pwm 1 2000000 PWM_NOFLAGS>;
 			pwm-names = "pwm1";
 			/*
 			 * Green LED is much brighter than the others
@@ -28,7 +28,7 @@ greenled {
 
 		blueled {
 			label = "blue:heartbeat";
-			pwms = <&pwm 2 2000000 0>;
+			pwms = <&pwm 2 2000000 PWM_NOFLAGS>;
 			pwm-names = "pwm2";
 			max_brightness = <255>;
 			linux,default-trigger = "heartbeat";
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 60ab0effe474..8590b2c21332 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -32,7 +32,7 @@ aliases {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&pwm 0 1000000 0>;
+		pwms = <&pwm 0 1000000 PWM_NOFLAGS>;
 		brightness-levels = <0 100 500 1000 1500 2000 2500 2800>;
 		default-brightness-level = <7>;
 		enable-gpios = <&gpx2 2 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/imx53-tx53-x13x.dts b/arch/arm/boot/dts/imx53-tx53-x13x.dts
index 6cdf2082c742..3e7374d1f092 100644
--- a/arch/arm/boot/dts/imx53-tx53-x13x.dts
+++ b/arch/arm/boot/dts/imx53-tx53-x13x.dts
@@ -48,6 +48,7 @@
 /dts-v1/;
 #include "imx53-tx53.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "Ka-Ro electronics TX53 module (LVDS)";
@@ -61,7 +62,7 @@ aliases {
 
 	backlight0: backlight0 {
 		compatible = "pwm-backlight";
-		pwms = <&pwm2 0 500000 0>;
+		pwms = <&pwm2 0 500000 PWM_NOFLAGS>;
 		power-supply = <&reg_3v3>;
 		brightness-levels = <
 			  0  1  2  3  4  5  6  7  8  9
@@ -81,7 +82,7 @@ backlight0: backlight0 {
 
 	backlight1: backlight1 {
 		compatible = "pwm-backlight";
-		pwms = <&pwm1 0 500000 0>;
+		pwms = <&pwm1 0 500000 PWM_NOFLAGS>;
 		power-supply = <&reg_3v3>;
 		brightness-levels = <
 			  0  1  2  3  4  5  6  7  8  9
diff --git a/arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts b/arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts
index 51a9bb9d6bc2..ee5199c6b231 100644
--- a/arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts
+++ b/arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts
@@ -50,7 +50,7 @@ / {
 };
 
 &backlight {
-	pwms = <&pwm2 0 500000 0>;
+	pwms = <&pwm2 0 500000 PWM_NOFLAGS>;
 	/delete-property/ turn-on-delay-ms;
 };
 
diff --git a/arch/arm/boot/dts/imx6q-display5.dtsi b/arch/arm/boot/dts/imx6q-display5.dtsi
index 83524bb99eb3..661b40cf68ec 100644
--- a/arch/arm/boot/dts/imx6q-display5.dtsi
+++ b/arch/arm/boot/dts/imx6q-display5.dtsi
@@ -56,7 +56,7 @@ backlight_lvds: backlight {
 		compatible = "pwm-backlight";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_backlight>;
-		pwms = <&pwm2 0 5000000 0>;
+		pwms = <&pwm2 0 5000000 PWM_NOFLAGS>;
 		brightness-levels = <  0   1   2   3   4   5   6   7   8   9
 				      10  11  12  13  14  15  16  17  18  19
 				      20  21  22  23  24  25  26  27  28  29
diff --git a/arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts b/arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts
index ac3050a835e5..94cf7d99fc88 100644
--- a/arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts
+++ b/arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts
@@ -50,7 +50,7 @@ / {
 };
 
 &backlight {
-	pwms = <&pwm2 0 500000 0>;
+	pwms = <&pwm2 0 500000 PWM_NOFLAGS>;
 	/delete-property/ turn-on-delay-ms;
 };
 
diff --git a/arch/arm/boot/dts/imx6q-tx6q-1020-comtft.dts b/arch/arm/boot/dts/imx6q-tx6q-1020-comtft.dts
index a773f252816c..30c0858758c9 100644
--- a/arch/arm/boot/dts/imx6q-tx6q-1020-comtft.dts
+++ b/arch/arm/boot/dts/imx6q-tx6q-1020-comtft.dts
@@ -50,7 +50,7 @@ / {
 };
 
 &backlight {
-	pwms = <&pwm2 0 500000 0>;
+	pwms = <&pwm2 0 500000 PWM_NOFLAGS>;
 	/delete-property/ turn-on-delay-ms;
 };
 
diff --git a/arch/arm/boot/dts/imx6qdl-tx6-lvds.dtsi b/arch/arm/boot/dts/imx6qdl-tx6-lvds.dtsi
index 2ca2eb37e14f..e4662990d3a3 100644
--- a/arch/arm/boot/dts/imx6qdl-tx6-lvds.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-tx6-lvds.dtsi
@@ -48,7 +48,7 @@ aliases {
 
 	backlight0: backlight0 {
 		compatible = "pwm-backlight";
-		pwms = <&pwm2 0 500000 0>;
+		pwms = <&pwm2 0 500000 PWM_NOFLAGS>;
 		power-supply = <&reg_lcd0_pwr>;
 		brightness-levels = < 0  1  2  3  4  5  6  7  8  9
 				     10 11 12 13 14 15 16 17 18 19
@@ -66,7 +66,7 @@ backlight0: backlight0 {
 
 	backlight1: backlight1 {
 		compatible = "pwm-backlight";
-		pwms = <&pwm1 0 500000 0>;
+		pwms = <&pwm1 0 500000 PWM_NOFLAGS>;
 		power-supply = <&reg_lcd1_pwr>;
 		brightness-levels = < 0  1  2  3  4  5  6  7  8  9
 				     10 11 12 13 14 15 16 17 18 19
diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-colibri.dtsi
index e18e89dec879..446a8b5d69bd 100644
--- a/arch/arm/boot/dts/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri.dtsi
@@ -3,12 +3,14 @@
  * Copyright 2016-2020 Toradex
  */
 
+#include <dt-bindings/pwm/pwm.h>
+
 / {
 	bl: backlight {
 		compatible = "pwm-backlight";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_gpio_bl_on>;
-		pwms = <&pwm1 0 5000000 0>;
+		pwms = <&pwm1 0 5000000 PWM_NOFLAGS>;
 		enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
 	};
 
diff --git a/arch/arm/boot/dts/imx7d-nitrogen7.dts b/arch/arm/boot/dts/imx7d-nitrogen7.dts
index 6b4acea1ef79..2f4d506bb2a4 100644
--- a/arch/arm/boot/dts/imx7d-nitrogen7.dts
+++ b/arch/arm/boot/dts/imx7d-nitrogen7.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "imx7d.dtsi"
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "Boundary Devices i.MX7 Nitrogen7 Board";
@@ -26,7 +27,7 @@ backlight-j9 {
 
 	backlight_lcd: backlight-j20 {
 		compatible = "pwm-backlight";
-		pwms = <&pwm1 0 5000000 0>;
+		pwms = <&pwm1 0 5000000 PWM_NOFLAGS>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
 		status = "okay";
diff --git a/arch/arm/boot/dts/imx7d-pico.dtsi b/arch/arm/boot/dts/imx7d-pico.dtsi
index e57da0d32b98..e9239cdd47a6 100644
--- a/arch/arm/boot/dts/imx7d-pico.dtsi
+++ b/arch/arm/boot/dts/imx7d-pico.dtsi
@@ -5,11 +5,12 @@
 /dts-v1/;
 
 #include "imx7d.dtsi"
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&pwm4 0 50000 0>;
+		pwms = <&pwm4 0 50000 PWM_NOFLAGS>;
 		brightness-levels = <0 36 72 108 144 180 216 255>;
 		default-brightness-level = <6>;
 	};
diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index 869efbc4af42..214d3a2165a9 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "imx7d.dtsi"
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "Freescale i.MX7 SabreSD Board";
@@ -129,7 +130,7 @@ reg_fec2_3v3: regulator-fec2-3v3 {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&pwm1 0 5000000 0>;
+		pwms = <&pwm1 0 5000000 PWM_NOFLAGS>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
 		status = "okay";
diff --git a/arch/arm/boot/dts/imx7ulp-evk.dts b/arch/arm/boot/dts/imx7ulp-evk.dts
index eff51e113db4..3a0674134553 100644
--- a/arch/arm/boot/dts/imx7ulp-evk.dts
+++ b/arch/arm/boot/dts/imx7ulp-evk.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "imx7ulp.dtsi"
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "NXP i.MX7ULP EVK";
@@ -24,7 +25,7 @@ memory@60000000 {
 
 	backlight {
 		compatible = "pwm-backlight";
-		pwms = <&tpm4 1 50000 0>;
+		pwms = <&tpm4 1 50000 PWM_NOFLAGS>;
 		brightness-levels = <0 20 25 30 35 40 100>;
 		default-brightness-level = <6>;
 		status = "okay";
diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index ebbe1518ef8a..f88deeb54e04 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -49,7 +49,7 @@ audio_clock: audio_clock {
 	lcd_backlight: backlight {
 		compatible = "pwm-backlight";
 
-		pwms = <&pwm3 0 5000000 0>;
+		pwms = <&pwm3 0 5000000 PWM_NOFLAGS>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <7>;
 		enable-gpios = <&gpio5 14 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
index f7b82ced4080..7addd3f1fff5 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
@@ -149,7 +149,7 @@ bl: backlight {
 		compatible = "pwm-backlight";
 		pinctrl-names = "default";
 		pinctrl-0 = <&backlight_pins>;
-		pwms = <&pwm10 0 5000000 0>;
+		pwms = <&pwm10 0 5000000 PWM_NOFLAGS>;
 		brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;
 		default-brightness-level = <7>;
 		enable-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH>; /* gpio_154 */
diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index 163a200d5a7b..3a9f96553cea 100644
--- a/arch/arm/boot/dts/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/meson8b-ec100.dts
@@ -150,7 +150,7 @@ vcck: regulator-vcck {
 
 		vin-supply = <&vcc_5v>;
 
-		pwms = <&pwm_cd 0 1148 0>;
+		pwms = <&pwm_cd 0 1148 PWM_NOFLAGS>;
 		pwm-dutycycle-range = <100 0>;
 
 		regulator-boot-on;
@@ -234,7 +234,7 @@ vddee: regulator-vddee {
 
 		vin-supply = <&vcc_5v>;
 
-		pwms = <&pwm_cd 1 1148 0>;
+		pwms = <&pwm_cd 1 1148 PWM_NOFLAGS>;
 		pwm-dutycycle-range = <100 0>;
 
 		regulator-boot-on;
diff --git a/arch/arm/boot/dts/meson8b-mxq.dts b/arch/arm/boot/dts/meson8b-mxq.dts
index 33037ef62d0a..45dc14783716 100644
--- a/arch/arm/boot/dts/meson8b-mxq.dts
+++ b/arch/arm/boot/dts/meson8b-mxq.dts
@@ -39,7 +39,7 @@ vcck: regulator-vcck {
 		regulator-min-microvolt = <860000>;
 		regulator-max-microvolt = <1140000>;
 
-		pwms = <&pwm_cd 0 1148 0>;
+		pwms = <&pwm_cd 0 1148 PWM_NOFLAGS>;
 		pwm-dutycycle-range = <100 0>;
 
 		regulator-boot-on;
@@ -86,7 +86,7 @@ vddee: regulator-vddee {
 
 		vin-supply = <&vcc_5v>;
 
-		pwms = <&pwm_cd 1 1148 0>;
+		pwms = <&pwm_cd 1 1148 PWM_NOFLAGS>;
 		pwm-dutycycle-range = <100 0>;
 
 		regulator-boot-on;
diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index a2a47804fc4a..b08ca542b1b7 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -132,7 +132,7 @@ vcck: regulator-vcck {
 
 		vin-supply = <&p5v0>;
 
-		pwms = <&pwm_cd 0 12218 0>;
+		pwms = <&pwm_cd 0 12218 PWM_NOFLAGS>;
 		pwm-dutycycle-range = <91 0>;
 
 		regulator-boot-on;
@@ -164,7 +164,7 @@ vddee: regulator-vddee {
 
 		vin-supply = <&p5v0>;
 
-		pwms = <&pwm_cd 1 12218 0>;
+		pwms = <&pwm_cd 1 12218 PWM_NOFLAGS>;
 		pwm-dutycycle-range = <91 0>;
 
 		regulator-boot-on;
diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
index 9067e0ef4240..7ac4c63f2d6a 100644
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -178,7 +178,8 @@ pwm9: dmtimer-pwm-9 {
 
 	vibrator {
 		compatible = "pwm-vibrator";
-		pwms = <&pwm9 0 10000000 0>, <&pwm8 0 10000000 0>;
+		pwms = <&pwm9 0 10000000 PWM_NOFLAGS>,
+		       <&pwm8 0 10000000 PWM_NOFLAGS>;
 		pwm-names = "enable", "direction";
 		direction-duty-cycle-ns = <10000000>;
 	};
diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
index 409a758c99f1..aa7f23c7c8a1 100644
--- a/arch/arm/boot/dts/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/omap3-gta04.dtsi
@@ -138,7 +138,7 @@ lcd_in: endpoint {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&pwm11 0 12000000 0>;
+		pwms = <&pwm11 0 12000000 PWM_NOFLAGS>;
 		pwm-names = "backlight";
 		brightness-levels = <0 11 20 30 40 50 60 70 80 90 100>;
 		default-brightness-level = <9>;	/* => 90 */
diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index 4089d97405c9..0a99ea066799 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -152,7 +152,7 @@ pwm9: dmtimer-pwm {
 
 	ir: n900-ir {
 		compatible = "nokia,n900-ir";
-		pwms = <&pwm9 0 26316 0>; /* 38000 Hz */
+		pwms = <&pwm9 0 26316 PWM_NOFLAGS>; /* 38000 Hz */
 	};
 
 	rom_rng: rng {
diff --git a/arch/arm/boot/dts/rk3288-veyron-edp.dtsi b/arch/arm/boot/dts/rk3288-veyron-edp.dtsi
index 32c0f10765dd..296b9858762c 100644
--- a/arch/arm/boot/dts/rk3288-veyron-edp.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-edp.dtsi
@@ -47,7 +47,7 @@ backlight: backlight {
 		enable-gpios = <&gpio7 RK_PA2 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&bl_en>;
-		pwms = <&pwm0 0 1000000 0>;
+		pwms = <&pwm0 0 1000000 PWM_NOFLAGS>;
 		post-pwm-on-delay-ms = <10>;
 		pwm-off-delay-ms = <10>;
 		power-supply = <&backlight_regulator>;
diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 54a6838d73f5..17cf002f428b 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -101,7 +101,7 @@ vdd_logic: vdd-logic {
 		compatible = "pwm-regulator";
 		regulator-name = "vdd_logic";
 
-		pwms = <&pwm1 0 1994 0>;
+		pwms = <&pwm1 0 1994 PWM_NOFLAGS>;
 		pwm-supply = <&vcc33_sys>;
 
 		pwm-dutycycle-range = <0x7b 0>;
diff --git a/arch/arm/boot/dts/rv1108-evb.dts b/arch/arm/boot/dts/rv1108-evb.dts
index 30f3d0470ad9..04c27ed32b72 100644
--- a/arch/arm/boot/dts/rv1108-evb.dts
+++ b/arch/arm/boot/dts/rv1108-evb.dts
@@ -53,7 +53,7 @@ backlight: backlight {
 			240 241 242 243 244 245 246 247
 			248 249 250 251 252 253 254 255>;
 		default-brightness-level = <200>;
-		pwms = <&pwm0 0 25000 0>;
+		pwms = <&pwm0 0 25000 PWM_NOFLAGS>;
 	};
 
 	vcc_sys: vsys-regulator {
diff --git a/arch/arm/boot/dts/s3c6410-mini6410.dts b/arch/arm/boot/dts/s3c6410-mini6410.dts
index 1aeac33b0d34..71b5d31e6ad3 100644
--- a/arch/arm/boot/dts/s3c6410-mini6410.dts
+++ b/arch/arm/boot/dts/s3c6410-mini6410.dts
@@ -159,7 +159,7 @@ led-4 {
 
 	buzzer {
 		compatible = "pwm-beeper";
-		pwms = <&pwm 0 1000000 0>;
+		pwms = <&pwm 0 1000000 PWM_NOFLAGS>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pwm0_out>;
 	};
diff --git a/arch/arm/boot/dts/s5pv210-aries.dtsi b/arch/arm/boot/dts/s5pv210-aries.dtsi
index 8ff70b856334..6b01e18385e1 100644
--- a/arch/arm/boot/dts/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/s5pv210-aries.dtsi
@@ -324,7 +324,7 @@ fuelgauge@36 {
 
 	vibrator: pwm-vibrator {
 		compatible = "pwm-vibrator";
-		pwms = <&pwm 1 44642 0>;
+		pwms = <&pwm 1 44642 PWM_NOFLAGS>;
 		pwm-names = "enable";
 		vcc-supply = <&vibrator_pwr>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/s5pv210-smdkv210.dts b/arch/arm/boot/dts/s5pv210-smdkv210.dts
index 84b38f185199..065770003dca 100644
--- a/arch/arm/boot/dts/s5pv210-smdkv210.dts
+++ b/arch/arm/boot/dts/s5pv210-smdkv210.dts
@@ -42,7 +42,7 @@ ethernet@18000000 {
 
 	backlight {
 		compatible = "pwm-backlight";
-		pwms = <&pwm 3 5000000 0>;
+		pwms = <&pwm 3 5000000 PWM_NOFLAGS>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/sun5i-gr8-evb.dts b/arch/arm/boot/dts/sun5i-gr8-evb.dts
index 4c20d731a9c6..4f7f143140d2 100644
--- a/arch/arm/boot/dts/sun5i-gr8-evb.dts
+++ b/arch/arm/boot/dts/sun5i-gr8-evb.dts
@@ -69,7 +69,7 @@ chosen {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&pwm 0 10000 0>;
+		pwms = <&pwm 0 10000 PWM_NOFLAGS>;
 		enable-gpios = <&axp_gpio 1 GPIO_ACTIVE_HIGH>;
 
 		brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;
diff --git a/arch/arm/boot/dts/vf-colibri.dtsi b/arch/arm/boot/dts/vf-colibri.dtsi
index cc1e069c44e6..7300299e90f4 100644
--- a/arch/arm/boot/dts/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/vf-colibri.dtsi
@@ -4,6 +4,8 @@
  *
  */
 
+#include <dt-bindings/pwm/pwm.h>
+
 / {
 	aliases {
 		ethernet0 = &fec1;
@@ -14,7 +16,7 @@ bl: backlight {
 		compatible = "pwm-backlight";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_gpio_bl_on>;
-		pwms = <&pwm0 0 5000000 0>;
+		pwms = <&pwm0 0 5000000 PWM_NOFLAGS>;
 		enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
 		status = "disabled";
 	};
-- 
2.24.1

