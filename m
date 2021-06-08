Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6DFC39EDF3
	for <lists+linux-omap@lfdr.de>; Tue,  8 Jun 2021 07:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhFHFMN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Jun 2021 01:12:13 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44008 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhFHFMN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Jun 2021 01:12:13 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1585AHCh066646;
        Tue, 8 Jun 2021 00:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623129018;
        bh=rtOw4AlXQXAic39VCLdjFPh5Qcjn3HXe0APiZ52YW/w=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=uEyTPvZo2GZnYrBkjL9ik1pfRlofVgvfnztdg2MGpVMsNPx6t7ORLgxPvEPyVwXuT
         KF3D1XSxmayAZLnMMTS+7Gd4rjYd05+YQdeWha296R+LaLY+1UbGsKzbGHBL0ERpzm
         7QHtuHrzR6fSzczR6fHOdMcoygoV6oNseY0r6rJU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1585AHZ9117700
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Jun 2021 00:10:17 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 8 Jun
 2021 00:10:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 8 Jun 2021 00:10:17 -0500
Received: from gsaswath-HP-ProBook-640-G5.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15859wi6129735;
        Tue, 8 Jun 2021 00:10:09 -0500
From:   Aswath Govindraju <a-govindraju@ti.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Uri Mashiach <uri.mashiach@compulab.co.il>,
        Raag Jadav <raagjadav@gmail.com>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] ARM: dts: am335x: align ti,pindir-d0-out-d1-in property with dt-shema
Date:   Tue, 8 Jun 2021 10:39:51 +0530
Message-ID: <20210608050952.14204-2-a-govindraju@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608050952.14204-1-a-govindraju@ti.com>
References: <20210608050952.14204-1-a-govindraju@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

ti,pindir-d0-out-d1-in property is expected to be of type boolean.
Therefore, fix the property accordingly.

Fixes: 444d66fafab8 ("ARM: dts: add spi wifi support to cm-t335")
Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
---
 arch/arm/boot/dts/am335x-cm-t335.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-cm-t335.dts b/arch/arm/boot/dts/am335x-cm-t335.dts
index 36d963db4026..ec4730c82d39 100644
--- a/arch/arm/boot/dts/am335x-cm-t335.dts
+++ b/arch/arm/boot/dts/am335x-cm-t335.dts
@@ -496,7 +496,7 @@ status = "okay";
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>;
-	ti,pindir-d0-out-d1-in = <1>;
+	ti,pindir-d0-out-d1-in;
 	/* WLS1271 WiFi */
 	wlcore: wlcore@1 {
 		compatible = "ti,wl1271";
-- 
2.17.1

