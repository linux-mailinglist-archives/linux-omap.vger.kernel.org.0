Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3914055C54
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2019 01:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfFYXdX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jun 2019 19:33:23 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47990 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbfFYXdX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jun 2019 19:33:23 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5PNXLBn068434;
        Tue, 25 Jun 2019 18:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561505601;
        bh=AVzFWkxY/+TevUuXjAygsKiDupRzaJUJJKQUGkuCQpQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=TfOi+l6FOdAqxdrtstrC37sGrndaNQ0vbz1jcwQEUx8j0d/mbDeg/Re7r9mW8jHKC
         Dy6U5vKYPeCIMOmelSvMMCdI2Rt2o5GBd+K/pTPVz2zj9Dw+/5cxHk248C5sJwika2
         fX/PoSLTSbttXSLyIiohmtl4BTXWnraSidbv1GMU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5PNXLNZ010781
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Jun 2019 18:33:21 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 25
 Jun 2019 18:33:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 25 Jun 2019 18:33:21 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5PNXL2i125252;
        Tue, 25 Jun 2019 18:33:21 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x5PNXLm12241;
        Tue, 25 Jun 2019 18:33:21 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 3/5] bus: ti-sysc: Switch to SPDX license identifier
Date:   Tue, 25 Jun 2019 18:33:13 -0500
Message-ID: <20190625233315.22301-4-s-anna@ti.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625233315.22301-1-s-anna@ti.com>
References: <20190625233315.22301-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use the appropriate SPDX license identifier in the TI sysc
interconnect target driver source files and drop the previous
boilerplate license text. Also, add the the SPDX license
identifier in the associated ti-sysc header files.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/bus/ti-sysc.c                 | 10 +---------
 include/linux/platform_data/ti-sysc.h |  2 ++
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index e6deabd8305d..3030c9eadfb1 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1,14 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * ti-sysc.c - Texas Instruments sysc interconnect target driver
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/io.h>
diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
index 0c587d4fc718..7d009dc08a54 100644
--- a/include/linux/platform_data/ti-sysc.h
+++ b/include/linux/platform_data/ti-sysc.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
 #ifndef __TI_SYSC_DATA_H__
 #define __TI_SYSC_DATA_H__
 
-- 
2.21.0

