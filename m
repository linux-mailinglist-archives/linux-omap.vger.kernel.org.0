Return-Path: <linux-omap+bounces-2754-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8279A9E0BE2
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 20:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45217B29844
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 18:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C041DDC3D;
	Mon,  2 Dec 2024 18:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gsu6c73G"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E33770800;
	Mon,  2 Dec 2024 18:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733165586; cv=none; b=BSeNNz5uuzP0Gd43VfXduMPKZXR4VktHetOQOFgBoz3GMAK+59GKNXAiM75ukHUkANW3XlizLGbXeqmjVQmXsy5V1cD6x3hj9r66oK0qW+2JTP+2MJIDL6l8v4768RB8MtkwVEgdQGj2uh6fx7HHZwZIrZqkr6JIXUHd59xHv1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733165586; c=relaxed/simple;
	bh=hiXhwDtV2n9mc0lMV8zQfmGBhEN8onvBYaK9wqYN9h4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q0LBfyDitE1Z9xfzQpDzWyX1YjV3cc/ygpDo3FxF+s/rjDYBEwTK8MGR5QTC6jSCsgMnvOsssfV7Flr6GWOndYMJE6emj+57O7fSxov3+v2R3aU3Yat+lp5ZovtW3Y/5nhVnDx7gibGgzW/mjQk1AUgdcWdfTtLchUPpKaA/hGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gsu6c73G; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724fc1aaa91so4197804b3a.3;
        Mon, 02 Dec 2024 10:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733165583; x=1733770383; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VABbsxsOs6yzRx08jFSDzQshm+yJ9bODt00JOhciCiU=;
        b=Gsu6c73G7o1OWJFyaJ9YhjpgZ7J4lZRYrsAxrTVG5JoV7PUAMiaNWmLyhB3e28AXN/
         G/Y0uNxPleHofPUfxubKgJC9NkcgjyvcsA58jmD9pP9aY82j4z/nwC+K0oylRhgJtOZf
         o9/ToZk+vtTAo0B9OAMAfX3RkSVq6uOdSVrjTdzULwdnsmIYMeXEc3AjKSQMy7HOkgwY
         j35LGxLcCCJh3l/9EDSgsjesH9udOy4vIhkStfRMaaDIN2qNwoCer+LURj995GYkR+9b
         +UOmw3+qU20GxuRKz4tYRPL64neJEIY2KBzmtf72xo5ziZLmcGhrqiRCvJgNC0im+pkY
         iLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733165583; x=1733770383;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VABbsxsOs6yzRx08jFSDzQshm+yJ9bODt00JOhciCiU=;
        b=bipbH4NYUtMIfinvLyIn1i8lh0f1SNHU+OpQnVb4AYIyjLqcp0Qespq4Zu6C5cc0bS
         LKUhL2aC4OhKFsLf6e6Oez2lAh4iZl5vYYaQh3Bpj4ZrHOFVE7LC01e/+zqDjof1DsEL
         W4ScOkMZGXGqMnvI22RQvLnI1tvuTcaQtPduFlyAwtjw/WuXzHWQiRawdS7VXrT2LTx8
         lfDkOLaBh8Vf29xDwvhxERzDQRhOO7XWB3mCbT4JXZXIL6Dckw88EN6MWKisPGgeGXnR
         CfRpiYCZCk+0t8ueWglBptTl5Km/geH0EGBqbpDykP+U5+ZBW5ChJCxpIAVsJZHJndvW
         ytmA==
X-Forwarded-Encrypted: i=1; AJvYcCU2rl3gf0tzCQxnIo11w8RyNCnlAFYVS3SQbVSU6CxOTDF0A6oZvTXGmwhu1l0Vrq3gzJalZiLtRY7bryQ=@vger.kernel.org, AJvYcCUQG5maKpQpSPcJ5/l4XngDXFsgVJrj9o86umaRcPXKHiA+zZic4vjOcSvtATkzKCURT3SXark2D6F3Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1o8kazFawYZExWGs3oi/RNdR814eepqA3dtymOmSovJH9nJ8k
	D76t7HGBBYYI6zOYsFzT9gmRfQVk1jpgrPa8lcqM94Qzhs8ceU7h
