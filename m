Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 792229FB02
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 08:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfH1G7r (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 02:59:47 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:58060 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfH1G7r (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 02:59:47 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S6xjQi120643;
        Wed, 28 Aug 2019 01:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566975585;
        bh=lAooCRUVMyzHhADwC9qZkva36ihXtVfNEPnWC8n4rlE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=e5olAih1m1iQQE+2h+LNUNaAgqigAaR3xF01rYn6Ydqvm9rDs7pLgENyculJOhx31
         A0J+o+zvCNSm18rg/TM+Av0/xkvyVuBiEeZL8SPUyEfAWZ9mO7+M/KEUrPuDB5y6c3
         5mhwH+lGTEZJRycz27ec7sYYB6R7AcGGfn3CMq0g=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S6xiJm129571
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 01:59:45 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 01:59:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 01:59:44 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S6xXVF074399;
        Wed, 28 Aug 2019 01:59:43 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCHv2 5/6] dt-bindings: clk: add omap5 iva clkctrl definitions
Date:   Wed, 28 Aug 2019 09:59:28 +0300
Message-ID: <20190828065929.32150-6-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828065929.32150-1-t-kristo@ti.com>
References: <20190828065929.32150-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

OMAP5 device contains an IVA subsystem (Image and Video Accelerator.)
IVA subsystem clkctrl definitions are currently missing, so add them.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 include/dt-bindings/clock/omap5.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/omap5.h b/include/dt-bindings/clock/omap5.h
index f3283957f48d..eb6d2fbe78f9 100644
--- a/include/dt-bindings/clock/omap5.h
+++ b/include/dt-bindings/clock/omap5.h
@@ -86,6 +86,10 @@
 #define OMAP5_UART5_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x170)
 #define OMAP5_UART6_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x178)
 
+/* iva clocks */
+#define OMAP5_IVA_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
+#define OMAP5_SL2IF_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x28)
+
 /* dss clocks */
 #define OMAP5_DSS_CORE_CLKCTRL	OMAP5_CLKCTRL_INDEX(0x20)
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
