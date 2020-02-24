Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF16716B533
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbgBXXVt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:21:49 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59844 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728522AbgBXXVm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:21:42 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 4FE23293E8C
Received: by earth.universe (Postfix, from userid 1000)
        id 6B7CA3C0CA7; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 36/56] drm/omap: drop omapdss-boot-init
Date:   Tue, 25 Feb 2020 00:21:06 +0100
Message-Id: <20200224232126.3385250-37-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The table of compatible values needed to be prefixed with "omapdss,"
is empty, so all of this code is doing nothing now. Let's drop it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/Kconfig           |   3 -
 drivers/gpu/drm/omapdrm/dss/Makefile          |   2 -
 .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   | 219 ------------------
 3 files changed, 224 deletions(-)
 delete mode 100644 drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c

diff --git a/drivers/gpu/drm/omapdrm/dss/Kconfig b/drivers/gpu/drm/omapdrm/dss/Kconfig
index 90e2dd522896..9ac60c24787b 100644
--- a/drivers/gpu/drm/omapdrm/dss/Kconfig
+++ b/drivers/gpu/drm/omapdrm/dss/Kconfig
@@ -1,7 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config OMAP2_DSS_INIT
-	bool
-
 config OMAP_DSS_BASE
 	tristate
 
diff --git a/drivers/gpu/drm/omapdrm/dss/Makefile b/drivers/gpu/drm/omapdrm/dss/Makefile
index f967e6948f2e..811966cd7468 100644
--- a/drivers/gpu/drm/omapdrm/dss/Makefile
+++ b/drivers/gpu/drm/omapdrm/dss/Makefile
@@ -1,6 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_OMAP2_DSS_INIT) += omapdss-boot-init.o
-
 obj-$(CONFIG_OMAP_DSS_BASE) += omapdss-base.o
 omapdss-base-y := base.o display.o output.o
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
deleted file mode 100644
index c849927ff185..000000000000
--- a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
+++ /dev/null
@@ -1,219 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
- * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
- */
-
-/*
- * As omapdss panel drivers are omapdss specific, but we want to define the
- * DT-data in generic manner, we convert the compatible strings of the panel and
- * encoder nodes from "panel-foo" to "omapdss,panel-foo". This way we can have
- * both correct DT data and omapdss specific drivers.
- *
- * When we get generic panel drivers to the kernel, this file will be removed.
- */
-
-#include <linux/kernel.h>
-#include <linux/of.h>
-#include <linux/of_graph.h>
-#include <linux/slab.h>
-#include <linux/list.h>
-
-static struct list_head dss_conv_list __initdata;
-
-static const char prefix[] __initconst = "omapdss,";
-
-struct dss_conv_node {
-	struct list_head list;
-	struct device_node *node;
-	bool root;
-};
-
-static int __init omapdss_count_strings(const struct property *prop)
-{
-	const char *p = prop->value;
-	int l = 0, total = 0;
-	int i;
-
-	for (i = 0; total < prop->length; total += l, p += l, i++)
-		l = strlen(p) + 1;
-
-	return i;
-}
-
-static void __init omapdss_update_prop(struct device_node *node, char *compat,
-	int len)
-{
-	struct property *prop;
-
-	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
-	if (!prop)
-		return;
-
-	prop->name = "compatible";
-	prop->value = compat;
-	prop->length = len;
-
-	of_update_property(node, prop);
-}
-
-static void __init omapdss_prefix_strcpy(char *dst, int dst_len,
-	const char *src, int src_len)
-{
-	size_t total = 0;
-
-	while (total < src_len) {
-		size_t l = strlen(src) + 1;
-
-		strcpy(dst, prefix);
-		dst += strlen(prefix);
-
-		strcpy(dst, src);
-		dst += l;
-
-		src += l;
-		total += l;
-	}
-}
-
-/* prepend compatible property strings with "omapdss," */
-static void __init omapdss_omapify_node(struct device_node *node)
-{
-	struct property *prop;
-	char *new_compat;
-	int num_strs;
-	int new_len;
-
-	prop = of_find_property(node, "compatible", NULL);
-
-	if (!prop || !prop->value)
-		return;
-
-	if (strnlen(prop->value, prop->length) >= prop->length)
-		return;
-
-	/* is it already prefixed? */
-	if (strncmp(prefix, prop->value, strlen(prefix)) == 0)
-		return;
-
-	num_strs = omapdss_count_strings(prop);
-
-	new_len = prop->length + strlen(prefix) * num_strs;
-	new_compat = kmalloc(new_len, GFP_KERNEL);
-
-	omapdss_prefix_strcpy(new_compat, new_len, prop->value, prop->length);
-
-	omapdss_update_prop(node, new_compat, new_len);
-}
-
-static void __init omapdss_add_to_list(struct device_node *node, bool root)
-{
-	struct dss_conv_node *n = kmalloc(sizeof(*n), GFP_KERNEL);
-	if (n) {
-		n->node = node;
-		n->root = root;
-		list_add(&n->list, &dss_conv_list);
-	}
-}
-
-static bool __init omapdss_list_contains(const struct device_node *node)
-{
-	struct dss_conv_node *n;
-
-	list_for_each_entry(n, &dss_conv_list, list) {
-		if (n->node == node)
-			return true;
-	}
-
-	return false;
-}
-
-static void __init omapdss_walk_device(struct device_node *node, bool root)
-{
-	struct device_node *n;
-
-	omapdss_add_to_list(node, root);
-
-	/*
-	 * of_graph_get_remote_port_parent() prints an error if there is no
-	 * port/ports node. To avoid that, check first that there's the node.
-	 */
-	n = of_get_child_by_name(node, "ports");
-	if (!n)
-		n = of_get_child_by_name(node, "port");
-	if (!n)
-		return;
-
-	of_node_put(n);
-
-	n = NULL;
-	while ((n = of_graph_get_next_endpoint(node, n)) != NULL) {
-		struct device_node *pn;
-
-		pn = of_graph_get_remote_port_parent(n);
-
-		if (!pn)
-			continue;
-
-		if (!of_device_is_available(pn) || omapdss_list_contains(pn)) {
-			of_node_put(pn);
-			continue;
-		}
-
-		omapdss_walk_device(pn, false);
-	}
-}
-
-static const struct of_device_id omapdss_of_match[] __initconst = {
-	{ .compatible = "ti,omap2-dss", },
-	{ .compatible = "ti,omap3-dss", },
-	{ .compatible = "ti,omap4-dss", },
-	{ .compatible = "ti,omap5-dss", },
-	{ .compatible = "ti,dra7-dss", },
-	{},
-};
-
-static const struct of_device_id omapdss_of_fixups_whitelist[] __initconst = {
-	{},
-};
-
-static int __init omapdss_boot_init(void)
-{
-	struct device_node *dss, *child;
-
-	INIT_LIST_HEAD(&dss_conv_list);
-
-	dss = of_find_matching_node(NULL, omapdss_of_match);
-
-	if (dss == NULL || !of_device_is_available(dss))
-		goto put_node;
-
-	omapdss_walk_device(dss, true);
-
-	for_each_available_child_of_node(dss, child) {
-		if (!of_find_property(child, "compatible", NULL))
-			continue;
-
-		omapdss_walk_device(child, true);
-	}
-
-	while (!list_empty(&dss_conv_list)) {
-		struct dss_conv_node *n;
-
-		n = list_first_entry(&dss_conv_list, struct dss_conv_node,
-			list);
-
-		if (of_match_node(omapdss_of_fixups_whitelist, n->node))
-			omapdss_omapify_node(n->node);
-
-		list_del(&n->list);
-		of_node_put(n->node);
-		kfree(n);
-	}
-
-put_node:
-	of_node_put(dss);
-	return 0;
-}
-
-subsys_initcall(omapdss_boot_init);
-- 
2.25.0

