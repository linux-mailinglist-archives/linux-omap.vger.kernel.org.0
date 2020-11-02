Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23EE12A2960
	for <lists+linux-omap@lfdr.de>; Mon,  2 Nov 2020 12:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgKBL2O (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Nov 2020 06:28:14 -0500
Received: from sender11-of-o52.zoho.eu ([31.186.226.238]:21313 "EHLO
        sender11-of-o52.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728663AbgKBLYe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Nov 2020 06:24:34 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1604316261; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=PFoKwFqdJpepjBUFup8LF+v08JRH/79asMXPccxMyUUGlH+3hYS+63tBM0wnR49l8IGbO9GMawKDcr4Uw+kFtbMOr3yj8lTD34+tw4JOAxc2I9GwE3lLrEv4jbY3rTXM4EVfvk5BBDqP38LN5KI32jclUKk6mLUX5vFOZTCE6i4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1604316261; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=DFhmXJGFBPCJXLqmTX/eOCUbFqBy5p/5Ekmh2Ip/Q18=; 
        b=RBLtEb3euHTgfW5W8iv5csEMnuy+K7ygJe2zJq/JSVNdii9ysa9WtRF/hWPqLQL7Fu0EzLVVkTN/oSB6SKkZ7V/ZjwRASIzJnSbLExKb1+7HHWw5INOywhM8N+xR4uFhgjSJ7EzJlDbtZ7bBKrsQ+v9g8evqb2Yrh4j+0kQ4t3Y=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-213-220.hsi15.unitymediagroup.de [95.222.213.220]) by mx.zoho.eu
        with SMTPS id 1604316259439776.7982178858423; Mon, 2 Nov 2020 12:24:19 +0100 (CET)
Date:   Mon, 2 Nov 2020 12:24:18 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Tony Lindgren <tony@atomide.com>, robh+dt@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2] ARM: dts: xt875: Add section and support for kionix
 kxtf9 on XT875
Message-Id: <20201102122418.caefbcc524874a6b1fc9497e@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Adds section and support for kionix kxtf9 on XT875

Signed-off-by: Carl Philipp Klemm <carl@uvos.xyz>

---

diff --git a/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts b/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts
index 49b2a8d55356..ccf03a743678 100644
--- a/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts
+++ b/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts
@@ -37,3 +37,19 @@ backlight_led: led@0 {
                };
        };
 };
+
+&i2c4 {
+       kxtf9: accelerometer@f {
+               compatible = "kionix,kxtf9";
+               reg = <0x0f>;
+
+               vdd-supply = <&vhvio>;
+
+               interrupt-parent = <&gpio2>;
+               interrupts = <2 IRQ_TYPE_EDGE_RISING>;
+
+               rotation-matrix = "0", "-1", "0",
+                                 "1", "0", "0",
+                                 "0", "0", "1";
+       };
+};


-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>
