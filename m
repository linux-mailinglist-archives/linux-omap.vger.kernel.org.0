Return-Path: <linux-omap+bounces-2164-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9339F972A75
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 09:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81DA5284E9F
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 07:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2531417E002;
	Tue, 10 Sep 2024 07:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXGAZn9c"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F717DE15;
	Tue, 10 Sep 2024 07:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725952693; cv=none; b=eXYUp1JSt0p5NRWbad9MRXXeo2rCyoGVJIJA2rVnIOOKrY2rCS+Ets3ZAH0RHbg0W4oYytMukk2ZmRqqChTA2Ih1NaSAMksHKNXRY4GglPY0XMqgR0imO8A7KIupMXMtEvOTOg0vYQxKus3cySbwd6/ZBX2EVcZDe/W0L6lBrlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725952693; c=relaxed/simple;
	bh=lrXtwLxrhsMeNhVchXDWYv/7wjZS6OyQyLWF1lWxXfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OTeUzOqSMH9wmVoKPF9vFD9ABcn0quokoeeMbHSydPVT21fn0C162/U7glUdJHoCshvS2fkHo9Y1H4rN7JeDRw3Xn8SjPq51TW2ddEfRcJllID+NHgw1ATs5AUGdZC6LUsrw0U2OcGizszBw4XTMj2hPwcdJz81ScEpcz6qyAG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXGAZn9c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E806C4CEC6;
	Tue, 10 Sep 2024 07:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725952693;
	bh=lrXtwLxrhsMeNhVchXDWYv/7wjZS6OyQyLWF1lWxXfE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KXGAZn9cFchdkGiVbFQqzuR+G85oFNZrltrfaEj7L8sgtJBaC2YDgi/bCsWG+wOzP
	 ewTCk6m8Jcl3FKmPLr5gyB02/rCAnq3xHtsZZ7mEZwXz4KpvG+g0CmkkAmy+rX6P8D
	 6w4SNaPLp89Le7JNwXVdKaVtDTdRuHlBjw9LsIqpV+taHOy2rmHLpcOkzncTMr1ns+
	 snwr7yfVYv8MBrfyLQDTwcroI1fiDp+r3ls2/EefyXp7i68Im/DX64jF/QB2+AiOXi
	 1ccsxeNu2WANBnSsbQjcNHHr60omkVaxg6/a8aHnrZy4LzmJAcongYzLnqDQZrSQ6r
	 CN3ga+qS2JAqw==
From: Simon Horman <horms@kernel.org>
Date: Tue, 10 Sep 2024 08:17:57 +0100
Subject: [PATCH net-next 2/3] net: ethernet: ti: am65-cpsw: Use __be64 type
 for id_temp
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-ti-warn-v1-2-afd1e404abbe@kernel.org>
References: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
In-Reply-To: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Roger Quadros <rogerq@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: netdev@vger.kernel.org, linux-omap@vger.kernel.org, 
 llvm@lists.linux.dev
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

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index a4b0e4bb7529..9e6353e0361e 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -3444,7 +3444,7 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct clk *clk;
 	int ale_entries;
-	u64 id_temp;
+	__be64 id_temp;
 	int ret, i;
 
 	common = devm_kzalloc(dev, sizeof(struct am65_cpsw_common), GFP_KERNEL);

-- 
2.45.2


