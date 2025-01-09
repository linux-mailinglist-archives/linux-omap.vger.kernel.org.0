Return-Path: <linux-omap+bounces-3063-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1ACA07FB2
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 19:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23CC0168FBE
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 18:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB13C199238;
	Thu,  9 Jan 2025 18:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLweJH0I"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9712B9BF;
	Thu,  9 Jan 2025 18:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736446874; cv=none; b=MIWgERk5qT2+0z9NX1MK+p2fDpg3YjLGS2VPdRtjP0d8BDQ+ETfRysFjmhE+60R7vMSaPujZJSDd7SyBUsmQJYM5dTS+cXxstnPTjgw2KKtljBCLQ3+7bgGztrfO9hruC97IQDD2mhcw+kv2YdCjRgTR/ElE/jDD7736XBFvyZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736446874; c=relaxed/simple;
	bh=74vfmPl4/CPMuD6JSl4s+poNW8XPfjw9x34Svsyx1yc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ksEzvRSeTqkW7Xld9mDPhu7un8J5hADrEYDBtux5ro38BQa85SytUQ2RQxmFMdAz0Im4bc4e/DWwpUXuMlQm7Rapx1uZXb1MgXo9NhIGwqe9X3EIQtLMkS1mYs4Z9VzSCXD57IUwPgMAz/IaOD4V7cI90zYCv7ehin6LKQX9bFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLweJH0I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D34C4CED2;
	Thu,  9 Jan 2025 18:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736446874;
	bh=74vfmPl4/CPMuD6JSl4s+poNW8XPfjw9x34Svsyx1yc=;
	h=From:To:Cc:Subject:Date:From;
	b=JLweJH0I22DIV+h8PoupuPvT+XximIGV81wEqHkkksACDa4W9yGB4rtg5cNp/Mk/G
	 lmJ0YuxaYkqbB7TxDybZN7G88Lqei4qhT9F4HnAeV+lr+VIefgVjOuUK5ezdRgFEU2
	 B8uddoIWGjx9Z3u/56OJ/MR6UaJ1XFUZ0dCLMfKxyyJ4iPrDMMHivEPpK1btXPbLKQ
	 PSIFuBywrFWFaU92qCeyN3iIGTzc24Y5kyJufpVCTmpvtuuw+z3sqOll8p5i6MHliR
	 Q1TXHXaH4Q+33MOL8rwVVTNTZZat/FTTercdX+byOyG+l2aDLtI2lCxwVJkINg61wR
	 mNs0VwJ3YiQFg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] memory: omap-gpmc: Use of_property_present() for non-boolean properties
Date: Thu,  9 Jan 2025 12:21:10 -0600
Message-ID: <20250109182110.3970894-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

While we're here, simplify the 2 checks into a single check as they
only differ in printing "NAND" vs "OneNAND" in the warning.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Possibly this check could just be removed altogether?
---
 drivers/memory/omap-gpmc.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index e2a75a52563f..329bad46065c 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2226,21 +2226,11 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 		goto err;
 	}
 
-	if (of_node_name_eq(child, "nand")) {
+	if (of_node_name_eq(child, "nand") || of_node_name_eq(child, "onenand")) {
 		/* Warn about older DT blobs with no compatible property */
-		if (!of_property_read_bool(child, "compatible")) {
+		if (!of_property_present(child, "compatible")) {
 			dev_warn(&pdev->dev,
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
+				 "Incompatible '%pOFn' node: missing compatible", child);
 			ret = -EINVAL;
 			goto err;
 		}
-- 
2.45.2


