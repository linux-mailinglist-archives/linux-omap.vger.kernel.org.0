Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAC020466
	for <lists+linux-omap@lfdr.de>; Thu, 16 May 2019 13:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbfEPLQ5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 07:16:57 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49248 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfEPLQ5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 May 2019 07:16:57 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4GBGs60100154;
        Thu, 16 May 2019 06:16:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558005414;
        bh=f28m3td7RAuJx2bgmxcAZ88UoQkB1sJmMOLLQc3SjXA=;
        h=From:To:CC:Subject:Date;
        b=Z7CNeIdk5ocjP5+91SaxBWRk41fCStpEYMg8PhJ5LE5PkwV1TiwfTb18gMHRvN3CB
         8PCaU3ysVc4g5LPxElo+wjp+xBWR+YXa5PMd/Y5xDOWLfnTBoH7ADeb61uXNyA/f2B
         8T2CKEmvY2l8pMHoR35kBOuaxSKyqJu9gT+PvBVk=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4GBGs4i129161
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 May 2019 06:16:54 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 16
 May 2019 06:16:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 16 May 2019 06:16:54 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4GBGofV054965;
        Thu, 16 May 2019 06:16:51 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <tony@atomide.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <t-kristo@ti.com>, <j-keerthy@ti.com>
Subject: [PATCH 1/2] arm: dts: dra71-evm: Disable rtc target module
Date:   Thu, 16 May 2019 16:47:18 +0530
Message-ID: <20190516111719.18567-1-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

rtc is fused out on dra71 and accessing target module
register is causing a boot crash hence disable it.

Fixes: 549fce068a3112 ("ARM: dts: dra7: Add l4 interconnect hierarchy and ti-sysc data")
Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/dra71-evm.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/dra71-evm.dts b/arch/arm/boot/dts/dra71-evm.dts
index 82cc7ec37af0..113afd91e5d7 100644
--- a/arch/arm/boot/dts/dra71-evm.dts
+++ b/arch/arm/boot/dts/dra71-evm.dts
@@ -243,6 +243,10 @@
 	status = "disabled";
 };
 
+&rtctarget {
+	status = "disabled";
+};
+
 /* No RTC on this device */
 &rtc {
 	status = "disabled";
-- 
2.17.1