X-Gm-Gg: ASbGncvvpsLKo8+jFPxwilkUBKM0eueRQDG4aXnx4JJuxmCjtCmhvev09fheRWMOqmg
	hfhgrytqhYRIWXLOtIwZcjKA5Az2npOJr7fWEeYVsAzt1DhCrIx+t7vZ4V5x3IqRWavr+5QlYVy
	6VQExzOOJUgdGcVd+l+pflVPZnyyt8E2LLreQ6T39nAJQCKuoL3GQn1ExpEfuHFyIpxSEJ35elg
	Wq++ns/uHf1k1RcTZkRQ388sQKGPhQtRW5jyXN6fTd9knWHDCg5pWk=
X-Google-Smtp-Source: AGHT+IGuWxLXOB6ACPLdfhtbTkr3ADxcgAfLZjtQNYNTfVn+ChhNvoWkvEphMEAHPJNPJTuE388vOg==
X-Received: by 2002:a05:6a00:4096:b0:725:48e6:10a4 with SMTP id d2e1a72fcca58-72548e61306mr25131315b3a.4.1733165583344;
        Mon, 02 Dec 2024 10:53:03 -0800 (PST)
Received: from melbuntu ([2401:4900:1cb8:f68c:2b8f:b535:bac8:f757])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3f6sm8844174b3a.50.2024.12.02.10.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 10:53:02 -0800 (PST)
Date: Tue, 3 Dec 2024 00:22:51 +0530
From: Dhruv Menon <dhruvmenon1104@gmail.com>
To: vigneshr@ti.com, andi.shyti@kernel.org
Cc: aaro.koskinen@iki.fi, jmkrzyszt@gmail.com, tony@atomide.com,
	andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: omap: Cleaned up coding style and parameters
Message-ID: <Z04CA8fGCC-nyZIY@melbuntu>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This commit addresses the coding style issues present in i2c-omap.c,
identified by checkpatch.pl and removes unused parameters present in
two functions.

1. Coding style issues includes Macro Utilization, alignnment
   correction, updating ms_sleep() < 20 to usleep_range().
2. Removed unused parameters from omap_i2c_receive_data()
   and omap_i2c_transmit_data().

No functional changes have been introduced in this commit.

Signed-off-by: Dhruv Menon <dhruvmenon1104@gmail.com>
---
 drivers/i2c/busses/i2c-omap.c | 209 ++++++++++++++++------------------
 1 file changed, 101 insertions(+), 108 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 1d9ad25c89ae..eee1671edebd 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -78,39 +78,39 @@ enum {
 };
 
 /* I2C Interrupt Enable Register (OMAP_I2C_IE): */
-#define OMAP_I2C_IE_XDR		(1 << 14)	/* TX Buffer drain int enable */
-#define OMAP_I2C_IE_RDR		(1 << 13)	/* RX Buffer drain int enable */
-#define OMAP_I2C_IE_XRDY	(1 << 4)	/* TX data ready int enable */
-#define OMAP_I2C_IE_RRDY	(1 << 3)	/* RX data ready int enable */
-#define OMAP_I2C_IE_ARDY	(1 << 2)	/* Access ready int enable */
-#define OMAP_I2C_IE_NACK	(1 << 1)	/* No ack interrupt enable */
-#define OMAP_I2C_IE_AL		(1 << 0)	/* Arbitration lost int ena */
+#define OMAP_I2C_IE_XDR		BIT(14)	/* TX Buffer drain int enable */
+#define OMAP_I2C_IE_RDR		BIT(13)	/* RX Buffer drain int enable */
+#define OMAP_I2C_IE_XRDY	BIT(4)	/* TX data ready int enable */
+#define OMAP_I2C_IE_RRDY	BIT(3)	/* RX data ready int enable */
+#define OMAP_I2C_IE_ARDY	BIT(2)	/* Access ready int enable */
+#define OMAP_I2C_IE_NACK	BIT(1)	/* No ack interrupt enable */
+#define OMAP_I2C_IE_AL		BIT(0)	/* Arbitration lost int ena */
 
 /* I2C Status Register (OMAP_I2C_STAT): */
