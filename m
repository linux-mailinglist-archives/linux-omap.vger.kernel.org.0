Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20BAB29F296
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 18:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgJ2RHt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Oct 2020 13:07:49 -0400
Received: from sender11-of-o52.zoho.eu ([31.186.226.238]:21351 "EHLO
        sender11-of-o52.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgJ2RHt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Oct 2020 13:07:49 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1603991262; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=DrWCjd8A8I8VOg6blkoDCgjv/XygCbazkfN4WIxCz4ti8B0grxvOa4sJT4aUBLjJlh3p/W7ZdX4O7K1WU+KMX9OBE063oxcbzDK/iEOOWt+a3LQbFQAIBwWT1NTFHe8jNnQ9w9D2084aEsoGbG1XcHgcR25bm0Nxow2bBovlv+E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1603991262; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=hUmFdMI9FUlbejonFGqmp5zK0uMqmROebKXKG1VfQhU=; 
        b=E7jsdI3qzF46NKw+dwZFF8J12lcL3YagK6NaQqm18c08zCojvP2zVAC1Ja9cwaZjG+eWHt2M+fx4HwWM7Dvzz+4BBhTJYbeQ2zoTs62ydM9ZPq81s8Y/NcQOHLPtbkMwh93gjbsAmozoYpCL8hUNw/MKPQkxZ1ZE/huFZsmJi3Q=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-213-32.hsi15.unitymediagroup.de [95.222.213.32]) by mx.zoho.eu
        with SMTPS id 160399126084676.2687301924716; Thu, 29 Oct 2020 18:07:40 +0100 (CET)
Date:   Thu, 29 Oct 2020 18:07:40 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     tony@atomide.com
Cc:     linux-omap@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v2] ARM: dts: motorola-mapphone-common: Add dts
 configureation for the android buttons beneath the screen
Message-Id: <20201029180740.2646dfd6b97fb14a48c309b0@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Uses the touchscreen-buttons driver for the android buttons on the droid 4 / XT894 and droid bionic / XT875

Signed-off-by: Carl Philipp Klemm <carl@uvos.xyz>

---

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
index cef4d8abdaa1..2f78583619b1 100644
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -176,6 +176,39 @@ pwm9: dmtimer-pwm-9 {
 		ti,clock-source = <0x01>;
 	};
 
+	mapphone_touchscreen {
+			compatible = "touchscreen-buttons";
+			touchscreen_phandle = <&touchscreen>;
+			menu {
+				x-position = <0>;
+				y-position = <959>;
+				x-size = <256>;
+				y-size = <65>;
+				keycode = <KEY_F9>;
+			};
+			home {
+				x-position = <256>;
+				y-position = <959>;
+				x-size = <256>;
+				y-size = <65>;
+				keycode = <KEY_F10>;
+			};
+			back {
+				x-position = <512>;
+				y-position = <959>;
+				x-size = <256>;
+				y-size = <65>;
+				keycode = <KEY_F11>;
+			};
+			search {
+				x-position = <768>;
+				y-position = <959>;
+				x-size = <256>;
+				y-size = <65>;
+				keycode = <KEY_SEARCH>;
+			};
+	};
+
 	vibrator {
 		compatible = "pwm-vibrator";
 		pwms = <&pwm9 0 10000000 0>, <&pwm8 0 10000000 0>;
@@ -422,7 +455,7 @@ led@1 {
 };
 
 &i2c2 {
-	touchscreen@4a {
+	touchscreen: touchscreen@4a {
 		compatible = "atmel,maxtouch";
 		reg = <0x4a>;
 		pinctrl-names = "default";
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 80926c919240..aeb79ade844c 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -248,6 +248,7 @@ CONFIG_TOUCHSCREEN_TSC2005=m
 CONFIG_TOUCHSCREEN_TSC2007=m
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_CPCAP_PWRBUTTON=m
+CONFIG_INPUT_TOUCHSCREEN_BUTTONS=m
 CONFIG_INPUT_TPS65218_PWRBUTTON=m
 CONFIG_INPUT_TWL4030_PWRBUTTON=m
 CONFIG_INPUT_UINPUT=m


-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>
