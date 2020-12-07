Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C90D2D13D8
	for <lists+linux-omap@lfdr.de>; Mon,  7 Dec 2020 15:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgLGOfd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Dec 2020 09:35:33 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47828 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbgLGOfd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Dec 2020 09:35:33 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B7EXjA3125385;
        Mon, 7 Dec 2020 08:33:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607351625;
        bh=+OKDPT9fbY6653YWWdOGesszKrAEJAtUiWU7Tq7vVDI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=uTdaT+En/yzEKvpqiZLMO00p3XAncCDzIUAC1XqNj+skezIbCNaTpTQNvErgI68lc
         NthOGZdYBrcgiLB5rW+p/+R/0S2PgCs/lKTWev/9Ry2A63fzgYOxRm5H4ManPqEE9x
         TmC0MHRPbwePte9jsYSbeC5jh9eYnfNvmuVKkrs4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B7EXjw9074730
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Dec 2020 08:33:45 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Dec
 2020 08:33:45 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Dec 2020 08:33:45 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B7EXfx1071446;
        Mon, 7 Dec 2020 08:33:44 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/3] ARM: dts: dra76x: add support for OPP_PLUS
Date:   Mon, 7 Dec 2020 16:33:38 +0200
Message-ID: <20201207143339.15674-3-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201207143339.15674-1-t-kristo@ti.com>
References: <20201207143339.15674-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add support for the OPP_PLUS (1.8GHz) for MPU.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/dra76x.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/dra76x.dtsi b/arch/arm/boot/dts/dra76x.dtsi
index 4a2840c0b6ad..c62c83a1e298 100644
--- a/arch/arm/boot/dts/dra76x.dtsi
+++ b/arch/arm/boot/dts/dra76x.dtsi
@@ -140,3 +140,32 @@
 	/* dra76x is not affected by i887 */
 	max-frequency = <96000000>;
 };
+
+&cpu0_opp_table {
+	opp_plus@1800000000 {
+		opp-hz = /bits/ 64 <1800000000>;
+		opp-microvolt = <1250000 950000 1250000>,
+				<1250000 950000 1250000>;
+		opp-supported-hw = <0xFF 0x08>;
+	};
+};
+
+&opp_supply_mpu {
+	ti,efuse-settings = <
+	/* uV   offset */
+	1060000 0x0
+	1160000 0x4
+	1210000 0x8
+	1250000 0xC
+	>;
+};
+
+&abb_mpu {
+	ti,abb_info = <
+	/*uV		ABB	efuse	rbb_m fbb_m	vset_m*/
+	1060000		0	0x0	0 0x02000000 0x01F00000
+	1160000		0	0x4	0 0x02000000 0x01F00000
+	1210000		0	0x8	0 0x02000000 0x01F00000
+	1250000		0	0xC	0 0x02000000 0x01F00000
+	>;
+};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