-#define OMAP_I2C_STAT_XDR	(1 << 14)	/* TX Buffer draining */
-#define OMAP_I2C_STAT_RDR	(1 << 13)	/* RX Buffer draining */
-#define OMAP_I2C_STAT_BB	(1 << 12)	/* Bus busy */
-#define OMAP_I2C_STAT_ROVR	(1 << 11)	/* Receive overrun */
-#define OMAP_I2C_STAT_XUDF	(1 << 10)	/* Transmit underflow */
-#define OMAP_I2C_STAT_AAS	(1 << 9)	/* Address as slave */
-#define OMAP_I2C_STAT_BF	(1 << 8)	/* Bus Free */
-#define OMAP_I2C_STAT_XRDY	(1 << 4)	/* Transmit data ready */
-#define OMAP_I2C_STAT_RRDY	(1 << 3)	/* Receive data ready */
-#define OMAP_I2C_STAT_ARDY	(1 << 2)	/* Register access ready */
-#define OMAP_I2C_STAT_NACK	(1 << 1)	/* No ack interrupt enable */
-#define OMAP_I2C_STAT_AL	(1 << 0)	/* Arbitration lost int ena */
+#define OMAP_I2C_STAT_XDR	BIT(14)	/* TX Buffer draining */
+#define OMAP_I2C_STAT_RDR	BIT(13)	/* RX Buffer draining */
+#define OMAP_I2C_STAT_BB	BIT(12)	/* Bus busy */
+#define OMAP_I2C_STAT_ROVR	BIT(11)	/* Receive overrun */
+#define OMAP_I2C_STAT_XUDF	BIT(10)	/* Transmit underflow */
+#define OMAP_I2C_STAT_AAS	BIT(9)	/* Address as slave */
+#define OMAP_I2C_STAT_BF	BIT(8)	/* Bus Free */
+#define OMAP_I2C_STAT_XRDY	BIT(4)	/* Transmit data ready */
+#define OMAP_I2C_STAT_RRDY	BIT(3)	/* Receive data ready */
+#define OMAP_I2C_STAT_ARDY	BIT(2)	/* Register access ready */
+#define OMAP_I2C_STAT_NACK	BIT(1)	/* No ack interrupt enable */
+#define OMAP_I2C_STAT_AL	BIT(0)	/* Arbitration lost int ena */
 
 /* I2C WE wakeup enable register */
-#define OMAP_I2C_WE_XDR_WE	(1 << 14)	/* TX drain wakup */
-#define OMAP_I2C_WE_RDR_WE	(1 << 13)	/* RX drain wakeup */
-#define OMAP_I2C_WE_AAS_WE	(1 << 9)	/* Address as slave wakeup*/
-#define OMAP_I2C_WE_BF_WE	(1 << 8)	/* Bus free wakeup */
-#define OMAP_I2C_WE_STC_WE	(1 << 6)	/* Start condition wakeup */
-#define OMAP_I2C_WE_GC_WE	(1 << 5)	/* General call wakeup */
-#define OMAP_I2C_WE_DRDY_WE	(1 << 3)	/* TX/RX data ready wakeup */
-#define OMAP_I2C_WE_ARDY_WE	(1 << 2)	/* Reg access ready wakeup */
-#define OMAP_I2C_WE_NACK_WE	(1 << 1)	/* No acknowledgment wakeup */
-#define OMAP_I2C_WE_AL_WE	(1 << 0)	/* Arbitration lost wakeup */
+#define OMAP_I2C_WE_XDR_WE	BIT(14)	/* TX drain wakup */
+#define OMAP_I2C_WE_RDR_WE	BIT(13)	/* RX drain wakeup */
+#define OMAP_I2C_WE_AAS_WE	BIT(9)	/* Address as slave wakeup*/
+#define OMAP_I2C_WE_BF_WE	BIT(8)	/* Bus free wakeup */
+#define OMAP_I2C_WE_STC_WE	BIT(6)	/* Start condition wakeup */
+#define OMAP_I2C_WE_GC_WE	BIT(5)	/* General call wakeup */
+#define OMAP_I2C_WE_DRDY_WE	BIT(3)	/* TX/RX data ready wakeup */
+#define OMAP_I2C_WE_ARDY_WE	BIT(2)	/* Reg access ready wakeup */
+#define OMAP_I2C_WE_NACK_WE	BIT(1)	/* No acknowledgment wakeup */
+#define OMAP_I2C_WE_AL_WE	BIT(0)	/* Arbitration lost wakeup */
 
 #define OMAP_I2C_WE_ALL		(OMAP_I2C_WE_XDR_WE | OMAP_I2C_WE_RDR_WE | \
 				OMAP_I2C_WE_AAS_WE | OMAP_I2C_WE_BF_WE | \
