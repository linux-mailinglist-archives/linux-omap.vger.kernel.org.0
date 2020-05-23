Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2371DF871
	for <lists+linux-omap@lfdr.de>; Sat, 23 May 2020 19:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388026AbgEWRJR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 23 May 2020 13:09:17 -0400
Received: from foss.arm.com ([217.140.110.172]:53016 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388022AbgEWRJQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 23 May 2020 13:09:16 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE7B21FB;
        Sat, 23 May 2020 10:09:15 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF7C63F305;
        Sat, 23 May 2020 10:09:14 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: [PATCH 8/8] ARM: OMAP2: Use custom soc attribute group instead of device_create_file
Date:   Sat, 23 May 2020 18:08:59 +0100
Message-Id: <20200523170859.50003-9-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200523170859.50003-1-sudeep.holla@arm.com>
References: <20200523170859.50003-1-sudeep.holla@arm.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit c31e73121f4c ("base: soc: Handle custom soc information sysfs
entries") introduced custom soc attribute group in soc_device_attribute
structure but there are no users treewide. While trying to understand
the motivation and tried to use it, it was found lot of existing custom
attributes can moved to use it instead of device_create_file.

Though most of these never remove/cleanup the custom attribute as they
never call soc_device_unregister, using these custom attribute group
eliminate the need for any cleanup as the driver infrastructure will
take care of that.

Let us remove device_create_file and start using the custom attribute
group in soc_device_attribute.

Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm/mach-omap2/id.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-omap2/id.c b/arch/arm/mach-omap2/id.c
index 37ac2d103548..1d119b974f5f 100644
--- a/arch/arm/mach-omap2/id.c
+++ b/arch/arm/mach-omap2/id.c
@@ -783,9 +783,15 @@ type_show(struct device *dev, struct device_attribute *attr, char *buf)
 
 static DEVICE_ATTR_RO(type);
 
+static struct attribute *omap_soc_attrs[] = {
+	&dev_attr_type.attr,
+	NULL
+};
+
+ATTRIBUTE_GROUPS(omap_soc);
+
 void __init omap_soc_device_init(void)
 {
-	struct device *parent;
 	struct soc_device *soc_dev;
 	struct soc_device_attribute *soc_dev_attr;
 
@@ -796,14 +802,12 @@ void __init omap_soc_device_init(void)
 	soc_dev_attr->machine  = soc_name;
 	soc_dev_attr->family   = omap_get_family();
 	soc_dev_attr->revision = soc_rev;
+	soc_dev_attr->custom_attr_group = omap_soc_groups[0];
 
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev)) {
 		kfree(soc_dev_attr);
 		return;
 	}
-
-	parent = soc_device_to_device(soc_dev);
-	device_create_file(parent, &dev_attr_type);
 }
 #endif /* CONFIG_SOC_BUS */
-- 
2.17.1

