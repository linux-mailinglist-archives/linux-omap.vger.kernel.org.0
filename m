Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0FF45D87D
	for <lists+linux-omap@lfdr.de>; Thu, 25 Nov 2021 11:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354786AbhKYK6p (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Nov 2021 05:58:45 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34602 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350909AbhKYK4m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Nov 2021 05:56:42 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1APArSab076934;
        Thu, 25 Nov 2021 04:53:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1637837608;
        bh=hq+jbBY8FwWxm2D0OQwVWEAEKF4FYNiMLiwTnw33f1A=;
        h=From:To:CC:Subject:Date;
        b=IAdhgLwK3XqnwjZKPkNOBRExXwlsFQAbuXH+KppFZLcCLoS1Q0uoh38rjn8tLtLC5
         oFwa2W/0F9+/jROePUiW0FJWz/wafiKVmCBCl/VXAbDRtyf2it0jKt7L7os7NLpXQm
         k2y6PvNf8rEalrYUXOzLj0VnUdcBpivGe+wH33K8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1APArS73048719
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 25 Nov 2021 04:53:28 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 25
 Nov 2021 04:53:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 25 Nov 2021 04:53:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1APArQTV120557;
        Thu, 25 Nov 2021 04:53:27 -0600
From:   Jayesh Choudhary <j-choudhary@ti.com>
To:     <robh+dt@kernel.org>
CC:     <bcousson@baylibre.com>, <tony@atomide.com>, <j-choudhary@ti.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] ARM: dts: am335x-wega: Fix typo in mcasp property rx-num-evt
Date:   Thu, 25 Nov 2021 16:23:26 +0530
Message-ID: <20211125105326.17000-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix the property name 'rx-num-evt'.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
The modification has not been tested. It needs to be tested
to ensure that there are no regressions.

 arch/arm/boot/dts/am335x-wega.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-wega.dtsi b/arch/arm/boot/dts/am335x-wega.dtsi
index 673159d93a6a..f957fea8208e 100644
--- a/arch/arm/boot/dts/am335x-wega.dtsi
+++ b/arch/arm/boot/dts/am335x-wega.dtsi
@@ -55,7 +55,7 @@
 		2 1 0 0 /* # 0: INACTIVE, 1: TX, 2: RX */
 	>;
 	tx-num-evt = <16>;
-	rt-num-evt = <16>;
+	rx-num-evt = <16>;
 	status = "okay";
 };
 
-- 
2.17.1

