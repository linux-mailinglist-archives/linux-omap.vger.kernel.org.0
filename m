Return-Path: <linux-omap+bounces-3495-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 237DAA70965
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 19:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5506B189E7A8
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 18:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0032C1F5838;
	Tue, 25 Mar 2025 18:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ssM4E46W"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9124E1F5826;
	Tue, 25 Mar 2025 18:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742928176; cv=none; b=a77HlmdsZ3GklKrJqRuZW/XrK4SdPTenQd4j7hUN+KUhQHhK9KcBI23XM4nlP9MbemtDR9OPOVA6Pm59z4ZBJoN9Py07wUA6zk80sqecCVJzxZIv2sEpijDiwo/o98coYi/3C+rxwmBWtSrrr0GiAyfQGgPFQWhxIG/VprU9C8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742928176; c=relaxed/simple;
	bh=kd5dlfIxAlbmT1YLtBm+KAJIrE3p0y+2brAJD8SAj2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hgrOJ+v+6LjycKE5na9QpObCbgNbRRXm6Whmb8mNIEmsLWyqOOqDfoUAiAOgCMQV0bioYAKppavFucMkdpe2AlNcaMLakRDu+3K4s1A97EgD+SEeO7K5tvotCa9llvi8/na/JmpKJ2MMpXFXXkmrk7ugqLeuxUNKnuE1vkBZmvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ssM4E46W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8DBC4CEEE;
	Tue, 25 Mar 2025 18:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742928176;
	bh=kd5dlfIxAlbmT1YLtBm+KAJIrE3p0y+2brAJD8SAj2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ssM4E46WQRfRpie8Q5qKAGn0OWBrYc/du+xH8zT+JcRB0Bw+fMh4/55Qsuz8O0C91
	 RErJsM71q7Qh2Ou2oJo/KaK8qaOLVA3suEiMwHJRoW/2GtOHF71790WOQEBO6etq7k
	 gHlrutZChLOiIMEF+R3LGMx/jIX+jaTQ0XZ0QnrjU129sWf8MI5W7hmQPHWQhI8nqu
	 oOAM7Fu7EuqJ2lKjxI3ZxMSmnqP6vSHF3IRl0jp3xR/ATh0Q7VRqThpXnriZ7Z7uTW
	 UrHlMqpFGSiauNXmtys0dwjdMx90EkFiKmYOsZ77DNmlQ4WxY2qxxIzkqTYEmkBHeO
	 Ab0rV75ubasMw==
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
Subject: [PATCH AUTOSEL 6.6 2/3] memory: omap-gpmc: drop no compatible check
Date: Tue, 25 Mar 2025 14:42:47 -0400
Message-Id: <20250325184249.2152329-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325184249.2152329-1-sashal@kernel.org>
References: <20250325184249.2152329-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.84
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
index d78f73db37c88..ab0985bb5789a 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2247,26 +2247,6 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
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


