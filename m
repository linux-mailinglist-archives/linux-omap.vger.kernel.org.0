Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C523131111
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2020 12:01:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgAFLBc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Jan 2020 06:01:32 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59304 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgAFLBb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Jan 2020 06:01:31 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 006B1QwA071195;
        Mon, 6 Jan 2020 05:01:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578308486;
        bh=qGDIa1C7368uCdPT8JvrBT2Um7QtvEderkf0WoYtj3A=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=RfKgUOQObm6cuhA2UqXFgTaCluB7WTQ26mCV5dBprKsESzT++RxiBJQaEkdkb6zi2
         i9usFH/XU0rF3gK+e8EGLc/UfJ0zuWuIoyWLn+PgEB75La7q3Od7aWn+Zu6UUgYsJy
         dVx1nK4xGOb6IR3pFdSdWAPEM60689MDn1Mv85FU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 006B1QRC064602
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 6 Jan 2020 05:01:26 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Jan
 2020 05:01:25 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Jan 2020 05:01:25 -0600
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 006B00K1007044;
        Mon, 6 Jan 2020 05:01:19 -0600
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC:     <kishon@ti.com>, <adrian.hunter@intel.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <ulf.hansson@linaro.org>, <tony@atomide.com>,
        <faiz_abbas@ti.com>
Subject: [PATCH v4 10/11] dt-bindings: sdhci-omap: Add am335x and am437x specific bindings
Date:   Mon, 6 Jan 2020 16:31:32 +0530
Message-ID: <20200106110133.13791-11-faiz_abbas@ti.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20200106110133.13791-1-faiz_abbas@ti.com>
References: <20200106110133.13791-1-faiz_abbas@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add binding for the TI's sdhci-omap controller present in am335x and
am437x devices.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-omap.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
index 0f5389c72bda..5a6f74366558 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
@@ -7,6 +7,8 @@ For UHS devices which require tuning, the device tree should have a "cpu_thermal
 Required properties:
 - compatible: Should be "ti,dra7-sdhci" for DRA7 and DRA72 controllers
 	      Should be "ti,k2g-sdhci" for K2G
+	      Should be "ti,am335-sdhci" for am335x controllers
+	      Should be "ti,am437-sdhci" for am437x controllers
 - ti,hwmods: Must be "mmc<n>", <n> is controller instance starting 1
 	     (Not required for K2G).
 - pinctrl-names: Should be subset of "default", "hs", "sdr12", "sdr25", "sdr50",
-- 
2.19.2