@@ -119,59 +119,59 @@ enum {
 				OMAP_I2C_WE_NACK_WE | OMAP_I2C_WE_AL_WE)
 
 /* I2C Buffer Configuration Register (OMAP_I2C_BUF): */
-#define OMAP_I2C_BUF_RDMA_EN	(1 << 15)	/* RX DMA channel enable */
-#define OMAP_I2C_BUF_RXFIF_CLR	(1 << 14)	/* RX FIFO Clear */
-#define OMAP_I2C_BUF_XDMA_EN	(1 << 7)	/* TX DMA channel enable */
-#define OMAP_I2C_BUF_TXFIF_CLR	(1 << 6)	/* TX FIFO Clear */
+#define OMAP_I2C_BUF_RDMA_EN	BIT(15)	/* RX DMA channel enable */
+#define OMAP_I2C_BUF_RXFIF_CLR	BIT(14)	/* RX FIFO Clear */
+#define OMAP_I2C_BUF_XDMA_EN	BIT(7)	/* TX DMA channel enable */
+#define OMAP_I2C_BUF_TXFIF_CLR	BIT(6)	/* TX FIFO Clear */
 
 /* I2C Configuration Register (OMAP_I2C_CON): */
-#define OMAP_I2C_CON_EN		(1 << 15)	/* I2C module enable */
-#define OMAP_I2C_CON_BE		(1 << 14)	/* Big endian mode */
-#define OMAP_I2C_CON_OPMODE_HS	(1 << 12)	/* High Speed support */
-#define OMAP_I2C_CON_STB	(1 << 11)	/* Start byte mode (master) */
-#define OMAP_I2C_CON_MST	(1 << 10)	/* Master/slave mode */
-#define OMAP_I2C_CON_TRX	(1 << 9)	/* TX/RX mode (master only) */
-#define OMAP_I2C_CON_XA		(1 << 8)	/* Expand address */
-#define OMAP_I2C_CON_RM		(1 << 2)	/* Repeat mode (master only) */
-#define OMAP_I2C_CON_STP	(1 << 1)	/* Stop cond (master only) */
-#define OMAP_I2C_CON_STT	(1 << 0)	/* Start condition (master) */
+#define OMAP_I2C_CON_EN		BIT(15)	/* I2C module enable */
+#define OMAP_I2C_CON_BE		BIT(14)	/* Big endian mode */
+#define OMAP_I2C_CON_OPMODE_HS	BIT(12)	/* High Speed support */
+#define OMAP_I2C_CON_STB	BIT(11)	/* Start byte mode (master) */
+#define OMAP_I2C_CON_MST	BIT(10)	/* Master/slave mode */
+#define OMAP_I2C_CON_TRX	BIT(9)	/* TX/RX mode (master only) */
+#define OMAP_I2C_CON_XA		BIT(8)	/* Expand address */
+#define OMAP_I2C_CON_RM		BIT(2)	/* Repeat mode (master only) */
+#define OMAP_I2C_CON_STP	BIT(1)	/* Stop cond (master only) */
+#define OMAP_I2C_CON_STT	BIT(0)	/* Start condition (master) */
 
 /* I2C SCL time value when Master */
 #define OMAP_I2C_SCLL_HSSCLL	8
 #define OMAP_I2C_SCLH_HSSCLH	8
 
 /* I2C System Test Register (OMAP_I2C_SYSTEST): */
-#define OMAP_I2C_SYSTEST_ST_EN		(1 << 15)	/* System test enable */
-#define OMAP_I2C_SYSTEST_FREE		(1 << 14)	/* Free running mode */
-#define OMAP_I2C_SYSTEST_TMODE_MASK	(3 << 12)	/* Test mode select */
-#define OMAP_I2C_SYSTEST_TMODE_SHIFT	(12)		/* Test mode select */
+#define OMAP_I2C_SYSTEST_ST_EN		BIT(15)	/* System test enable */
+#define OMAP_I2C_SYSTEST_FREE		BIT(14)	/* Free running mode */
+#define OMAP_I2C_SYSTEST_TMODE_MASK	GENMASK(13, 12)	/* Test mode select */
+#define OMAP_I2C_SYSTEST_TMODE_SHIFT	(12)	/* Test mode select */
 /* Functional mode */
