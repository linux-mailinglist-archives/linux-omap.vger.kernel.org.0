Return-Path: <linux-omap+bounces-3493-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4650A7092A
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 19:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7017D7A488A
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 18:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8431C84DD;
	Tue, 25 Mar 2025 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKEpl6PW"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEB41C6FFF;
	Tue, 25 Mar 2025 18:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742928143; cv=none; b=M7o3yri7Zyp1y1uMAFZOuTmKAn1QzaNryFaFo494mRtSOjh8J5HQ9iG7J5vm2tAyOn2oqpd1K0GWYQAOb0DNajL1r/4YU1bsjiAYYyx2i090166bdtnNz8lrzgTi7UdWwCjv4tMxF7/4J96YjJP1wvtrQytR6uC9xdiF8FhEvI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742928143; c=relaxed/simple;
	bh=RI1RQHO9FjldRw7o5gAktMtDyBAOjmrgGePPNYt8SLI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U5+ltyrk9d2kPzrzoUqkFz+Va2AdOqk1OEa/p2b5K/Xr/bO59TryZYAACWZshRDwapayMote8UMTxw0RtWzZ5RfkZ8yK/Nm/9WMXl3iKxqiG+Zcdn/L8pD+XyGVCF04ESAqS7nnjJqGA+F3xBGk6C6EHRcTgOlga5OjSbOxOLNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKEpl6PW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEBEC4CEE8;
	Tue, 25 Mar 2025 18:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742928143;
	bh=RI1RQHO9FjldRw7o5gAktMtDyBAOjmrgGePPNYt8SLI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nKEpl6PW5QIHWAXKYD0+NQM3ZdbnG4l58Jg9RiavmImkRwaz5HrjqMIkSRjHOAJWp
	 9Sxk7JAfKGmnraNEY1+wsH+0IW7c0+Io6sfogYQ9RPBUl0DA8lo+3A7y5O4ZGOVcQ/
	 NqGrcxT/vxENQmo44xHZJbJclZcFsTwRvyP0NRkbJ+E5NNbXVu93uDGYaVygRUVuAU
	 gSbOv2/nlX7x1UFpEV253B9j4D3S3XOdaUl3teTDIa8NP2y3zuP+WSi/4f1vYt4HLZ
	 FnXXwuk0P8qDATkFFY51bFMT3QcbyzDeYWBti1z4Egb4iqBTq241FTq+OXWNCC+L8H
	 NIPk47943BXHw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Roger Quadros <rogerq@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sasha Levin <sashal@kernel.org>,
	tony@atomide.com,
	krzk@kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 2/7] memory: omap-gpmc: drop no compatible check
Date: Tue, 25 Mar 2025 14:42:10 -0400
Message-Id: <20250325184215.2152123-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325184215.2152123-1-sashal@kernel.org>
References: <20250325184215.2152123-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.8
Content-Transfer-Encoding: 8bit

From: Roger Quadros <rogerq@kernel.org>

[ Upstream commit edcccc6892f65eff5fd3027a13976131dc7fd733 ]

We are no longer depending on legacy device trees so
drop the no compatible check for NAND and OneNAND
nodes.

Suggested-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Roger Quadros <rogerq@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Link: https://lore.kernel.org/r/20250114-omap-gpmc-drop-no-compatible-check-v1-1-262c8d549732@kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/memory/omap-gpmc.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 50eb9f49512b4..368b0848b64df 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2245,26 +2245,6 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 		goto err;
 	}
 
-	if (of_node_name_eq(child, "nand")) {
-		/* Warn about older DT blobs with no compatible property */
-		if (!of_property_read_bool(child, "compatible")) {
-			dev_warn(&pdev->dev,
-				 "Incompatible NAND node: missing compatible");
-			ret = -EINVAL;
-			goto err;
-		}
-	}
-
-	if (of_node_name_eq(child, "onenand")) {
-		/* Warn about older DT blobs with no compatible property */
-		if (!of_property_read_bool(child, "compatible")) {
-			dev_warn(&pdev->dev,
-				 "Incompatible OneNAND node: missing compatible");
-			ret = -EINVAL;
-			goto err;
-		}
-	}
-
 	if (of_match_node(omap_nand_ids, child)) {
 		/* NAND specific setup */
 		val = 8;
-- 
2.39.5


