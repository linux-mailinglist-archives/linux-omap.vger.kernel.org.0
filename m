Return-Path: <linux-omap+bounces-2943-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B919FFDEE
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 19:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C31531629EF
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 18:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8141B423B;
	Thu,  2 Jan 2025 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="KvGCYsV3"
X-Original-To: linux-omap@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF66118B483;
	Thu,  2 Jan 2025 18:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842015; cv=pass; b=jE+Dre7T+ty4TrUaMRXlQsxWdU1zKEetKM4fzbSH9IYvV8GHB7OMVYYHRPY1yzY46HjPgMMTjE8oilIKeAcYtNCDbfO71yrOhMwniaZhNL2tP8xa9a1nQDrizb1tJaLliYDR+UPMnarRW11WiGjanMjbl1XWVUUyVjDJxtf8OaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842015; c=relaxed/simple;
	bh=tblwxUmb7AHbvm2rXCcFi2dcrO58Ntrn2JL7FcJPt2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKtgaG3k80AgAJTZrmvwl0s6Sx/UxSMCGagbz/9HK2bP9Skhg+3gPIL1qzWm9E0KEstaeV/keu/rowmerjdAd3MC6xsygO/CT+JJMWkSy/+GtK4dbkKvfNoa49F3qobcw8fVR/KPMTyaGwvGvbrmIiOfMpiAk97FCljZWirXeeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=KvGCYsV3; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.. (85-76-116-195-nat.elisa-mobile.fi [85.76.116.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4YPFNz4VnHz10DH;
	Thu,  2 Jan 2025 20:20:03 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1735842004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cw9JrGu+z6+Ep7xC+G+Ho+ahkF7zCarWeKEmRTbUS1o=;
	b=KvGCYsV3L2xQvPWmwOnGBJruUa9+YzS2owa6RCg1C9+S6SwYk2f8jax/bedccYydTEuUrN
	Ce91hS3TdZ/QFCem+keUPdPIdVFqcwbeR2cUO3wpb8axPX5ovYof22Zn67T7dVEht4GZ4s
	foNUtTD0F5yOWisYLLZAp1QWE5Ho1Rw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1735842004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cw9JrGu+z6+Ep7xC+G+Ho+ahkF7zCarWeKEmRTbUS1o=;
	b=s8CG/2DWOW4EiOFbi/lvnsoPaXmplpJ4KATo4bAzy8bm/XusjOoqm5LrGb6IlBa9990Kv4
	9/qPqiteeMnzJ+n1Odeb4POgIqSuKEx4FWhk8D8m4Z7oaqfk0dDAkS8raN0hYG1A4XYQ1o
	9CGCkPNhRPOGIhKO1IHMU2zE7VR5mio=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1735842004; a=rsa-sha256; cv=none;
	b=t3RNzQPy/LdIXctE8N7Z1qDukCxAGXfLLBR91K9JvXxTxYF6ighIeb8sgYdxLR1cuNqbpx
	+7kTRyrCA/CMuPgxG4L2rhDqPcHt+CWZNp69Jj1tjK9FKCBOBMcDXy0UowUl9ukgMdeXVG
	obP5JvYeOo3Q3Wdbx1u3oDj0MLDmBG0=
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH 3/3] Input: ads7846 - restore half-duplex support
Date: Thu,  2 Jan 2025 20:19:53 +0200
Message-ID: <20250102181953.1020878-4-aaro.koskinen@iki.fi>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102181953.1020878-1-aaro.koskinen@iki.fi>
References: <20250102181953.1020878-1-aaro.koskinen@iki.fi>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some boards, the SPI controller is limited to half-duplex and the driver
is just spamming "ads7846 spi2.0: spi_sync --> -22". Restore half-duplex
support using multiple SPI transfers.

Fixes: 9c9509717b53 ("Input: ads7846 - convert to full duplex")
Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 drivers/input/touchscreen/ads7846.c | 168 +++++++++++++++++++++++++++-
 1 file changed, 166 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 54280ecca0a7..276591c682ad 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -134,6 +134,9 @@ struct ads7846 {
 	bool			disabled;	/* P: lock */
 	bool			suspended;	/* P: lock */
 
+	int			(*setup_spi_msg)(struct ads7846 *ts,
+					const struct ads7846_platform_data *pdata);
+	void			(*read_state)(struct ads7846 *ts);
 	int			(*filter)(void *data, int data_idx, int *val);
 	void			*filter_data;
 	int			(*get_pendown_state)(void);
@@ -797,6 +800,22 @@ static int ads7846_filter(struct ads7846 *ts)
 	return 0;
 }
 
+static int ads7846_filter_one(struct ads7846 *ts, unsigned int cmd_idx)
+{
+	struct ads7846_packet *packet = ts->packet;
+	struct ads7846_buf_layout *l = &packet->l[cmd_idx];
+	int action, val;
+
+	val = ads7846_get_value(&packet->rx[l->offset + l->count - 1]);
+	action = ts->filter(ts->filter_data, cmd_idx, &val);
+	if (action == ADS7846_FILTER_REPEAT)
+		return -EAGAIN;
+	else if (action != ADS7846_FILTER_OK)
+		return -EIO;
+	ads7846_set_cmd_val(ts, cmd_idx, val);
+	return 0;
+}
+
 static void ads7846_wait_for_hsync(struct ads7846 *ts)
 {
 	if (ts->wait_for_sync) {
@@ -819,6 +838,45 @@ static void ads7846_wait_for_hsync(struct ads7846 *ts)
 		cpu_relax();
 }
 
+static void ads7846_halfd_read_state(struct ads7846 *ts)
+{
+	struct ads7846_packet *packet = ts->packet;
+	int msg_idx = 0;
+
+	packet->ignore = false;
+
+	while (msg_idx < ts->msg_count) {
+		int error;
+
+		ads7846_wait_for_hsync(ts);
+
+		error = spi_sync(ts->spi, &ts->msg[msg_idx]);
+		if (error) {
+			dev_err_ratelimited(&ts->spi->dev, "spi_sync --> %d\n",
+					    error);
+			packet->ignore = true;
+			return;
+		}
+
+		/*
+		 * Last message is power down request, no need to convert
+		 * or filter the value.
+		 */
+		if (msg_idx == ts->msg_count - 1)
+			break;
+
+		error = ads7846_filter_one(ts, msg_idx);
+		if (error == -EAGAIN) {
+			continue;
+		} else if (error) {
+			packet->ignore = true;
+			msg_idx = ts->msg_count - 1;
+		} else {
+			msg_idx++;
+		}
+	}
+}
+
 static void ads7846_read_state(struct ads7846 *ts)
 {
 	struct ads7846_packet *packet = ts->packet;
@@ -947,7 +1005,7 @@ static irqreturn_t ads7846_irq(int irq, void *handle)
 	while (!ts->stopped && get_pendown_state(ts)) {
 
 		/* pen is down, continue with the measurement */
-		ads7846_read_state(ts);
+		ts->read_state(ts);
 
 		if (!ts->stopped)
 			ads7846_report_state(ts);
@@ -1035,6 +1093,102 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 	return 0;
 }
 
+/*
+ * Set up the transfers to read touchscreen state; this assumes we
+ * use formula #2 for pressure, not #3.
+ */
+static int ads7846_halfd_spi_msg(struct ads7846 *ts,
+				 const struct ads7846_platform_data *pdata)
+{
+	struct spi_message *m = ts->msg;
+	struct spi_transfer *x = ts->xfer;
+	struct ads7846_packet *packet = ts->packet;
+	int vref = pdata->keep_vref_on;
+	unsigned int offset = 0;
+	unsigned int cmd_idx, b;
+	size_t size = 0;
+
+	if (pdata->settle_delay_usecs)
+		packet->count = 2;
+	else
+		packet->count = 1;
+
+	if (ts->model == 7846)
+		packet->cmds = 5; /* x, y, z1, z2, pwdown */
+	else
+		packet->cmds = 3; /* x, y, pwdown */
+
+	for (cmd_idx = 0; cmd_idx < packet->cmds; cmd_idx++) {
+		struct ads7846_buf_layout *l = &packet->l[cmd_idx];
+		unsigned int max_count;
+
+		if (cmd_idx == packet->cmds - 1) {
+			cmd_idx = ADS7846_PWDOWN;
+			max_count = 1;
+		} else {
+			max_count = packet->count;
+		}
+
+		l->offset = offset;
+		offset += max_count;
+		l->count = max_count;
+		l->skip = 0;
+		size += sizeof(*packet->rx) * max_count;
+	}
+
+	/* We use two transfers per command. */
+	if (ARRAY_SIZE(ts->xfer) < offset * 2)
+		return -ENOMEM;
+
+	packet->rx = devm_kzalloc(&ts->spi->dev, size, GFP_KERNEL);
+	if (!packet->rx)
+		return -ENOMEM;
+
+	if (ts->model == 7873) {
+		/*
+		 * The AD7873 is almost identical to the ADS7846
+		 * keep VREF off during differential/ratiometric
+		 * conversion modes.
+		 */
+		ts->model = 7846;
+		vref = 0;
+	}
+
+	ts->msg_count = 0;
+
+	for (cmd_idx = 0; cmd_idx < packet->cmds; cmd_idx++) {
+		struct ads7846_buf_layout *l = &packet->l[cmd_idx];
+		u8 cmd;
+
+		ts->msg_count++;
+		spi_message_init(m);
+		m->context = ts;
+
+		if (cmd_idx == packet->cmds - 1)
+			cmd_idx = ADS7846_PWDOWN;
+
+		cmd = ads7846_get_cmd(cmd_idx, vref);
+
+		for (b = 0; b < l->count; b++) {
+			packet->rx[l->offset + b].cmd = cmd;
+			x->tx_buf = &packet->rx[l->offset + b].cmd;
+			x->len = 1;
+			spi_message_add_tail(x, m);
+			x++;
+			x->rx_buf = &packet->rx[l->offset + b].data;
+			x->len = 2;
+			if (b < l->count - 1 && l->count > 1) {
+				x->delay.value = pdata->settle_delay_usecs;
+				x->delay.unit = SPI_DELAY_UNIT_USECS;
+			}
+			spi_message_add_tail(x, m);
+			x++;
+		}
+		m++;
+	}
+	return 0;
+}
+
 /*
  * Set up the transfers to read touchscreen state; this assumes we
  * use formula #2 for pressure, not #3.
@@ -1249,6 +1403,14 @@ static int ads7846_probe(struct spi_device *spi)
 	if (!ts)
 		return -ENOMEM;
 
+	if (spi->controller->flags & SPI_CONTROLLER_HALF_DUPLEX) {
+		ts->setup_spi_msg = ads7846_halfd_spi_msg;
+		ts->read_state    = ads7846_halfd_read_state;
+	} else {
+		ts->setup_spi_msg = ads7846_setup_spi_msg;
+		ts->read_state    = ads7846_read_state;
+	}
+
 	packet = devm_kzalloc(dev, sizeof(struct ads7846_packet), GFP_KERNEL);
 	if (!packet)
 		return -ENOMEM;
@@ -1343,7 +1505,9 @@ static int ads7846_probe(struct spi_device *spi)
 		ts->core_prop.swap_x_y = true;
 	}
 
-	ads7846_setup_spi_msg(ts, pdata);
+	err = ts->setup_spi_msg(ts, pdata);
+	if (err)
+		return err;
 
 	ts->reg = devm_regulator_get(dev, "vcc");
 	if (IS_ERR(ts->reg)) {
-- 
2.39.2


