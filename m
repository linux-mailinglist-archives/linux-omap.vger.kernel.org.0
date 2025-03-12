Return-Path: <linux-omap+bounces-3381-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01286A5E1F0
	for <lists+linux-omap@lfdr.de>; Wed, 12 Mar 2025 17:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 440F51784C8
	for <lists+linux-omap@lfdr.de>; Wed, 12 Mar 2025 16:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6141F4CB7;
	Wed, 12 Mar 2025 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sILim1Bn"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386E41CDFCE;
	Wed, 12 Mar 2025 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741797816; cv=none; b=qdLuyUv1pCf0J2kAdPiHCgieM7t3NuLEaCEAzxhifsg2Hb4gTDuBr5MTITP7kPOL0NsMEAkCT0nNoqSOIjKZ+4VGNysdkP5Iec8Au51Wmm2yOMNyZFsgMU0KiERET7KNJ/oTz0/uXZMYzXHno3SkkKChcj4ilVR6u+W51Oi8tQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741797816; c=relaxed/simple;
	bh=6Nlfx24/5WyMWH+mVg/nVlAYQ94lGe7m8lLJJ4G7Slk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nf3+S1JfDfsr7Vou6JilYXtFrH2D+mowKRRk7QO+ApT1d3yMMWY4B7LSV5q6kuVKSJoD4yKVBnLU2bqSuu8IY3oCWOVFoE2GgyN6/iQxIDa3FHgsYvMA3eJEhPkOOiSU+mvnS2087WpVw0YPX46HjTlqrpzcEgGZHT4e8oPyr4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sILim1Bn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809CCC4CEDD;
	Wed, 12 Mar 2025 16:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741797815;
	bh=6Nlfx24/5WyMWH+mVg/nVlAYQ94lGe7m8lLJJ4G7Slk=;
	h=From:To:Cc:Subject:Date:From;
	b=sILim1BnZ9ITmiC6nb8CcNmG9QTkPLkeT5hpmzawAd9hQICLb7L6sGXuqAfgPqXHP
	 H6ue/fML9DXKqFI/6DYvd/4mxgtBH8kYvj6uVdql+gWQJl7ssFdt3z6O6m/olh8eQ/
	 v+dhGFeEYRF+aMSL3jytu3/pTWSOdqGNZs2mSLQMFL4mm+rBcRDDfot4xyL983+Ed8
	 IPHK1qCntdz4S5kY9X3QtT3sjJaTlHCRNjP9BuD+JhJTJO4/g7E0qP1DfzGLcLwEzH
	 Q9483bpienLKlDOyj0wTGPxbaXjzzpdOcZ32VxN5Lfa/YPsxPkRScq9dHo1svLDKby
	 qSVRMOU2hNezA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: ti: Simplify ti_find_clock_provider()
Date: Wed, 12 Mar 2025 11:33:30 -0500
Message-ID: <20250312163330.865573-2-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove using for_each_of_allnodes_from() which is not safe to use
without holding the DT spinlock. In reality that probably doesn't
matter here. This is the only user in the whole tree, so it can be
made private once removed here. The "from" argument is always NULL, so
it can be dropped as well.

There's a slight change in behavior in matching the "clock-output-names"
value as the prior code would match if the node name matched the
beginning of the value and the comparision was case insensitive. Now
it must be an exact match.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Compiled only. I'm not sure if the the change in behavior is going to 
matter. 

 drivers/clk/ti/clk.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
index 9c75dcc9a534..693a4459a01b 100644
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -118,13 +118,10 @@ int ti_clk_setup_ll_ops(struct ti_clk_ll_ops *ops)
  * Eventually we could standardize to using '_' for clk-*.c files to follow the
  * TRM naming.
  */
-static struct device_node *ti_find_clock_provider(struct device_node *from,
-						  const char *name)
+static struct device_node *ti_find_clock_provider(const char *name)
 {
 	char *tmp __free(kfree) = NULL;
 	struct device_node *np;
-	bool found = false;
-	const char *n;
 	char *p;
 
 	tmp = kstrdup_and_replace(name, '-', '_', GFP_KERNEL);
@@ -137,25 +134,13 @@ static struct device_node *ti_find_clock_provider(struct device_node *from,
 		*p = '\0';
 
 	/* Node named "clock" with "clock-output-names" */
-	for_each_of_allnodes_from(from, np) {
-		if (of_property_read_string_index(np, "clock-output-names",
-						  0, &n))
-			continue;
-
-		if (!strncmp(n, tmp, strlen(tmp))) {
-			of_node_get(np);
-			found = true;
-			break;
-		}
-	}
-
-	if (found) {
-		of_node_put(from);
-		return np;
+	for_each_node_with_property(np, "clock-output-names") {
+		if (of_property_match_string(np, "clock-output-names", tmp) == 0)
+			return np;
 	}
 
 	/* Fall back to using old node name base provider name */
-	return of_find_node_by_name(from, tmp);
+	return of_find_node_by_name(NULL, tmp);
 }
 
 /**
@@ -208,7 +193,7 @@ void __init ti_dt_clocks_register(struct ti_dt_clk oclks[])
 		if (num_args && clkctrl_nodes_missing)
 			continue;
 
-		node = ti_find_clock_provider(NULL, buf);
+		node = ti_find_clock_provider(buf);
 		if (num_args && compat_mode) {
 			parent = node;
 			child = of_get_child_by_name(parent, "clock");
-- 
2.47.2