-#define OMAP_I2C_SYSTEST_SCL_I_FUNC	(1 << 8)	/* SCL line input value */
-#define OMAP_I2C_SYSTEST_SCL_O_FUNC	(1 << 7)	/* SCL line output value */
-#define OMAP_I2C_SYSTEST_SDA_I_FUNC	(1 << 6)	/* SDA line input value */
-#define OMAP_I2C_SYSTEST_SDA_O_FUNC	(1 << 5)	/* SDA line output value */
+#define OMAP_I2C_SYSTEST_SCL_I_FUNC	BIT(8)	/* SCL line input value */
+#define OMAP_I2C_SYSTEST_SCL_O_FUNC	BIT(7)	/* SCL line output value */
+#define OMAP_I2C_SYSTEST_SDA_I_FUNC	BIT(6)	/* SDA line input value */
+#define OMAP_I2C_SYSTEST_SDA_O_FUNC	BIT(5)	/* SDA line output value */
 /* SDA/SCL IO mode */
-#define OMAP_I2C_SYSTEST_SCL_I		(1 << 3)	/* SCL line sense in */
-#define OMAP_I2C_SYSTEST_SCL_O		(1 << 2)	/* SCL line drive out */
-#define OMAP_I2C_SYSTEST_SDA_I		(1 << 1)	/* SDA line sense in */
-#define OMAP_I2C_SYSTEST_SDA_O		(1 << 0)	/* SDA line drive out */
+#define OMAP_I2C_SYSTEST_SCL_I		BIT(3)	/* SCL line sense in */
+#define OMAP_I2C_SYSTEST_SCL_O		BIT(2)	/* SCL line drive out */
+#define OMAP_I2C_SYSTEST_SDA_I		BIT(1)	/* SDA line sense in */
+#define OMAP_I2C_SYSTEST_SDA_O		BIT(0)	/* SDA line drive out */
 
 /* OCP_SYSSTATUS bit definitions */
-#define SYSS_RESETDONE_MASK		(1 << 0)
+#define SYSS_RESETDONE_MASK		BIT(0)
 
 /* OCP_SYSCONFIG bit definitions */
-#define SYSC_CLOCKACTIVITY_MASK		(0x3 << 8)
-#define SYSC_SIDLEMODE_MASK		(0x3 << 3)
-#define SYSC_ENAWAKEUP_MASK		(1 << 2)
-#define SYSC_SOFTRESET_MASK		(1 << 1)
-#define SYSC_AUTOIDLE_MASK		(1 << 0)
+#define SYSC_CLOCKACTIVITY_MASK		GENMASK(9, 8)
+#define SYSC_SIDLEMODE_MASK		GENMASK(4, 3)
+#define SYSC_ENAWAKEUP_MASK		BIT(2)
+#define SYSC_SOFTRESET_MASK		BIT(1)
+#define SYSC_AUTOIDLE_MASK		BIT(0)
 
 #define SYSC_IDLEMODE_SMART		0x2
 #define SYSC_CLOCKACTIVITY_FCLK		0x2
 
 /* Errata definitions */
-#define I2C_OMAP_ERRATA_I207		(1 << 0)
-#define I2C_OMAP_ERRATA_I462		(1 << 1)
+#define I2C_OMAP_ERRATA_I207		BIT(0)
+#define I2C_OMAP_ERRATA_I462		BIT(1)
 
 #define OMAP_I2C_IP_V2_INTERRUPTS_MASK	0x6FFF
 
