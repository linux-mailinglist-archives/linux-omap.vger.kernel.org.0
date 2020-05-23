Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 544431DF879
	for <lists+linux-omap@lfdr.de>; Sat, 23 May 2020 19:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388051AbgEWRJa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 23 May 2020 13:09:30 -0400
Received: from foss.arm.com ([217.140.110.172]:53006 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388017AbgEWRJP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 23 May 2020 13:09:15 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCA93139F;
        Sat, 23 May 2020 10:09:14 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BB0CC3F305;
        Sat, 23 May 2020 10:09:13 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: [PATCH 7/8] ARM: OMAP2: Switch to use DEVICE_ATTR_RO()
Date:   Sat, 23 May 2020 18:08:58 +0100
Message-Id: <20200523170859.50003-8-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200523170859.50003-1-sudeep.holla@arm.com>
References: <20200523170859.50003-1-sudeep.holla@arm.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Move device attributes to DEVICE_ATTR_RO() as that would make things
a lot more "obvious" what is happening over the existing __ATTR usage.

Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm/mach-omap2/id.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-omap2/id.c b/arch/arm/mach-omap2/id.c
index 188ea5258c99..37ac2d103548 100644
--- a/arch/arm/mach-omap2/id.c
+++ b/arch/arm/mach-omap2/id.c
@@ -775,15 +775,13 @@ static const char * __init omap_get_family(void)
 		return kasprintf(GFP_KERNEL, "Unknown");
 }
 
-static ssize_t omap_get_type(struct device *dev,
-					struct device_attribute *attr,
-					char *buf)
+static ssize_t
+type_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%s\n", omap_types[omap_type()]);
 }
 
-static struct device_attribute omap_soc_attr =
-	__ATTR(type,  S_IRUGO, omap_get_type,  NULL);
+static DEVICE_ATTR_RO(type);
 
 void __init omap_soc_device_init(void)
 {
@@ -806,6 +804,6 @@ void __init omap_soc_device_init(void)
 	}
 
 	parent = soc_device_to_device(soc_dev);
-	device_create_file(parent, &omap_soc_attr);
+	device_create_file(parent, &dev_attr_type);
 }
 #endif /* CONFIG_SOC_BUS */
-- 
2.17.1

