Return-Path: <linux-omap+bounces-2377-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DF0998460
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 13:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 149791C2366E
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 11:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A811C244A;
	Thu, 10 Oct 2024 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aotw4Xmj"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAEE1BD50C;
	Thu, 10 Oct 2024 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728558263; cv=none; b=r1kuPMGm5tYw0hhl1BpJA7A8ot+/hwfVHzjNbhYrbd2ypdabLwbn9spgbq1+MDdvHY0JbdQvCw2rrXd1rVDfF10vtby+tSj9lm3FyBKZqxgxd5b0Wikk0q3dfGTXPzhp8jlRDR/QVXby4bgy0poPCGkvCxHkDkjCi7VB6Tv+uVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728558263; c=relaxed/simple;
	bh=teGy8Wfr1iyJmsuYjTSwHtKeYvqOGP3HYT3N0SE7vEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CtN5FnBwaQCCAo6OeNhfH4uQT0yyH2cQemsL35ByjmcuA3zt162d8T2KAUVqW2LKnt6PZyYvgGBBHwDNSSAF96lVsuncYaLSieOc02yD/a6lnDSGUutRE0PrQDyx05YYqOAJsioNnk+jiDA1GuEJy4UdEPiyryk2iWV1rChOF5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aotw4Xmj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2591CC4CED1;
	Thu, 10 Oct 2024 11:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728558262;
	bh=teGy8Wfr1iyJmsuYjTSwHtKeYvqOGP3HYT3N0SE7vEc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aotw4Xmj1JIBC77dCLHq2qFNjSLu2XSOMwLQqcrk4UizLzkgUlg5URLDHmyYKe6lI
	 0ao0nWIVwStcXv0QITAGCl//0bvB2saOHTjdToHSIQOYuaGpnCKpK52knBBtPP9A4b
	 ds3OGjLQPfZaRcYym6YpF7+UcRsqCfvX61AmfeI/xIKkuoRiyncG1v+pLf+ke0L2xw
	 dZrGMeQNO7OcNxEiGnlo8HZMvRrUG9UgI4R7iYJvL0j80BhOIIpBuYH6GV0rrvCt31
	 Be7dNTUQH10BPnHRBWX6JQXkhhBwIsVMORiJ1mi+OCLzRiCNEyYb4Xz9rVTSWOPseF
	 m0z44B2qN0TIg==
From: Simon Horman <horms@kernel.org>
Date: Thu, 10 Oct 2024 12:04:10 +0100
Subject: [PATCH net-next v2 1/3] net: ethernet: ti: am65-cpsw: Use __be64
 type for id_temp
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-ti-warn-v2-1-9c8304af5544@kernel.org>
References: <20241010-ti-warn-v2-0-9c8304af5544@kernel.org>
In-Reply-To: <20241010-ti-warn-v2-0-9c8304af5544@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, netdev@vger.kernel.org, 
 linux-omap@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.14.0

The id_temp local variable in am65_cpsw_nuss_probe() is
used to hold a 64-bit big-endian value as it is assigned using
cpu_to_be64().

It is read using memcpy(), where it is written as an identifier into a
byte-array.  So this can also be treated as big endian.

As it's type is currently host byte order (u64), sparse flags
an endian mismatch when compiling for little-endian systems:

.../am65-cpsw-nuss.c:3454:17: warning: incorrect type in assignment (different base types)
.../am65-cpsw-nuss.c:3454:17:    expected unsigned long long [usertype] id_temp
.../am65-cpsw-nuss.c:3454:17:    got restricted __be64 [usertype]

Address this by using __be64 as the type of id_temp.

No functional change intended.
Compile tested only.

Reviewed-by: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 12ccdd3f19aa..b08e2c3aeda3 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -3497,7 +3497,7 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct clk *clk;
 	int ale_entries;
-	u64 id_temp;
+	__be64 id_temp;
 	int ret, i;
 
 	common = devm_kzalloc(dev, sizeof(struct am65_cpsw_common), GFP_KERNEL);

-- 
2.45.2


