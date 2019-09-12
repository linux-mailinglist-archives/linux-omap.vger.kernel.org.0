Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2819B0FD1
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 15:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732103AbfILN0c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 09:26:32 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58654 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732098AbfILN0c (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 09:26:32 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQPAX098827;
        Thu, 12 Sep 2019 08:26:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568294785;
        bh=lAooCRUVMyzHhADwC9qZkva36ihXtVfNEPnWC8n4rlE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=xa4D904r3oRK+1nEn52YVgjGmPidk5ijrBjzLkWOvyTmR7rVxeOglRiNFtZfUcPFc
         HPEbt19lBHXtJ/NoV56yvBVtKc3/wNY/n/j01u64WRM2zrVt+CoYep2ufJ/VnCJRHa
         P4bf7EKEwNAjBr7i9XTJqKL56tnezMGyWOFxpW38=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQPNl071069;
        Thu, 12 Sep 2019 08:26:25 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 08:26:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 08:26:25 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQFvT130575;
        Thu, 12 Sep 2019 08:26:23 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCHv3 04/10] dt-bindings: clk: add omap5 iva clkctrl definitions
Date:   Thu, 12 Sep 2019 16:26:07 +0300
Message-ID: <20190912132613.28093-5-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912132613.28093-1-t-kristo@ti.com>
References: <20190912132613.28093-1-t-kristo@ti.com>
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
