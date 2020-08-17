Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F65824725C
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 20:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730693AbgHQSlg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 14:41:36 -0400
Received: from sender11-of-o53.zoho.eu ([31.186.226.239]:21856 "EHLO
        sender11-of-o53.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730677AbgHQP5Z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 11:57:25 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1597678928; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=lkv1/CzyRzokpV5P362lTkMGPTcbdNkHtO4VR+mndGq8p1w/9JjBzzVHVPqoGnWVoVfzAqXXaNFY7OxdPFiRPFnNnmPStGMsotJv7v3fsznf72L9wRMJz10WuhW+8Kd3hZkZ/dRhLY5BfNRvhDuGCePbHgNjVzxMeNN1hEpJMXw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1597678928; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=zFq0cwIqpAd0SCMBlmuzmsuIgtncaqbmV+L/FCcGivk=; 
        b=Y4ZQQfoIkXyw13ls8XLRkUbVLMYc4k6PAXkHsVwvPt8BSKofMu7Vk32LnvkCbwlOM5GuWtthez0sf6CbclMgxPY7fycjKtaXq8API8QuEpcAPd56u5HURIbrScN2tXRb+4IT3mrNvtsm4w5e3lFkNt/qXxVr2GaG5/UGISfv+vo=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=devnull@uvos.xyz;
        dmarc=pass header.from=<devnull@uvos.xyz> header.from=<devnull@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-214-71.hsi15.unitymediagroup.de [95.222.214.71]) by mx.zoho.eu
        with SMTPS id 1597678926806512.0089999106973; Mon, 17 Aug 2020 17:42:06 +0200 (CEST)
Date:   Mon, 17 Aug 2020 17:41:37 +0200
From:   Dev Null <devnull@uvos.xyz>
To:     linux-omap@vger.kernel.org
Cc:     linux-input@vger.kernel.org
Subject: ARM: dts: motorola-mapphone-common: Add dts configureation for the
 android buttons beneath the screen
Message-Id: <20200817174137.554be5c0589e535b71f4d753@uvos.xyz>
Organization: UVOS Organization
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Uses the touchscreen-buttons driver for the android buttons on the droid 4

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
index cef4d8abdaa1..455e6b624802 100644
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -176,6 +176,40 @@ pwm9: dmtimer-pwm-9 {
 		ti,clock-source = <0x01>;
 	};
 
+	mapphone_touchscreen {
+			/* keycodes must be >255 or the kernel vt will hold the device open wasteing power */
+			compatible = "touchscreen-buttons";
+			touchscreen_phandle = <&touchscreen>;
+			menu {
+				x-position = <0>;
+				y-position = <950>;
+				x-size = <256>;
+				y-size = <74>;
+				keycode = <KEY_KBD_LCD_MENU1>;
+			};
+			home {
+				x-position = <256>;
+				y-position = <950>;
+				x-size = <256>;
+				y-size = <74>;
+				keycode = <KEY_KBD_LCD_MENU2>;
+			};
+			back {
+				x-position = <512>;
+				y-position = <950>;
+				x-size = <256>;
+				y-size = <74>;
+				keycode = <KEY_KBD_LCD_MENU3>;
+			};
+			search {
+				x-position = <768>;
+				y-position = <950>;
+				x-size = <256>;
+				y-size = <74>;
+				keycode = <KEY_KBD_LCD_MENU4>;
+			};
+	};
+
 	vibrator {
 		compatible = "pwm-vibrator";
 		pwms = <&pwm9 0 10000000 0>, <&pwm8 0 10000000 0>;
@@ -422,7 +456,7 @@ led@1 {
 };
 
 &i2c2 {
-	touchscreen@4a {
+	touchscreen: touchscreen@4a {
 		compatible = "atmel,maxtouch";
 		reg = <0x4a>;
 		pinctrl-names = "default";
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index d397ad4006f2..bd15ad5278d9 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -249,6 +249,7 @@ CONFIG_TOUCHSCREEN_TSC2005=m
 CONFIG_TOUCHSCREEN_TSC2007=m
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_CPCAP_PWRBUTTON=m
+CONFIG_INPUT_TOUCHSCREEN_BUTTONS=m
 CONFIG_INPUT_TPS65218_PWRBUTTON=m
 CONFIG_INPUT_TWL4030_PWRBUTTON=m
 CONFIG_INPUT_UINPUT=m

-- 
Dev Null <devnull@uvos.xyz>