@@ -277,7 +277,6 @@ static inline u16 omap_i2c_read_reg(struct omap_i2c_dev *omap, int reg)
 
 static void __omap_i2c_init(struct omap_i2c_dev *omap)
 {
-
 	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
 
 	/* Setup clock prescaler to obtain approx 12MHz I2C module clock: */
@@ -316,22 +315,22 @@ static int omap_i2c_reset(struct omap_i2c_dev *omap)
 
 		/* Disable I2C controller before soft reset */
 		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG,
-			omap_i2c_read_reg(omap, OMAP_I2C_CON_REG) &
-				~(OMAP_I2C_CON_EN));
+				   omap_i2c_read_reg(omap, OMAP_I2C_CON_REG) &
+		~(OMAP_I2C_CON_EN));
 
 		omap_i2c_write_reg(omap, OMAP_I2C_SYSC_REG, SYSC_SOFTRESET_MASK);
 		/* For some reason we need to set the EN bit before the
-		 * reset done bit gets set. */
+		 * reset done bit gets set.
+		 */
 		timeout = jiffies + OMAP_I2C_TIMEOUT;
 		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, OMAP_I2C_CON_EN);
 		while (!(omap_i2c_read_reg(omap, OMAP_I2C_SYSS_REG) &
 			 SYSS_RESETDONE_MASK)) {
 			if (time_after(jiffies, timeout)) {
-				dev_warn(omap->dev, "timeout waiting "
-						"for controller reset\n");
+				dev_warn(omap->dev, "timeout waiting for controller reset\n");
 				return -ETIMEDOUT;
 			}
-			msleep(1);
+			usleep_range(1000, 2000);
 		}
 
 		/* SYSC register is cleared by the reset; rewrite it */
@@ -396,15 +395,13 @@ static int omap_i2c_init(struct omap_i2c_dev *omap)
 	}
 
 	if (!(omap->flags & OMAP_I2C_FLAG_SIMPLE_CLOCK)) {
-
 		/*
 		 * HSI2C controller internal clk rate should be 19.2 Mhz for
 		 * HS and for all modes on 2430. On 34xx we can use lower rate
 		 * to get longer filter period for better noise suppression.
 		 * The filter is iclk (fclk for HS) period.
 		 */
-		if (omap->speed > 400 ||
-			       omap->flags & OMAP_I2C_FLAG_FORCE_19200_INT_CLK)
+		if (omap->speed > 400 || omap->flags & OMAP_I2C_FLAG_FORCE_19200_INT_CLK)
 			internal_clk = 19200;
 		else if (omap->speed > 100)
 			internal_clk = 9600;
@@ -506,7 +503,7 @@ static int omap_i2c_wait_for_bb(struct omap_i2c_dev *omap)
 	while (omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG) & OMAP_I2C_STAT_BB) {
 		if (time_after(jiffies, timeout))
 			return omap_i2c_recover_bus(omap);
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 
 	return 0;
@@ -595,7 +592,7 @@ static int omap_i2c_wait_for_bb_valid(struct omap_i2c_dev *omap)
 			return omap_i2c_recover_bus(omap);
 		}
 
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 
 	omap->bb_valid = 1;
@@ -616,7 +613,7 @@ static void omap_i2c_resize_fifo(struct omap_i2c_dev *omap, u8 size, bool is_rx)
 	 * then we might use draining feature to transfer the remaining bytes.
 	 */
 
-	omap->threshold = clamp(size, (u8) 1, omap->fifo_size);
+	omap->threshold = clamp(size, (u8)1, omap->fifo_size);
 
 	buf = omap_i2c_read_reg(omap, OMAP_I2C_BUF_REG);
 
@@ -636,7 +633,7 @@ static void omap_i2c_resize_fifo(struct omap_i2c_dev *omap, u8 size, bool is_rx)
 		omap->b_hw = 1; /* Enable hardware fixes */
 
 	/* calculate wakeup latency constraint for MPU */
-	if (omap->set_mpu_wkup_lat != NULL)
+	if (omap->set_mpu_wkup_lat)
 		omap->latency = (1000000 * omap->threshold) /
 			(1000 * omap->speed / 8);
 }
