Return-Path: <linux-omap+bounces-2417-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3233F99D453
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 18:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D08E91F22C5B
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 16:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB271B4F04;
	Mon, 14 Oct 2024 16:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="x4rVEZB5"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9C41AC447;
	Mon, 14 Oct 2024 16:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728922281; cv=none; b=TaRTEm7uZZAq2ZWud4WzVPEQnJHvZ2UVsqAZzjnJAndZ844STglpQywNsKHBFSAI8hlXK7nc6vBCq8EwNU37Gg0wgwZEcHks2Q7rQdNLmFFuTjCLiZHBqJpvqUK5JjjeqDA0m2sNQFYtohF7/fexLHDMVsrIE/C+S/zpb9aMbjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728922281; c=relaxed/simple;
	bh=Zfm5WdnxB5JQj8ViyWS1iuKc6KGaS55oRV/JIcQEN9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qfiZ+gMDqmgrhM+ZEAdrCE4zI37LPW49PDawENASXuTAP1DVE/nbzTJSTD3DgQI391RrcaTgBQCinPj9v6OP0Dvf/UXhiYf1xcRxyufn7nTTjCFfL5M6dDdbqsig13z6MD1ScJ9ccFwLRG2WwlknrYTDXhozcuQSSN2CqVkESuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=x4rVEZB5; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=n0WcT2lZw1h2vJag9n+5dAZkKzRqfsiI2Q87+Bz0eX4=; b=x4rVEZB5L7/LYQbldOW7G0SWcB
	PEkAQYFq1tjd6UIcV7k4JGY4Q0LnWh6P4SHdTtTm1uXVhVLeU+QiHV50/jlCwC9KnHZn8sCgml1xY
	xtRkUh4zjE453KIrE7F1aiiC1AOsRvZov/3hdh8DX5FBpnbi4Lr9g2TuES8yt6TocPMcGnoLurNIQ
	1DyklhGACPZYrtut08UAgstkewqfRlas0CuJqdJgan+YFl8ML9P3YN3QVLFRp/EP7QtcX9Xi6B3Gn
	AvXdF3xmqQlyhv7MNcbxBRK+QDaKaxVSqsSQqd++YYMwmDdYIGrvQ8Y0ertqxHoCx7ZkD8y1a5TEZ
	027DcpVw==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Lee Jones <lee@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v5 2/3] clk: twl: remove is_prepared
Date: Mon, 14 Oct 2024 18:11:08 +0200
Message-Id: <20241014161109.2222-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241014161109.2222-1-andreas@kemnade.info>
References: <20241014161109.2222-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove is_prepared to simplify adding of TWL6030 support.
The default implementation should be enough.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/clk/clk-twl.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/clk/clk-twl.c b/drivers/clk/clk-twl.c
index eab9d3c8ed8a..1d684b358401 100644
--- a/drivers/clk/clk-twl.c
+++ b/drivers/clk/clk-twl.c
@@ -77,26 +77,9 @@ static void twl6032_clks_unprepare(struct clk_hw *hw)
 		dev_err(cinfo->dev, "clk unprepare failed\n");
 }
 
-static int twl6032_clks_is_prepared(struct clk_hw *hw)
-{
-	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
-	int val;
-
-	val = twlclk_read(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE);
-	if (val < 0) {
-		dev_err(cinfo->dev, "clk read failed\n");
-		return val;
-	}
-
-	val &= TWL6030_CFG_STATE_MASK;
-
-	return val == TWL6030_CFG_STATE_ON;
-}
-
 static const struct clk_ops twl6032_clks_ops = {
 	.prepare	= twl6032_clks_prepare,
 	.unprepare	= twl6032_clks_unprepare,
-	.is_prepared	= twl6032_clks_is_prepared,
 	.recalc_rate	= twl_clks_recalc_rate,
 };
 
-- 
2.39.5


