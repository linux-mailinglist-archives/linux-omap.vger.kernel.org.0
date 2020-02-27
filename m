Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD2D172B2E
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 23:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730144AbgB0W2w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Feb 2020 17:28:52 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58822 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729868AbgB0W2w (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Feb 2020 17:28:52 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01RMSnH9079926;
        Thu, 27 Feb 2020 16:28:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582842529;
        bh=63cC4NHrfMOkwW/2vuaaWneznyESfcGCTMYxXiBAAk8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=umvKp+2rE+iQ2F53phvPwXv5Ul1BF6xl3jPBqddHystCaJnfriPMfWZzk1Yaa5Em0
         ecx6NPXmbG3o8W/LxxAcSxhv7EEpC8Tv4N0DkQFv1XE5UujFg48R/7zIIuFLGVnWg0
         3wPwUvmwGyVM7uFni35ZxOmA1hfCQooVwvR38clM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RMSnjN056953;
        Thu, 27 Feb 2020 16:28:49 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 27
 Feb 2020 16:28:48 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 27 Feb 2020 16:28:48 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01RMSmIg116902;
        Thu, 27 Feb 2020 16:28:48 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 01RMSmvs087005;
        Thu, 27 Feb 2020 16:28:48 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 1/5] dt-bindings: bus: ti-sysc: Add support for PRUSS SYSC type
Date:   Thu, 27 Feb 2020 16:28:33 -0600
Message-ID: <20200227222837.7329-2-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200227222837.7329-1-s-anna@ti.com>
References: <20200227222837.7329-1-s-anna@ti.com>
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

Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: No changes

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

