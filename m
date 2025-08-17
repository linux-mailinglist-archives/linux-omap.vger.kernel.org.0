Return-Path: <linux-omap+bounces-4252-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDBFB29246
	for <lists+linux-omap@lfdr.de>; Sun, 17 Aug 2025 10:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49F6D177FDF
	for <lists+linux-omap@lfdr.de>; Sun, 17 Aug 2025 08:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA8721B91D;
	Sun, 17 Aug 2025 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cIyiwxb3"
X-Original-To: linux-omap@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E84A7081F
	for <linux-omap@vger.kernel.org>; Sun, 17 Aug 2025 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755419725; cv=none; b=N6z/Q3cmid2b2zyRmw60g8/j0/cejeMqhe5MDL35Zp1yyDjWT7EPBrTPUJtyD+4PlJnTgqfVFslL4vXdLBx9/WeISP1E+dMN7k4MSCTCeJ8JBkWwhqYuyF3CrwA2REIwjnZXCADto8YSs6pkBuopk0rWv16cgblHXb25NNj7P1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755419725; c=relaxed/simple;
	bh=QnK00DP14og931D7K5uGWiQbxVg1tBZthOnJ09Y2qY8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qdY/Fl+SxZBe3o4UL5ZY62J3iwF0y6tUzFBQIxRAVK2gKjWCp8pqqBNsMVV+Lg1JsH6eWCncNahyYVa8Ohzrq/pz4yQetf4NFfitkWCo9Kuv8dDba0UksXfEROPniezL8xoVU2+JYUYpfdfFw+kRvTMDlDY8IzhUQoOVHOxzeeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cIyiwxb3; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=mL
	Y8zivKv4V7ZPqASwM9sGRdSMQXYChLQdHmi9I6EJE=; b=cIyiwxb3EIhFeCpqJg
	0x9Mt29Uz+rCc31W+FAINyJuFpXzkM17eHmAY24J3/1sX06PUJ+Av9zBX693CwF7
	gYej8Dcx85g3+1deNWN8UesI12uGLjOC9SdEfG0/08yrik68JTDyBuWXj/ZDAwIa
	jjK04ycTh91fJI5YBfLbs5a4w=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDHZ8UrlKFoCU5FCg--.59942S2;
	Sun, 17 Aug 2025 16:34:53 +0800 (CST)
From: Yang Xiuwei <yangxiuwei2025@163.com>
To: tony@atomide.com,
	khilman@baylibre.com
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH] ARM: OMAP2+: use IS_ERR_OR_NULL() helper
Date: Sun, 17 Aug 2025 16:34:49 +0800
Message-Id: <20250817083449.2249268-1-yangxiuwei2025@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHZ8UrlKFoCU5FCg--.59942S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr18AFWUKw4kAF4rurW8tFb_yoW5KFW5pF
	yqkw12gr40gw17J34DtF40vF1jy392qF40yrZY9w1Yqw4a9rnrG3W29Fyjk34Ykas7Ga1r
	AF43Aay8Zr45JFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jJfHbUUUUU=
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/1tbiMQ+skGihi-yrTQAAsa

From: Yang Xiuwei <yangxiuwei@kylinos.cn>

Simplify error handling in OMAP powerdomain, voltage, and VP code by
replacing open-coded '!ptr || IS_ERR(ptr)' checks with the combined
IS_ERR_OR_NULL() helper.

This improves readability and consistency across
omap_set_pwrdm_state(), voltdm_get_voltage(), voltdm_scale(),
voltdm_reset(), and related functions.

No functional change intended.

Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>

diff --git a/arch/arm/mach-omap2/powerdomain.c b/arch/arm/mach-omap2/powerdomain.c
index a4785302b7ae..0225b9889404 100644
--- a/arch/arm/mach-omap2/powerdomain.c
+++ b/arch/arm/mach-omap2/powerdomain.c
@@ -1111,7 +1111,7 @@ int omap_set_pwrdm_state(struct powerdomain *pwrdm, u8 pwrst)
 	int curr_pwrst;
 	int ret = 0;
 
-	if (!pwrdm || IS_ERR(pwrdm))
+	if (IS_ERR_OR_NULL(pwrdm))
 		return -EINVAL;
 
 	while (!(pwrdm->pwrsts & (1 << pwrst))) {
diff --git a/arch/arm/mach-omap2/voltage.c b/arch/arm/mach-omap2/voltage.c
index 49e8bc69abdd..000c2bca5ef0 100644
--- a/arch/arm/mach-omap2/voltage.c
+++ b/arch/arm/mach-omap2/voltage.c
@@ -51,7 +51,7 @@ static LIST_HEAD(voltdm_list);
  */
 unsigned long voltdm_get_voltage(struct voltagedomain *voltdm)
 {
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return 0;
 	}
@@ -73,7 +73,7 @@ static int voltdm_scale(struct voltagedomain *voltdm,
 	int ret, i;
 	unsigned long volt = 0;
 
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return -EINVAL;
 	}
@@ -124,7 +124,7 @@ void voltdm_reset(struct voltagedomain *voltdm)
 {
 	unsigned long target_volt;
 
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return;
 	}
@@ -154,7 +154,7 @@ void voltdm_reset(struct voltagedomain *voltdm)
 void omap_voltage_get_volttable(struct voltagedomain *voltdm,
 				struct omap_volt_data **volt_data)
 {
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return;
 	}
@@ -182,7 +182,7 @@ struct omap_volt_data *omap_voltage_get_voltdata(struct voltagedomain *voltdm,
 {
 	int i;
 
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return ERR_PTR(-EINVAL);
 	}
@@ -216,7 +216,7 @@ struct omap_volt_data *omap_voltage_get_voltdata(struct voltagedomain *voltdm,
 int omap_voltage_register_pmic(struct voltagedomain *voltdm,
 			       struct omap_voltdm_pmic *pmic)
 {
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return -EINVAL;
 	}
diff --git a/arch/arm/mach-omap2/vp.c b/arch/arm/mach-omap2/vp.c
index a709655b978c..03c481c4742c 100644
--- a/arch/arm/mach-omap2/vp.c
+++ b/arch/arm/mach-omap2/vp.c
@@ -199,7 +199,7 @@ void omap_vp_enable(struct voltagedomain *voltdm)
 	struct omap_vp_instance *vp;
 	u32 vpconfig, volt;
 
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return;
 	}
@@ -244,7 +244,7 @@ void omap_vp_disable(struct voltagedomain *voltdm)
 	u32 vpconfig;
 	int timeout;
 
-	if (!voltdm || IS_ERR(voltdm)) {
+	if (IS_ERR_OR_NULL(voltdm)) {
 		pr_warn("%s: VDD specified does not exist!\n", __func__);
 		return;
 	}
-- 
2.25.1


