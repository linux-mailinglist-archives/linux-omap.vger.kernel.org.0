Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4EDC19A84C
	for <lists+linux-omap@lfdr.de>; Wed,  1 Apr 2020 11:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727723AbgDAJJM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Apr 2020 05:09:12 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50824 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgDAJJM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Apr 2020 05:09:12 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0319937l056756;
        Wed, 1 Apr 2020 04:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585732143;
        bh=BapP4GEMaD/hKUSz20udM/d8F9FfG6LyZICrAcSFl2c=;
        h=From:To:CC:Subject:Date;
        b=IIJj23PNMe0sCJogXud2CaB/x2DWAOiQIeJzYchJ1JVUXOCg2gT1+iH6Z/oM4NZMp
         GrBjGSvVD0OR5xnj5n+Ugjp3TIibTEXHh7RRvAJDQg/Xss/AjRrEt+qDjE/J7LW+5h
         NnKr/4kJH0r1G89OOknqr8MYMAK0LwCGAcRcFp0g=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 031993CR094643
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 1 Apr 2020 04:09:03 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 1 Apr
 2020 04:09:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 1 Apr 2020 04:09:02 -0500
Received: from a0230074-Latitude-E7470.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03198xRE032742;
        Wed, 1 Apr 2020 04:08:59 -0500
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
CC:     <mark.rutland@arm.com>, <robh+dt@kernel.org>, <tony@atomide.com>,
        <bcousson@baylibre.com>, <faiz_abbas@ti.com>
Subject: [PATCH] ARM: dts: am574x-idk: Disable m_can node
Date:   Wed, 1 Apr 2020 14:38:58 +0530
Message-ID: <20200401090858.18523-1-faiz_abbas@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Since commit bcbb63b80284 ("ARM: dts: dra7: Separate AM57 dtsi files"),
the m_can node was inherited from dra76x.dtsi but the IP is not
connected on the idk board. Disable the node to reflect this.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
---
 arch/arm/boot/dts/am574x-idk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/am574x-idk.dts b/arch/arm/boot/dts/am574x-idk.dts
index fa0088025b2c..85c95cc551dd 100644
--- a/arch/arm/boot/dts/am574x-idk.dts
+++ b/arch/arm/boot/dts/am574x-idk.dts
@@ -40,3 +40,7 @@
 	status = "okay";
 	dual_emac;
 };
+
+&m_can0 {
+	status = "disabled";
+};
-- 
2.17.1

