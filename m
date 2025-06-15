Return-Path: <linux-omap+bounces-3881-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFC2ADA217
	for <lists+linux-omap@lfdr.de>; Sun, 15 Jun 2025 16:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38CD316D539
	for <lists+linux-omap@lfdr.de>; Sun, 15 Jun 2025 14:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26995189B8C;
	Sun, 15 Jun 2025 14:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="sNGYddpn"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-81.smtpout.orange.fr [80.12.242.81])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46FE2E11CC;
	Sun, 15 Jun 2025 14:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749998511; cv=none; b=lV0aow0TW3AmS+6z1T+wf/OSE4YDDVCchcjgR3ZJdwbrasR3vAXRK3uZ2o6rhItCm6+ZaDm3bu4y6duMUxXAFU+eiBYYqdM/k//2DPMfVZ9PS+lnl7AmF0jT+Y6H+n2MfzwNbCxI/X0NYQeV0WGe7VosF5W5wWF1ZYCSZfDkAZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749998511; c=relaxed/simple;
	bh=tiXwc+MTqLNTCA+GGAffuJEYTKrQOETl5cwJ/U7l4Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l+I6QzD0mAKEFFv4NXmi0NmZTX9ZV78dZDhK+F2sn1JKLdEj1/VlHWABK/pVjjrNXpxjJSSTktp9g5sjpLg0hj4lS/zetgH40NxQWAKdg1CT9/2r3ng6Sr5odv/K5Xn8o2+4NIR0nrZplnVRt9ltSWfqjTICMAZxVdS0Z5nqkAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=sNGYddpn; arc=none smtp.client-ip=80.12.242.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id QoX9uGUEmnYcQQoX9us9PO; Sun, 15 Jun 2025 16:40:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1749998433;
	bh=J/1FGeQ5losJC3i1QB3jB7LngAtvb3hS/jlqq0vPi90=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=sNGYddpnsM1FNVQ0mpTPxKYkYZpuElkpvEofO8pTEkzDxZuiN4IGB9ei9FQ+aFpH5
	 feDr7/9JgHJ6d0/5QIaHhvj8MULV6+iMUuR0QhU0sDiGTyeG5w7h+pS0QqZR/sDrv6
	 8urracpCx8YzXU7G8OnL+CINwu3/a81a8DLIXDm9XvsFCnjNmFAESRUxzRdbno7QJt
	 oenGF2OEjAvwjky0S0inV5ZbWs9l3aCAka2OdeOYDFsS/N2gXdh3QPVy/pT3qs4dbW
	 psmgi6zC7J5xT402020RRUj25+9NVl+/Pet2rKUDs6GYxrrPc++Ta/ly3ZZtk0+T4G
	 rmHhmKxLjoZAA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 15 Jun 2025 16:40:33 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Subject: [PATCH 1/3] mfd: tps65219: Constify struct regmap_irq_sub_irq_map and tps65219_chip_data
Date: Sun, 15 Jun 2025 16:40:20 +0200
Message-ID: <c4abceb95665e4363937a1f41588772f38c47411.1749998382.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct regmap_irq_sub_irq_map' and 'struct tps65219_chip_data' are not
modified in this driver.

Constifying these structures moves some data to a read-only section, so
increases overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  27413	  10272	    256	  37941	   9435	drivers/mfd/tps65219.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  27893	   9792	    256	  37941	   9435	drivers/mfd/tps65219.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/mfd/tps65219.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index fd390600fbf0..62669041e0d9 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -238,7 +238,7 @@ static unsigned int tps65214_bit4_offsets[] = { TPS65214_REG_INT_BUCK_3_POS };
 static unsigned int tps65214_bit5_offsets[] = { TPS65214_REG_INT_LDO_1_2_POS };
 static unsigned int tps65214_bit7_offsets[] = { TPS65214_REG_INT_PB_POS };
 
-static struct regmap_irq_sub_irq_map tps65219_sub_irq_offsets[] = {
+static const struct regmap_irq_sub_irq_map tps65219_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit0_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit1_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit2_offsets),
@@ -249,7 +249,7 @@ static struct regmap_irq_sub_irq_map tps65219_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit7_offsets),
 };
 
-static struct regmap_irq_sub_irq_map tps65215_sub_irq_offsets[] = {
+static const struct regmap_irq_sub_irq_map tps65215_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit0_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit1_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit2_offsets),
@@ -260,7 +260,7 @@ static struct regmap_irq_sub_irq_map tps65215_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit7_offsets),
 };
 
-static struct regmap_irq_sub_irq_map tps65214_sub_irq_offsets[] = {
+static const struct regmap_irq_sub_irq_map tps65214_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit0_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit1_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit2_offsets),
@@ -455,7 +455,7 @@ struct tps65219_chip_data {
 	int n_cells;
 };
 
-static struct tps65219_chip_data chip_info_table[] = {
+static const struct tps65219_chip_data chip_info_table[] = {
 	[TPS65214] = {
 		.irq_chip = &tps65214_irq_chip,
 		.cells = tps65214_cells,
@@ -476,7 +476,7 @@ static struct tps65219_chip_data chip_info_table[] = {
 static int tps65219_probe(struct i2c_client *client)
 {
 	struct tps65219 *tps;
-	struct tps65219_chip_data *pmic;
+	const struct tps65219_chip_data *pmic;
 	bool pwr_button;
 	int ret;
 
-- 
2.49.0


