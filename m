Return-Path: <linux-omap+bounces-3496-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2A3A7096F
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 19:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95600178D04
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 18:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170F11F8690;
	Tue, 25 Mar 2025 18:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZrA5xWF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59121EB191;
	Tue, 25 Mar 2025 18:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742928184; cv=none; b=oYZpWjYxAk53KmJNZKkQtu1am6B9DSZbdqqydhU4PJ9/WFKub0Jj/qNhRZ6l8/Xih7DZQRyWQYwuiujAFys82xlZiIIfzN4IFvjw+M4OwmFUDC5otIbMygVGyRDZqAYgBgRjhNMVbJksj1MZnEi22FVDXiHo8tEuTGT8+AwV4Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742928184; c=relaxed/simple;
	bh=IE3CutUwn6X42xVCPScsvkDR7mkmgXPT6FELut48I/M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MfYYQbwM2Jlr6tZ2ZockWhVaFrN3oMRZTXeQIigg/EFUVRe2mHKvmDh9wyIEVuoB/ZfMQrbvJwnIJqyMDht5DNeZYPaV/uiucl8JBV//BKjkLy4gJn/eSjogIn4aKuhhyz/HN5LEZzaJp7/p4CCeUvB4LsMPExZ7u1eQ8py100w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZrA5xWF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F95C4CEE8;
	Tue, 25 Mar 2025 18:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742928184;
	bh=IE3CutUwn6X42xVCPScsvkDR7mkmgXPT6FELut48I/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fZrA5xWFUkezJTU+n1Io/agjis3SXF5LJkSixugAzc0d4IUPCOgNufATrRCM7v3D8
	 85Uc0dOewZVZHriVqiC4nGa9jbrWFaWmE7x7MKrvSyOpgW5pTzzMLei4qXYlfcSjHj
	 YDbsP4JllYtv1JSHKZDwAZknZG8Pzi0ZiupMIci07ijsgWrD1n+ch8nXgx/unkjs45
	 ry00faWZkd9XBI+fVYOPL2Fg+c3sAgMa29k6RSTLZjsjXc9cHiHzf3W/XD/Ght/wl0
	 g6GbepmcgAa/6XpsUYoA08406MuS+wbGw/c5vy+8tzvvCX5Gk8OzH2cVx/AppsaTeA
	 9hxJxaFjaFg4A==
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
Subject: [PATCH AUTOSEL 6.1 2/3] memory: omap-gpmc: drop no compatible check
Date: Tue, 25 Mar 2025 14:42:56 -0400
Message-Id: <20250325184258.2152379-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325184258.2152379-1-sashal@kernel.org>
References: <20250325184258.2152379-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.131
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
index 2351f2708da23..f30b1c0093d3f 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2154,26 +2154,6 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
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


