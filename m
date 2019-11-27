Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D95F10B276
	for <lists+linux-omap@lfdr.de>; Wed, 27 Nov 2019 16:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfK0Pc2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Nov 2019 10:32:28 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35340 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbfK0Pc2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Nov 2019 10:32:28 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xARFWPfd047035;
        Wed, 27 Nov 2019 09:32:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574868745;
        bh=dSfhtkR87DyqUv4DqxoqOVaAaHUJOoEd9aHCeG3B9m8=;
        h=From:To:CC:Subject:Date;
        b=gCbfHWRqDaiGuECgH+TnsybWdpPyqO6OP7plyWiqxBHu1/mZBH5mQB3KNw4Ff4EII
         ozz1ElmqUEii0IRrupz1BxD0Vb2dgkFzpQsx203TGOJnZPxrIqD+HUK+9afWacVGks
         3pddJWUXZc1/kstM6cH0qpyx3XtkNjbQ503YnaR8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xARFWP3X014617
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 27 Nov 2019 09:32:25 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 27
 Nov 2019 09:32:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 27 Nov 2019 09:32:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xARFWOaK071512;
        Wed, 27 Nov 2019 09:32:24 -0600
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] ARM: dts: omap3: name mdio node properly
Date:   Wed, 27 Nov 2019 17:32:12 +0200
Message-ID: <20191127153212.22209-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Rename davinci_mdio DT node "ethernet"->"mdio"
This fixes the following DT schemas check errors:
am3517-craneboard.dt.yaml: ethernet@5c030000: $nodename:0: 'ethernet@5c030000' does not match '^mdio(@.*)?'

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/am3517.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
index 76f819f4ba48..84e13778a64a 100644
--- a/arch/arm/boot/dts/am3517.dtsi
+++ b/arch/arm/boot/dts/am3517.dtsi
@@ -74,7 +74,7 @@
 			clock-names = "ick";
 		};
 
-		davinci_mdio: ethernet@5c030000 {
+		davinci_mdio: mdio@5c030000 {
 			compatible = "ti,davinci_mdio";
 			ti,hwmods = "davinci_mdio";
 			status = "disabled";
-- 
2.17.1

