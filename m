Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2548F20468
	for <lists+linux-omap@lfdr.de>; Thu, 16 May 2019 13:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfEPLRB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 07:17:01 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50310 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfEPLRA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 May 2019 07:17:00 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4GBGvoF124526;
        Thu, 16 May 2019 06:16:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558005417;
        bh=P1f0kifTA8DR7BFxYERkxjpGw5zFt1N+FpSR3a73S24=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Bqy2CFH99s8FEYtQJoS3QeRS+Op6pCb9ia9+C73Wtc6e3SC3F5zESEE50bex2orKG
         iHZ5Wd64s3voAgmi6A7Kc0qJ0mGajGexwzy9mPkre8YvI0Gcw8P9rAmUmnTFp1WZBN
         l5YiMqod9fLHKDqcDLZYffq2J0BJCzlkKk4zAhu4=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4GBGvaD129201
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 May 2019 06:16:57 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 16
 May 2019 06:16:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 16 May 2019 06:16:57 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4GBGofW054965;
        Thu, 16 May 2019 06:16:54 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <tony@atomide.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <t-kristo@ti.com>, <j-keerthy@ti.com>
Subject: [PATCH 2/2] arm: dts: dra71-evm: Disable usb4_tm target module
Date:   Thu, 16 May 2019 16:47:19 +0530
Message-ID: <20190516111719.18567-2-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516111719.18567-1-j-keerthy@ti.com>
References: <20190516111719.18567-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

usb4_tm is unsed on dra71 and accessing the module
with ti,sysc is causing a boot crash hence disable its target
module.

Fixes: 549fce068a3112 ("ARM: dts: dra7: Add l4 interconnect hierarchy and ti-sysc data")
Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/dra71-evm.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/dra71-evm.dts b/arch/arm/boot/dts/dra71-evm.dts
index 113afd91e5d7..2ae1a478fb34 100644
--- a/arch/arm/boot/dts/dra71-evm.dts
+++ b/arch/arm/boot/dts/dra71-evm.dts
@@ -277,3 +277,7 @@
 &extcon_usb2 {
 	vbus-gpio = <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
 };
+
+&usb4_tm {
+	status = "disabled";
+};
-- 
2.17.1

