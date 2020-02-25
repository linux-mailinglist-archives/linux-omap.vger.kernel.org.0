Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8A8E16F072
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 21:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729765AbgBYUq7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Feb 2020 15:46:59 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47388 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728847AbgBYUq6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Feb 2020 15:46:58 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01PKkuW6117213;
        Tue, 25 Feb 2020 14:46:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582663616;
        bh=IBcnW0j8YJKkAvVMwDo1qdY20Qq2L6G9BlQ+7hZpKMA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Ut9PFhHNrfXtWVws7xzEdhlSQmIm014xhwQVfdKLX92zKA2yielA+dVgRqDp04ewg
         YsP2Ue4TGECxXswKEBqSD1HADMJH6cacFOcKGKTuJ4tLvTt/UGYk7HOKv9lBTrO2Xq
         IqvX2D9wzO3WpNsAk9A1uLevI6t+01ihiB2qMs8k=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01PKkugm022016
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Feb 2020 14:46:56 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 25
 Feb 2020 14:46:56 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 25 Feb 2020 14:46:56 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01PKktZj108197;
        Tue, 25 Feb 2020 14:46:56 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 01PKktGK025460;
        Tue, 25 Feb 2020 14:46:55 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 01/12] dt-bindings: bus: ti-sysc: Add support for PRUSS SYSC type
Date:   Tue, 25 Feb 2020 14:46:38 -0600
Message-ID: <20200225204649.28220-2-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225204649.28220-1-s-anna@ti.com>
References: <20200225204649.28220-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Roger Quadros <rogerq@ti.com>

The PRUSS module has a SYSCFG which is unique. The SYSCFG
has two additional unique fields called STANDBY_INIT and
SUB_MWAIT in addition to regular IDLE_MODE and STANDBY_MODE
fields. Add the bindings for this new sysc type.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 Documentation/devicetree/bindings/bus/ti-sysc.txt | 1 +
 include/dt-bindings/bus/ti-sysc.h                 | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/ti-sysc.txt b/Documentation/devicetree/bindings/bus/ti-sysc.txt
index 233eb8294204..c984143d08d2 100644
--- a/Documentation/devicetree/bindings/bus/ti-sysc.txt
+++ b/Documentation/devicetree/bindings/bus/ti-sysc.txt
@@ -38,6 +38,7 @@ Required standard properties:
 		"ti,sysc-dra7-mcasp"
 		"ti,sysc-usb-host-fs"
 		"ti,sysc-dra7-mcan"
+		"ti,sysc-pruss"
 
 - reg		shall have register areas implemented for the interconnect
 		target module in question such as revision, sysc and syss
diff --git a/include/dt-bindings/bus/ti-sysc.h b/include/dt-bindings/bus/ti-sysc.h
index babd08a1d226..76b07826ed05 100644
--- a/include/dt-bindings/bus/ti-sysc.h
+++ b/include/dt-bindings/bus/ti-sysc.h
@@ -18,6 +18,10 @@
 
 #define SYSC_DRA7_MCAN_ENAWAKEUP	(1 << 4)
 
+/* PRUSS sysc found on AM33xx/AM43xx/AM57xx */
+#define SYSC_PRUSS_SUB_MWAIT		(1 << 5)
+#define SYSC_PRUSS_STANDBY_INIT		(1 << 4)
+
 /* SYSCONFIG STANDBYMODE/MIDLEMODE/SIDLEMODE supported by hardware */
 #define SYSC_IDLE_FORCE			0
 #define SYSC_IDLE_NO			1
-- 
2.23.0

