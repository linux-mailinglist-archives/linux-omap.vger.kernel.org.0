Return-Path: <linux-omap+bounces-2373-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DD3997FB6
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 10:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B44EB2582D
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 08:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA19A1FA270;
	Thu, 10 Oct 2024 07:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="dPwUfmjd"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA9D1F9417;
	Thu, 10 Oct 2024 07:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728546253; cv=none; b=ixxACix+9LuUU3MDuiUr+g2h/E93rQJqpFldONtZH9usOfaFFH9Z8SgHp8mx50wJp+MgkBNFZTItYIuvXRlUBpXIuxcuGPDREx5anNp8H8wDVNhrjmq1dNCMuedXFJN0saxtH+HeDOPXkQxN5dJICSbXzfwkpJpnrHzXXbFZDm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728546253; c=relaxed/simple;
	bh=Zfm5WdnxB5JQj8ViyWS1iuKc6KGaS55oRV/JIcQEN9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LFYsfmFxyT7TfQQz674a043E/UVBd4DW/RghG7iPbDBMuMr7TzM5F3T1ctXn5gVcNjZ4xnAtPrqliYNGVJ3qjaKjI1x8X7LDrMCM5h3qGmytwDNK/XTAu3vqq+rDC4xYyOdiQQK2ordyVWwVwf+w6DSuM0KP6wukFGy2PFysNQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=dPwUfmjd; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=n0WcT2lZw1h2vJag9n+5dAZkKzRqfsiI2Q87+Bz0eX4=; b=dPwUfmjdC/U7ZKIyAtRNaWH5ne
	J9Etce4G/IbhoaZ0Rs4u/aZXanIHnghWxjgumYi1vs0pbM+x5I+tSKNyKeluR8yZuRe06D55Z0IyZ
	yHKbyMZQSLjFQw03b7bCm6J+paa1eNrBIAc5Z3Uh5pz+6N50gCA7Os9TloUZ/cp+PHyQnOjOslGK1
	Cnwt4DjHTMb6d27xXsbonWjK2uOVRiMg1GHeKQIWB42SkZviRazhi4oyhesZZiZeeFEx8EAXz7hFq
	okTNiQpZm8FYaF6/rZFTqfloK/l52ZIfpGK+m6CmKYK12v+6qBCDAvmAxh8KgBO3NscQeddV6kmPf
	C/yKb1Cg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Kevin Hilman <khilman@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	linux-kernel@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	linux-clk@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-omap@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v4 2/3] clk: twl: remove is_prepared
Date: Thu, 10 Oct 2024 09:43:54 +0200
Message-Id: <20241010074355.58161-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241010074355.58161-1-andreas@kemnade.info>
References: <20241010074355.58161-1-andreas@kemnade.info>
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


