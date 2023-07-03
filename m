Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F533745745
	for <lists+linux-omap@lfdr.de>; Mon,  3 Jul 2023 10:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjGCIYS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 Jul 2023 04:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjGCIYR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 Jul 2023 04:24:17 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C470BB2
        for <linux-omap@vger.kernel.org>; Mon,  3 Jul 2023 01:24:15 -0700 (PDT)
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Qvf8N65YxzqVHN;
        Mon,  3 Jul 2023 16:23:48 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 3 Jul
 2023 16:24:11 +0800
From:   Guo Mengqi <guomengqi3@huawei.com>
To:     <tony@atomide.com>, <haojian.zhuang@linaro.org>,
        <linus.walleij@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <guomengqi3@huawei.com>
Subject: [PATCH] pinctrl: single: Fix memleak in pcs_dt_node_to_map
Date:   Mon, 3 Jul 2023 16:17:16 +0800
Message-ID: <20230703081716.15810-1-guomengqi3@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In a reliability test which repeatedly load and remove a module,
I found some kmalloc-256 memory leaks in pinctrl-single.

pcs_dt_node_to_map() will recognize a dt_node and
make a mapping for it. Along the way some pinctrl functions and groups
are registered in pinctrl-single controller. These functions/groups are
registered once and not removed during the system lifetime.

When the client module loads again, pcs_dt_node_to_map() fail to consider
this situation, create the same set of resources, and does not release or
use them.

To fix this, add a check at the start of pcs_parse_one_pinctrl_entry/
pcs_parse_bits_in_pinctrl_entry. If the target is found,
then all the resource allocation and parsing work can be skipped,
just set the mapping with existing function/group information.

Fixes: 8b8b091bf07f ("pinctrl: Add one-register-per-pin type device tree
based pinctrl driver")

Signed-off-by: Guo Mengqi <guomengqi3@huawei.com>
---
 drivers/pinctrl/pinctrl-single.c | 28 +++++++++++++++++++++++++---
 drivers/pinctrl/pinmux.c         |  2 +-
 drivers/pinctrl/pinmux.h         |  2 ++
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 0dabbcf68b9f..3412e7f248d9 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -949,11 +949,14 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
 	if (!nconfs)
 		return -ENOTSUPP;
 
-	func->conf = devm_kcalloc(pcs->dev,
+	if (!func->conf) {
+		func->conf = devm_kcalloc(pcs->dev,
 				  nconfs, sizeof(struct pcs_conf_vals),
 				  GFP_KERNEL);
-	if (!func->conf)
-		return -ENOMEM;
+		if (!func->conf)
+			return -ENOMEM;
+	}
+
 	func->nconfs = nconfs;
 	conf = &(func->conf[0]);
 	m++;
@@ -1005,6 +1008,17 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 	struct pcs_func_vals *vals;
 	int rows, *pins, found = 0, res = -ENOMEM, i, fsel, gsel;
 	struct pcs_function *function = NULL;
+	struct function_desc *desc;
+
+	mutex_lock(&pcs->mutex);
+	fsel = pinmux_func_name_to_selector(pcs->pctl, np->name);
+	if (fsel >= 0) {
+		desc = pinmux_generic_get_function(pcs->pctl, fsel);
+		WARN_ON(!desc);
+		function = desc->data;
+		goto set_map;
+	}
+	mutex_unlock(&pcs->mutex);
 
 	rows = pinctrl_count_index_with_args(np, name);
 	if (rows <= 0) {
@@ -1075,6 +1089,7 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 		goto free_function;
 	}
 
+set_map:
 	(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
 	(*map)->data.mux.group = np->name;
 	(*map)->data.mux.function = np->name;
@@ -1132,6 +1147,12 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
 		return -ENOTSUPP;
 	}
 
+	mutex_lock(&pcs->mutex);
+	fsel = pinmux_func_name_to_selector(pcs->pctl, np->name);
+	if (fsel >= 0)
+		goto set_map;
+	mutex_unlock(&pcs->mutex);
+
 	npins_in_row = pcs->width / pcs->bits_per_pin;
 
 	vals = devm_kzalloc(pcs->dev,
@@ -1223,6 +1244,7 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
 	if (res < 0)
 		goto free_function;
 
+set_map:
 	(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
 	(*map)->data.mux.group = np->name;
 	(*map)->data.mux.function = np->name;
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 82c750a31952..1d7b3df972b4 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -320,7 +320,7 @@ int pinmux_gpio_direction(struct pinctrl_dev *pctldev,
 	return ret;
 }
 
-static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
+int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
 					const char *function)
 {
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index ea6f99c24aa5..3da8b38910b5 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -37,6 +37,8 @@ int pinmux_gpio_direction(struct pinctrl_dev *pctldev,
 			  struct pinctrl_gpio_range *range,
 			  unsigned pin, bool input);
 
+int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
+				const char *function);
 int pinmux_map_to_setting(const struct pinctrl_map *map,
 			  struct pinctrl_setting *setting);
 void pinmux_free_setting(const struct pinctrl_setting *setting);
-- 
2.17.1