@@ -718,13 +715,13 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
 	if (omap->b_hw && stop) {
 		unsigned long delay = jiffies + OMAP_I2C_TIMEOUT;
 		u16 con = omap_i2c_read_reg(omap, OMAP_I2C_CON_REG);
+
 		while (con & OMAP_I2C_CON_STT) {
 			con = omap_i2c_read_reg(omap, OMAP_I2C_CON_REG);
 
 			/* Let the user know if i2c is in a bad state */
 			if (time_after(jiffies, delay)) {
-				dev_err(omap->dev, "controller timed out "
-				"waiting for start condition to finish\n");
+				dev_err(omap->dev, "controller timed out waiting for start condition to finish\n");
 				return -ETIMEDOUT;
 			}
 			cpu_relax();
@@ -782,7 +779,6 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
 	return -EIO;
 }
 
-
 /*
  * Prepare controller for a transaction and call omap_i2c_xfer_msg
  * to do the work during IRQ processing.
@@ -807,7 +803,7 @@ omap_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg msgs[], int num,
 	if (r < 0)
 		goto out;
 
-	if (omap->set_mpu_wkup_lat != NULL)
+	if (omap->set_mpu_wkup_lat)
 		omap->set_mpu_wkup_lat(omap->dev, omap->latency);
 
 	for (i = 0; i < num; i++) {
@@ -822,7 +818,7 @@ omap_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg msgs[], int num,
 
 	omap_i2c_wait_for_bb(omap);
 
-	if (omap->set_mpu_wkup_lat != NULL)
+	if (omap->set_mpu_wkup_lat)
 		omap->set_mpu_wkup_lat(omap->dev, -1);
 
 out:
@@ -875,18 +871,15 @@ static inline void i2c_omap_errata_i207(struct omap_i2c_dev *omap, u16 stat)
 	if (stat & OMAP_I2C_STAT_RDR) {
 		/* Step 1: If RDR is set, clear it */
 		omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
-
 		/* Step 2: */
 		if (!(omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG)
 						& OMAP_I2C_STAT_BB)) {
-
 			/* Step 3: */
 			if (omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG)
 						& OMAP_I2C_STAT_RDR) {
 				omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
 				dev_dbg(omap->dev, "RDR when bus is busy.\n");
 			}
-
 		}
 	}
 }
@@ -911,7 +904,7 @@ omap_i2c_omap1_isr(int this_irq, void *dev_id)
 		dev_err(omap->dev, "Arbitration lost\n");
 		omap_i2c_complete_cmd(omap, OMAP_I2C_STAT_AL);
 		break;
-	case 0x02:	/* No acknowledgement */
+	case 0x02:	/* No acknowledgment */
 		omap_i2c_complete_cmd(omap, OMAP_I2C_STAT_NACK);
 		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, OMAP_I2C_CON_STP);
 		break;
@@ -927,8 +920,9 @@ omap_i2c_omap1_isr(int this_irq, void *dev_id)
 				*omap->buf++ = w >> 8;
 				omap->buf_len--;
 			}
-		} else
+		} else {
 			dev_err(omap->dev, "RRDY IRQ while no data requested\n");
+		}
 		break;
 	case 0x05:	/* Transmit data ready */
 		if (omap->buf_len) {
@@ -939,8 +933,9 @@ omap_i2c_omap1_isr(int this_irq, void *dev_id)
 				omap->buf_len--;
 			}
 			omap_i2c_write_reg(omap, OMAP_I2C_DATA_REG, w);
-		} else
+		} else {
 			dev_err(omap->dev, "XRDY IRQ while no data to send\n");
+		}
 		break;
 	default:
 		return IRQ_NONE;
@@ -995,8 +990,7 @@ static int errata_omap3_i462(struct omap_i2c_dev *omap)
 	return 0;
 }
 
-static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
-		bool is_rdr)
+static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes)
 {
 	u16		w;
 
@@ -1016,8 +1010,7 @@ static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
 	}
 }
 
-static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes,
-		bool is_xdr)
+static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes)
 {
 	u16		w;
 
@@ -1133,7 +1126,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 					OMAP_I2C_BUFSTAT_REG) >> 8) & 0x3F;
 			}
 
-			omap_i2c_receive_data(omap, num_bytes, true);
+			omap_i2c_receive_data(omap, num_bytes);
 			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
 			continue;
 		}
@@ -1144,7 +1137,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->threshold)
 				num_bytes = omap->threshold;
 
-			omap_i2c_receive_data(omap, num_bytes, false);
+			omap_i2c_receive_data(omap, num_bytes);
 			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RRDY);
 			continue;
 		}
@@ -1156,7 +1149,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->fifo_size)
 				num_bytes = omap->buf_len;
 
-			ret = omap_i2c_transmit_data(omap, num_bytes, true);
+			ret = omap_i2c_transmit_data(omap, num_bytes);
 			if (ret < 0)
 				break;
 
