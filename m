Return-Path: <linux-omap+bounces-2414-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3938A99CFAB
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 16:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F24F52837A5
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2024 14:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3081CC179;
	Mon, 14 Oct 2024 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="ISC9u4+Q"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CED91CBE82;
	Mon, 14 Oct 2024 14:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728917632; cv=none; b=MSAp6ssLlmcIJa1c40h8wCp0PcBiHK7+bntU6ht2i73NyqbRVvzm2y0xj1j1K/OllvVUNkIpiv4zbIjjmD6zB5ExlUFF4q5uwt1G8InTXjdUOr7Enz66xfkwmZJSFvEX7CC0cYhVRC30WlFKlxuIH92MNwGYYPU9Drji1qeqleA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728917632; c=relaxed/simple;
	bh=29G8ECvETDfh2WadY+mE8ZjBcP3848PKCmM1Z1+ZSDw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MoJDxaDEBisS7jCYGJkKWCQIUTfA5XPcGA5jIvNIQ9+MH7aawn02jDC5WJ8BKle8vQWxSPlPdzw6ntn37j2iRMzDpe+gWeYy9LRMGm4GSC1Xk6efho8w8kRr+Svu3es0izyn5x+D7XyQF/WqVE2o9LYwDdcvDF9K2whKu3yzyXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=ISC9u4+Q; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Aa5zOAlNxgnq3cdfWL7tQky3C+H1xGL4iFEI0MzyYuE=; b=ISC9u4+Q6qi04JODGrlJRT5icY
	Z9dmTXFrXegiWZP4U8QZu8ZXj1QtHCZ4Ks8EZToMGkzpEHfX9yix5kbKtZxHB5tD/wFVk2QZU+7sO
	Dx4bIdHzmckFLqA8msmM4tTm/uJaVNNmtqbWcSfszmdrLZYrOfopazTYH9Ah778urnZ1b0Ny1J07V
	/CRu/FioD1pwVfx11V3v4CVlyeoN2yj1KmzcS+6xpgxJwHPWb1C1eQ12MoM3pzxANJv0Fsfq3CapD
	P2UPtWhQ7ZKqJoI4Ae/2G95cTPUflkcsuvqWwBt2XwpuO5OzixvNZKbwdsqZc9UL1trGm7IgNOuDC
	17FpiUxg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-omap@vger.kernel.org
Subject: [PATCH 1/2] Input: tsc2007 - accept standard properties
Date: Mon, 14 Oct 2024 16:12:39 +0200
Message-Id: <20241014141240.92072-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241014141240.92072-1-andreas@kemnade.info>
References: <20241014141240.92072-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only some driver-specific properties were accepted, change it
to use the now-available standard properties which are
found in devicetrees containing this chip.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/input/touchscreen/tsc2007.h      | 2 ++
 drivers/input/touchscreen/tsc2007_core.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/tsc2007.h b/drivers/input/touchscreen/tsc2007.h
index 69b08dd6c8df1..e346fb4f75521 100644
--- a/drivers/input/touchscreen/tsc2007.h
+++ b/drivers/input/touchscreen/tsc2007.h
@@ -19,6 +19,7 @@
 #ifndef _TSC2007_H
 #define _TSC2007_H
 
+#include <linux/input/touchscreen.h>
 struct gpio_desc;
 
 #define TSC2007_MEASURE_TEMP0		(0x0 << 4)
@@ -63,6 +64,7 @@ struct tsc2007 {
 
 	struct i2c_client	*client;
 
+	struct touchscreen_properties prop;
 	u16			model;
 	u16			x_plate_ohms;
 	u16			max_rt;
diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index 8d832a372b897..5252301686ec6 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -142,8 +142,7 @@ static irqreturn_t tsc2007_soft_irq(int irq, void *handle)
 			rt = ts->max_rt - rt;
 
 			input_report_key(input, BTN_TOUCH, 1);
-			input_report_abs(input, ABS_X, tc.x);
-			input_report_abs(input, ABS_Y, tc.y);
+			touchscreen_report_pos(input, &ts->prop, tc.x, tc.y, false);
 			input_report_abs(input, ABS_PRESSURE, rt);
 
 			input_sync(input);
@@ -339,9 +338,9 @@ static int tsc2007_probe(struct i2c_client *client)
 	input_set_drvdata(input_dev, ts);
 
 	input_set_capability(input_dev, EV_KEY, BTN_TOUCH);
-
 	input_set_abs_params(input_dev, ABS_X, 0, MAX_12BIT, ts->fuzzx, 0);
 	input_set_abs_params(input_dev, ABS_Y, 0, MAX_12BIT, ts->fuzzy, 0);
+	touchscreen_parse_properties(input_dev, false, &ts->prop);
 	input_set_abs_params(input_dev, ABS_PRESSURE, 0, MAX_12BIT,
 			     ts->fuzzz, 0);
 
-- 
2.39.2


