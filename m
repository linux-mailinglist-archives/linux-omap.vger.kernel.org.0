Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2590655C57
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2019 01:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfFYXd1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jun 2019 19:33:27 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:34982 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbfFYXdY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jun 2019 19:33:24 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5PNXK5R129965;
        Tue, 25 Jun 2019 18:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561505600;
        bh=AaEn5VvOrQB7kVbGaukqdgkiZnAJFPhqYV6Oez60VOU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JLrXHLUQRBKIi1tOwDABAyG48AytLCkkOx23UB/5yfx+9Hxde3TR7VgmDfehpHcUl
         lPDRoBqGbthGwWyMX2UWePLVPSHNbUs/yQUxwI+l1i5u6GLMh9YDnqBJzjgFWqPiFQ
         RxfpXAjJI56EZ1u4WUk2Npu8fvtS3INWRKBhsmZg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5PNXKiV074235
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Jun 2019 18:33:20 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 25
 Jun 2019 18:33:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 25 Jun 2019 18:33:20 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5PNXKAU089301;
        Tue, 25 Jun 2019 18:33:20 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x5PNXJm12214;
        Tue, 25 Jun 2019 18:33:19 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/5] MAINTAINERS: Add ti-sysc files under the OMAP2+ entry
Date:   Tue, 25 Jun 2019 18:33:11 -0500
Message-ID: <20190625233315.22301-2-s-anna@ti.com>
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

Add the ti-sysc source files under the OMAP2+ entry so that
the get_maintainer script also generates the linux-omap
list to be cc'd for all patches touching these files.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d0ed735994a5..d45c456bc051 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11526,6 +11526,7 @@ S:	Maintained
 F:	arch/arm/mach-omap2/
 F:	arch/arm/plat-omap/
 F:	arch/arm/configs/omap2plus_defconfig
+F:	drivers/bus/ti-sysc.c
 F:	drivers/i2c/busses/i2c-omap.c
 F:	drivers/irqchip/irq-omap-intc.c
 F:	drivers/mfd/*omap*.c
@@ -11546,6 +11547,7 @@ F:	drivers/regulator/tps65910-regulator.c
 F:	drivers/regulator/twl-regulator.c
 F:	drivers/regulator/twl6030-regulator.c
 F:	include/linux/platform_data/i2c-omap.h
+F:	include/linux/platform_data/ti-sysc.h
 
 ONION OMEGA2+ BOARD
 M:	Harvey Hunt <harveyhuntnexus@gmail.com>
-- 
2.21.0