@@ -1171,7 +1164,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->threshold)
 				num_bytes = omap->threshold;
 
-			ret = omap_i2c_transmit_data(omap, num_bytes, false);
+			ret = omap_i2c_transmit_data(omap, num_bytes);
 			if (ret < 0)
 				break;
 
@@ -1266,13 +1259,13 @@ static const struct of_device_id omap_i2c_of_match[] = {
 MODULE_DEVICE_TABLE(of, omap_i2c_of_match);
 #endif
 
-#define OMAP_I2C_SCHEME(rev)		((rev & 0xc000) >> 14)
+#define OMAP_I2C_SCHEME(rev)           (((rev) & 0xc000) >> 14)
 
-#define OMAP_I2C_REV_SCHEME_0_MAJOR(rev) (rev >> 4)
-#define OMAP_I2C_REV_SCHEME_0_MINOR(rev) (rev & 0xf)
+#define OMAP_I2C_REV_SCHEME_0_MAJOR(rev) (((rev) >> 4))
+#define OMAP_I2C_REV_SCHEME_0_MINOR(rev) (((rev) & 0xf))
 
-#define OMAP_I2C_REV_SCHEME_1_MAJOR(rev) ((rev & 0x0700) >> 7)
-#define OMAP_I2C_REV_SCHEME_1_MINOR(rev) (rev & 0x1f)
+#define OMAP_I2C_REV_SCHEME_1_MAJOR(rev) (((rev) & 0x0700) >> 7)
+#define OMAP_I2C_REV_SCHEME_1_MINOR(rev) (((rev) & 0x1f))
 #define OMAP_I2C_SCHEME_0		0
 #define OMAP_I2C_SCHEME_1		1
 
@@ -1383,7 +1376,7 @@ omap_i2c_probe(struct platform_device *pdev)
 		of_property_read_u32(node, "clock-frequency", &freq);
 		/* convert DT freq value in Hz into kHz for speed */
 		omap->speed = freq / 1000;
-	} else if (pdata != NULL) {
+	} else if (pdata) {
 		omap->speed = pdata->clkrate;
 		omap->flags = pdata->flags;
 		omap->set_mpu_wkup_lat = pdata->set_mpu_wkup_lat;
@@ -1434,7 +1427,7 @@ omap_i2c_probe(struct platform_device *pdev)
 	omap->errata = 0;
 
 	if (omap->rev >= OMAP_I2C_REV_ON_2430 &&
-			omap->rev < OMAP_I2C_REV_ON_4430_PLUS)
+	    omap->rev < OMAP_I2C_REV_ON_4430_PLUS)
 		omap->errata |= I2C_OMAP_ERRATA_I207;
 
 	if (omap->rev <= OMAP_I2C_REV_ON_3430_3530)
@@ -1459,7 +1452,7 @@ omap_i2c_probe(struct platform_device *pdev)
 			omap->b_hw = 1; /* Enable hardware fixes */
 
 		/* calculate wakeup latency constraint for MPU */
-		if (omap->set_mpu_wkup_lat != NULL)
+		if (omap->set_mpu_wkup_lat)
 			omap->latency = (1000000 * omap->fifo_size) /
 				       (1000 * omap->speed / 8);
 	}
@@ -1469,12 +1462,12 @@ omap_i2c_probe(struct platform_device *pdev)
 
 	if (omap->rev < OMAP_I2C_OMAP1_REV_2)
 		r = devm_request_irq(&pdev->dev, omap->irq, omap_i2c_omap1_isr,
-				IRQF_NO_SUSPEND, pdev->name, omap);
+				     IRQF_NO_SUSPEND, pdev->name, omap);
 	else
 		r = devm_request_threaded_irq(&pdev->dev, omap->irq,
-				omap_i2c_isr, omap_i2c_isr_thread,
-				IRQF_NO_SUSPEND | IRQF_ONESHOT,
-				pdev->name, omap);
+					      omap_i2c_isr, omap_i2c_isr_thread,
+							IRQF_NO_SUSPEND | IRQF_ONESHOT,
+							pdev->name, omap);
 
 	if (r) {
 		dev_err(omap->dev, "failure requesting irq %i\n", omap->irq);
-- 
2.43.0


