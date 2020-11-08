Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFAB22AACDF
	for <lists+linux-omap@lfdr.de>; Sun,  8 Nov 2020 19:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728611AbgKHSnr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 8 Nov 2020 13:43:47 -0500
Received: from sender11-of-o52.zoho.eu ([31.186.226.238]:21305 "EHLO
        sender11-of-o52.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgKHSnr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 8 Nov 2020 13:43:47 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1604861021; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=hXbYSwv04y/14ecbXwkf3fRVmkCmDCJaXSLSGvq4erLurdZ5phDIBF+bNGDT7QvYhFjpMm1HOWnTUtcmlP7LwZm+QZGbxZ50ar4aoEF0a+g0OE27d3bVZ443nCGbZIGP3lC1hdpcikvaX3b0sVJctnZU6lRFcWFly9L6H+29mLI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1604861021; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=cXT44qNLRuFoV09Y0YjBFp0A+FbBxcTADodfzKEErlU=; 
        b=TNhAnd+qdq7dM+0C8s3xZrD+mqHfn2OsQZCPfguMb4R2v81nw4b+voCZhMNsNZ2S+WtdNGJHCIZObCPqBl68cnE8KzX/dVIzYf8K95/ADVLYRWGoTf8Z+VE7gaHa8RiH4VnBBK6X+HF5GVgj+eEbVSvEXytROCvLNjNh5OZkrzw=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-213-200.hsi15.unitymediagroup.de [95.222.213.200]) by mx.zoho.eu
        with SMTPS id 1604861019556942.7990846574305; Sun, 8 Nov 2020 19:43:39 +0100 (CET)
Date:   Sun, 8 Nov 2020 19:43:39 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Tony Lindgren <tony@atomide.com>, robh+dt@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3] ARM: dts: xt875: add section for kionix kxtf9
Message-Id: <20201108194339.aa6518a3d67f3b00380e8326@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

ARM: dts: xt875: add section for kionix kxtf9

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 arch/arm/boot/dts/omap4-droid-bionic-xt875.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

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
+	kxtf9: accelerometer@f {
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
2.29.1
