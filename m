Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05A18211AE
	for <lists+linux-omap@lfdr.de>; Fri, 17 May 2019 03:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfEQBNx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 21:13:53 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58554 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbfEQBNx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 May 2019 21:13:53 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4H1DnWs062994;
        Thu, 16 May 2019 20:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558055629;
        bh=lxvLtglNyQ5FLKKiOCSZwU8p+Syssdw9VMSmFofX/+0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=NsUjAHxq28vu3k73HEa/1mcyMMWfEtlH2WIYQkruBcSiIRoMc7HShJ3gjDc3AkV4A
         7g21vWKxqDgNvbOrrnmQbSlwYKsk/BSj7IZKQiExj9jmzdY2Za0++6Q/8peZtrckj0
         5C14/xCkqefVJe9lt7dZljqdVPh7/S20xPHcvg/w=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4H1DnJb005409
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 May 2019 20:13:49 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 16
 May 2019 20:13:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 16 May 2019 20:13:49 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4H1Dch3032414;
        Thu, 16 May 2019 20:13:47 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <tony@atomide.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <t-kristo@ti.com>, <j-keerthy@ti.com>
Subject: [PATCH v2 4/4] arm: dts: dra71x: Disable usb4_tm target module
Date:   Fri, 17 May 2019 06:44:09 +0530
Message-ID: <20190517011409.22167-5-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517011409.22167-1-j-keerthy@ti.com>
References: <20190517011409.22167-1-j-keerthy@ti.com>
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
 arch/arm/boot/dts/dra71x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/dra71x.dtsi b/arch/arm/boot/dts/dra71x.dtsi
index aad7394902a6..695a08ed0360 100644
--- a/arch/arm/boot/dts/dra71x.dtsi
+++ b/arch/arm/boot/dts/dra71x.dtsi
@@ -11,3 +11,7 @@
 &rtctarget {
 	status = "disabled";
 };
+
+&usb4_tm {
+	status = "disabled";
+};
-- 
2.17.1

