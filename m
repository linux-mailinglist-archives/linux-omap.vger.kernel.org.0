Return-Path: <linux-omap+bounces-2778-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E21F19E5F9E
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 21:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C780281758
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 20:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35B81BBBF4;
	Thu,  5 Dec 2024 20:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jns8WAwE"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4695D1ADFF8;
	Thu,  5 Dec 2024 20:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733431466; cv=none; b=evouMz7gKvm6Nw3vzBVF3BbZ8OS1DXP93e5Q3D/sdYjPwNdykqISd9LQ2yCczVmWzhamspaLyhxQ055+b0aq0iHuR2xUwI+ixxu4qyHvFd3iznNeyGCRsFQFodXk1m9mzJ3Xxw/nTmV8J8LHISAyZrpwf9X0oZ78jn0dSBJXYLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733431466; c=relaxed/simple;
	bh=EOr8fd1NpXyKVkhXqlLHCb3jTIPSl2EtqHpnGFzU7aw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lpANJ8KM+jx2C0HfXqBi5YyQ8WwWpI2uNIcAjYj6FMO43ncQmS1CM/y9cz3yvQBfVeQeKKIlDQ/iJyiK6PAYYu0K7i3pu7BB3dnN4VxVTxa5k5rwM3/reI+lAvIq3t5Q9f9tRKzXIoiMsS8olvZ+t39ZPEJAGmfAooNkbRsyp0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jns8WAwE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57FDC4CEDD;
	Thu,  5 Dec 2024 20:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733431465;
	bh=EOr8fd1NpXyKVkhXqlLHCb3jTIPSl2EtqHpnGFzU7aw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jns8WAwExf9Ffa1pgVwRV4gvSoPHSOMXz0TAnjWSO29vB8sYpgoVJhX2Bm6Dhw1ke
	 wdaddLg8IkYukJR/Ge2RJI+cYxdDLBCk9TiGmwz8QxEe9bFMEXB/xF/NVXO4foE0o0
	 vK4wP0Wh796/4ETHCPFmEEf3OrsP44XVp58Md9u4Nzvx3k1HY2mVEmxI2PDWr5s8ia
	 JndvcXejCXd2HyWDY8tI1JKdWlHZtKpC0en1feCEn5+OmfDIM22qBn0AhnNzB9ocXH
	 DBWJ6ygqzHivymNR0cLbH282zkZjoof+UruiVYjsdzTVENWOZshFLWtsBruE68CTuD
	 iErZgM+GHBKDA==
From: akemnade@kernel.org
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Tony Lindgren <tony@atomide.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	khilman@baylibre.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/2] Input: tsc2007 - accept standard properties
Date: Thu,  5 Dec 2024 21:44:12 +0100
Message-Id: <20241205204413.2466775-2-akemnade@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241205204413.2466775-1-akemnade@kernel.org>
References: <20241205204413.2466775-1-akemnade@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andreas Kemnade <andreas@kemnade.info>

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


