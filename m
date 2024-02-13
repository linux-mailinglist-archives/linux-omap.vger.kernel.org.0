Return-Path: <linux-omap+bounces-554-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDB9852E8C
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 11:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41F511F2404D
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 10:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037B32BB10;
	Tue, 13 Feb 2024 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="JNZP2FWH"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E4C381A0;
	Tue, 13 Feb 2024 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707821919; cv=none; b=a9kIUWH789qxZW3OkOaKs1USDZtg4dzbPij/ZH74jgyC5Q/y9cK56kdD/wch1p2m2s4Y+I4Wx4qFQuKJuvNE2ZlIG47URfBLsD7GgpYNdaUYbpgLUoB/F65LOEt9IwBtL8vBudu052Z0xC9SU2WT1XWMd0AUjT1xcbhFH0QNu5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707821919; c=relaxed/simple;
	bh=wSIev1+0Q/Pt42bllNViuqThpM6KQUp0BaR1IqENN8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bC+yaAXBO5AgtCXQp4dYqqqLfl/9965/Ks+GGCxbzHHtWdZu1luNVTVRCV+zTqIduTSP6lKCtylueMaHmCaZrgEGYf5xjDCAAdDR0KzCM7n+WyH8vUtz9tdCvgmSUdaOMOmH0Kjb4faGZnMrx6sVAgkhf/VeZDZ+QwRNgHXX1Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=JNZP2FWH; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 7D6B46058D;
	Tue, 13 Feb 2024 10:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1707821917;
	bh=wSIev1+0Q/Pt42bllNViuqThpM6KQUp0BaR1IqENN8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JNZP2FWHt1theTQ6uSxXUu1efipE26VhfYWt9splRZC3slNLVnDV6KxvASIc9BdJN
	 jpkFnTep0eE0+jJsEENhtXiHg/Wa0RrImASwDdbpcHWPQ1OI67IZtRnnhAh37+8RQF
	 szaebJ0fYuPQUdVSFe/2TaySss8zThsDcEbJ/wX0isbfXdBy3DHXrThBIu7K5vZELW
	 wdTynIvLrWPEkZACOlxFNQvXFh2c4Wrdncc1w1tbzk0rImYL62jBF6H47PgejSromA
	 eXzfL54fjwFIbTwEDqxf6T/Bxdr19y0pPZv3U81R0i8l6gAxOt+sBlWjfAu77D7iZK
	 Wjrg1BSYYO44A==
From: Tony Lindgren <tony@atomide.com>
To: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/4] clk: ti: Handle possible address in the node name
Date: Tue, 13 Feb 2024 12:56:41 +0200
Message-ID: <20240213105730.5287-2-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240213105730.5287-1-tony@atomide.com>
References: <20240213105730.5287-1-tony@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to use #address-cells = <1> and start making use of the
standard reg property, let's prepare things to ignore the possible
address in the clock node name.

Unless the clock-output-names property is used, the legacy clocks still
fall back to matching the clock data based on the node name.

We use cleanup.h to simplify the return path for freeing tmp.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clk.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -7,6 +7,7 @@
  * Tero Kristo <t-kristo@ti.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
@@ -114,20 +115,26 @@ int ti_clk_setup_ll_ops(struct ti_clk_ll_ops *ops)
 
 /*
  * Eventually we could standardize to using '_' for clk-*.c files to follow the
- * TRM naming and leave out the tmp name here.
+ * TRM naming.
  */
 static struct device_node *ti_find_clock_provider(struct device_node *from,
 						  const char *name)
 {
+	char *tmp __free(kfree) = NULL;
 	struct device_node *np;
 	bool found = false;
 	const char *n;
-	char *tmp;
+	char *p;
 
 	tmp = kstrdup_and_replace(name, '-', '_', GFP_KERNEL);
 	if (!tmp)
 		return NULL;
 
+	/* Ignore a possible address for the node name */
+	p = strchr(tmp, '@');
+	if (p)
+		*p = '\0';
+
 	/* Node named "clock" with "clock-output-names" */
 	for_each_of_allnodes_from(from, np) {
 		if (of_property_read_string_index(np, "clock-output-names",
@@ -140,7 +147,6 @@ static struct device_node *ti_find_clock_provider(struct device_node *from,
 			break;
 		}
 	}
-	kfree(tmp);
 
 	if (found) {
 		of_node_put(from);
@@ -148,7 +154,7 @@ static struct device_node *ti_find_clock_provider(struct device_node *from,
 	}
 
 	/* Fall back to using old node name base provider name */
-	return of_find_node_by_name(from, name);
+	return of_find_node_by_name(from, tmp);
 }
 
 /**
-- 
2.43.1

