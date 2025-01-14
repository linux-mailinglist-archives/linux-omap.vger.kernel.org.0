Return-Path: <linux-omap+bounces-3116-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A455BA10C65
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 17:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D02CA1886F94
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 16:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26101CAA74;
	Tue, 14 Jan 2025 16:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVlhwoqe"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DD01885BF;
	Tue, 14 Jan 2025 16:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736872594; cv=none; b=aNHdnk4kDGK3nwKi7o/W1DOq301WClZQZVVKvod6A09/Wg5ftCax9bd654NeivZY3FpqvkqU/y3dxtqY9mOIU3UA1zOTXzgNth9nsD6TiWf2MBEld2KjfR5fCR/c4nnKyA4Gs06v5mcNzNOciakVnjDkXGHlkuvq8uSCKjliOQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736872594; c=relaxed/simple;
	bh=6ZuCNTlo1Kp99bscBuWZZ2TWLCB4ZOIZJUtOTUHS3PQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GNjg9jhmlzA+Ud0syvo/8B9iPT9Udtl5WwihTxae6W9Rk0Kqzid8yusZiDRACkYhUXdlepMCD6O0Ob5zPmox/PSoLN80m9h1aeiuzfpR8ubdJJDjt372DXL/mzwA8K9oxSwqQo93URaq9sZeR1ddPeBGqBoSJRIJz8icdbAg2ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVlhwoqe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5AB1C4CEDD;
	Tue, 14 Jan 2025 16:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736872594;
	bh=6ZuCNTlo1Kp99bscBuWZZ2TWLCB4ZOIZJUtOTUHS3PQ=;
	h=From:Date:Subject:To:Cc:From;
	b=rVlhwoqexFkjKJr+0Tz6o6FdGTvu9H1jcbVXJ9u8VATRtonfBIFS82heq0tXkfun3
	 /AfxzRDyrjmLm/x8UpbDpz+9/SnuVUWPcB1hWpciqMuuKc+ymUqhzsGq1VNDNF5JVK
	 vqMHn424T7tAaSzz7QbXWCOHmIG+Hp6iFfkbAWuH6QNgO/DZqMItPGCigHx8SkF6tU
	 H7VbsmEzI8rDlf/dnnAugRHGNdz2Qhda7zEvhVl3gFT7xsese6y+UhoE2uy7JUDbe+
	 tqlo75e4qmW55+ULtdFOQd9yiyfoWhKEkthL1cavymT3WbTXi2+iTEGHm7sWCnKUuy
	 FpZxBhI6SCruQ==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 14 Jan 2025 18:36:28 +0200
Subject: [PATCH] memory: omap-gpmc: drop no compatible check
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-omap-gpmc-drop-no-compatible-check-v1-1-262c8d549732@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIuShmcC/x3NwQrCMAyA4VcZORtYNifOVxEPNY1b0DahFRHG3
 t3i8bv8/wZVikqFS7dBkY9WtdxAhw54DXkR1NgMQz9MPdERLQXHxRNjLOaYDdmSh7feX4K8Cj+
 RZzqPcaTTNBO0kBd56Pc/ud72/QeCKnecdAAAAA==
To: Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Rob Herring (Arm)" <robh@kernel.org>, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=6ZuCNTlo1Kp99bscBuWZZ2TWLCB4ZOIZJUtOTUHS3PQ=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnhpKQczgwoT6u8++RiMrf5wOzIRiuD3IZMnHg4
 rzkf/FkbyqJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZ4aSkAAKCRDSWmvTvnYw
 k+UrEACrHRlnpE1uvNwTKvf8sh/RqbjuMAM6BPW9xyCO4DJuf6LK0MmQVnp/XuTU1bYfGjgvv35
 T4Y7QvUzXZQTJYde09lWxehrQOwfyHKxUOsgwjG7Uz+EnqNPqztdsS4WS2nfstNq+gptJkJEfc9
 LHa8M3fJ9TdBJeCi2HZZXVytZTjdQ4LM/0Af+RKyL9mkD1hQmB9tl7fIkUmbP4QqJOInFed7c0t
 udyDAToW7/9hgaSwkk1vS9KSx/U9eX0gs6UVPYVdfv/qbcojTHR31nPzsGRiwdlnThdwIbZc6Si
 0MykFfDJmcsPQWlkrF4q6CSh9KRDFd4+2uLYcKhWV4QM0FRVgoZlllHKtXG8I8NclE9hrpGswt5
 R/sPg1u4LLn76B2qIvUD3H1vDDiH6/ILVD0Q+hy72aJJ5QObGSidjWjSRIMkcRqt8lw6Irc4MvH
 bIsF6upgaHJcJYoDr+Rh8JbhJS7UaVXXUJ+qcypKkcC8x0SiymUoDU06NS7RBNMfn2deJOFjuPM
 KOY4qj2rj6itHA4/k5S+AtQ+3pqi9HecCBuhHlOI12ivveDrOvYrH9HIjWKVH1XFD5HZ7TufVFA
 1heNgcSmdb26cGSiDXGZJe99XZH0DMFZkhh17Xqj9sVuUsoy+QiyDXiKd/RYVH1Ha7aQOWFigXs
 jZ9Ja4jC2QsMAGw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

We are no longer depending on legacy device trees so
drop the no compatible check for NAND and OneNAND
nodes.

Suggested-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/memory/omap-gpmc.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 50eb9f49512b..368b0848b64d 100644
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

---
base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
change-id: 20250114-omap-gpmc-drop-no-compatible-check-c9183d316591

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


