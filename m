Return-Path: <linux-omap+bounces-3494-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D40EA70943
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 19:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8073D7A3213
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 18:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105571F4184;
	Tue, 25 Mar 2025 18:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsVuSoYG"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E54D1CAA9C;
	Tue, 25 Mar 2025 18:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742928163; cv=none; b=REmC4QLBQ+Rr7HaxKnccXUgCaB8T4o3ns5izZLp2T7vEsqbLAgR9ZptMXxvj0+AG4dRafPJHszNl/QRK9QafURvdt4RXKcbNPvvxV6GAsPUME9RyJnRRRnJUEAu1sB5aMBONWykKyyLf59IyNlXMAsjH8NWrGxBNAfnFje0J29E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742928163; c=relaxed/simple;
	bh=hUopFbWefBjwpkwKa0EhQ0rpTliQRL/S9stZoNjVRYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K82SI0k923SZDdTstglwDrPtC4JzPsjoqRue/g03CQXHLMOoo7EukDxPnAzBx3dXDzgo6vsH8Hg11M7coSMbquOfmef1PiJGMmF+sZtd6tPyk5pNH6oiX/djSyfvTXYaQAYJ3toveFYoz2voFOurfVmmJMzIvaVDpajxALaO5ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsVuSoYG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E692C4CEEE;
	Tue, 25 Mar 2025 18:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742928163;
	bh=hUopFbWefBjwpkwKa0EhQ0rpTliQRL/S9stZoNjVRYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DsVuSoYGKnC0zdz8ZPOCy8Y61JnENpqeXiZQZ/fJ3DvsmMqJsXOIpECdXw65v8yEZ
	 R0k0u5E2sOsEO+A8IQl14mRcBCbbfwruCb6kA0AjoNNrOIwlTCtUqP86Pyp/8hYrJ8
	 FI2KiNGFLvAzhVvtkZz0k5HhJbmbjASFjxIIfRhf2Ckx/owLtSg8112Gr3i+iyY1nK
	 sz6HOpHmraLTHFN5zfkdNaSHCtoNmcbriWBx5L5LU0xEN35he7HOHkgdzIOM2m3ZOq
	 RCvDsqQq3oHfOtK9SikEU7iJjlJjyVefGWpuJKQdiCiJxrKavKE0WG0KC8D4u5dAES
	 wd9C82QWFudbA==
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
Subject: [PATCH AUTOSEL 6.12 2/5] memory: omap-gpmc: drop no compatible check
Date: Tue, 25 Mar 2025 14:42:32 -0400
Message-Id: <20250325184236.2152255-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325184236.2152255-1-sashal@kernel.org>
References: <20250325184236.2152255-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.20
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
index c8a0d82f9c27d..719225c09a4d6 100644
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


