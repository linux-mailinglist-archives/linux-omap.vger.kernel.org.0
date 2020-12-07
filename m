Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDF642D13D0
	for <lists+linux-omap@lfdr.de>; Mon,  7 Dec 2020 15:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgLGOew (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Dec 2020 09:34:52 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47832 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgLGOev (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Dec 2020 09:34:51 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B7EXluF125390;
        Mon, 7 Dec 2020 08:33:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607351627;
        bh=MJos2+CA9zS6YMd/NIbvlP8uOhKhbJzAhTGRUtPT890=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=NLIuQv0/JOPkh7E8Q5AlSJkDvTXLZEFoRL20nFQVyLNoJbqfkndTnEY6OM1xakeaj
         /46sr6maIKX0qofVvdwga8V1VLMhXUUCzw5rXnqZn5dCt0cYsJN5fHH/vT/iPOmkm7
         5Uc7bf+0bLlSpYsDDrCW+m9GafBIi0NGskwNr2Lc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B7EXlo7075077
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Dec 2020 08:33:47 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Dec
 2020 08:33:46 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Dec 2020 08:33:46 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B7EXfx2071446;
        Mon, 7 Dec 2020 08:33:45 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 3/3] ARM: dts: dra71-evm: mark ldo0 regulator as always on
Date:   Mon, 7 Dec 2020 16:33:39 +0200
Message-ID: <20201207143339.15674-4-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201207143339.15674-1-t-kristo@ti.com>
References: <20201207143339.15674-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

LDO0 regulator must remain enabled always on dra71-evm boards. Disabling
this violates the data manual and will damage the device over time.

Reported-by: Brad Griffis <bgriffis@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Reviewed-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/dra71-evm.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/dra71-evm.dts b/arch/arm/boot/dts/dra71-evm.dts
index cad58f733bd6..6d2cca6b4488 100644
--- a/arch/arm/boot/dts/dra71-evm.dts
+++ b/arch/arm/boot/dts/dra71-evm.dts
@@ -112,6 +112,8 @@
 				regulator-name = "lp8733-ldo0";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
 			};
 
 			lp8733_ldo1_reg: ldo1 {
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
