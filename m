Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73D6297389
	for <lists+linux-omap@lfdr.de>; Fri, 23 Oct 2020 18:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750429AbgJWQYU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Oct 2020 12:24:20 -0400
Received: from sender11-of-o52.zoho.eu ([31.186.226.238]:21390 "EHLO
        sender11-of-o52.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750423AbgJWQYT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 23 Oct 2020 12:24:19 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1603469348; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=XW3oMG56rQi8zaf4xHGKBwXQWFJfs6ZsqgSNwHiLGedSaGsNpMvJVBag2LCWOTDtaYpAvdW6f5fxG6cVbEvPz6QzOgtWiuEDtiSlUcg0ob7xyf2hlqCmF4syv1B9aMimoG7mGR2noJGi/M0QsECAs3YFS5t6Xje+Xgw0T4k0hZY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1603469348; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=NDowHwUvFqB0GPlCwCGRwhegZU8IPUBPHwsJXkE+Wzo=; 
        b=V1op7Vi+FXWzoV+Z7QgOjlwrz31Bt77qO6S66TrXs6X69oAio/LkbDF9MiAGBOBAHUYorJxfBcxz7WlN9Evqnk5KXpFR2/qiEpIib1FQnTi6UEd6NnWCpf6fyYLYjo3W9xSqgRBiBzVcSJfB/plr1ngIR14GLWyS/0IzL715OC4=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-212-41.hsi15.unitymediagroup.de [95.222.212.41]) by mx.zoho.eu
        with SMTPS id 1603469345892865.4597929017848; Fri, 23 Oct 2020 18:09:05 +0200 (CEST)
Date:   Fri, 23 Oct 2020 18:09:02 +0200
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     robh+dt@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2]  ARM: dts: xt875: Improve dts support for Motorola
 XT875
Message-Id: <20201023180902.45afa3cad97a11e563ff8110@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add section and support for kionix kxtf9 on XT875

Signed-off-by: Carl Philipp Klemm <carl@uvos.xyz>

---
 arch/arm/boot/dts/omap4-droid-bionic-xt875.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts b/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts
index 49b2a8d55356..271a43827cbf 100644
--- a/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts
+++ b/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts
@@ -37,3 +37,19 @@ backlight_led: led@0 {
 		};
 	};
 };
+
+&i2c4 {
+	lis3dh: accelerometer@18 {
+		compatible = "kionix,kxtf9";
+		reg = <0x0f>;
+
+		vdd-supply = <&vhvio>;
+
+		interrupt-parent = <&gpio2>;
+		interrupts = <2 IRQ_TYPE_EDGE_RISING>;
+
+		rotation-matrix = "0", "-1", "0",
+				  "1", "0", "0",
+				  "0", "0", "1";
+	};
+};
-- 
2.28.0

-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>
