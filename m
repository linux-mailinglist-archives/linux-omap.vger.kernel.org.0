Return-Path: <linux-omap+bounces-3313-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE8BA4984E
	for <lists+linux-omap@lfdr.de>; Fri, 28 Feb 2025 12:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA5EB3B89DB
	for <lists+linux-omap@lfdr.de>; Fri, 28 Feb 2025 11:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC992620C3;
	Fri, 28 Feb 2025 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="D/gvxBky"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62195849C;
	Fri, 28 Feb 2025 11:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740742146; cv=none; b=ZRH3RL/bc3JEt6tmDgawOWzCrox3UPgpQjhdBxJQ0C0Abn2uKcyCxaSi0EqYtOHW96YjkcIDbNwThgKZTj3dlyHNQxc3U61iMk/wcnKPB8EGbLJ96Td7vELxkTYNDAoo8RS0K424Dr6QCZVkfO6FRC7hWKeEUYElQE0aR1D1aQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740742146; c=relaxed/simple;
	bh=Esl8+tCtDY0CJiVw8EehvFLirtiKZE38eHn9WD+1GZU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=dOAXVD1b8vhazpo4C1xT3lmlKaXOtrAbOxaddWegvZ/j4QtxZUpQaHBgIVhUfeaWwiieNN14NASxBt+vW7Hhe3WJlU5thNp8wkPwpBy6Q5RaWfAdgbj6C6SYVI/Ihhfqj/s1kd9zgPaB28GLZDZzcORrrck+1hFqw9aWtynCWyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=D/gvxBky; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=zNHptpbLXQ8swyWY9wfkxP0OcEEdiU/o4VafTsgVKzY=; b=D/gvxBkyHgUgFjNP31TQpXtqHa
	5fYBULwlTR36eWlzN7e7Ud8N67vuvze555S8fALOQCoPbKfl2T/jRXdsczwy1s1uMM+MYiqyBhHW4
	ExbsaslAai+b9rctDi2y2x8m23I+LFUgALKvn4hnQhR4LPvk2i0462OB4U7R1jzrIwpRD/NoX5EvU
	x3XjkLIw/g8vWy3OVTmlkhC3/ge7/c0BCkQGyRx97CKPdVycj5J/ExTDjCI7uk6fJftQruJQHDqIs
	mCk0jXzwEGMmtJAubB3FwBnlgV/Ay1EiDGgr+VB11YOOYdObW2x3PBSxGu3/cvTm0TDoQvKcmmxsC
	Sc61pbTg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linux@armlinux.org.uk,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap2plus_defconfig: enable I2C devices of GTA04
Date: Fri, 28 Feb 2025 12:27:50 +0100
Message-Id: <20250228112750.367251-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable I2C devices of GTA04 to get better test coverage when using
the defconfig. Until the I2C host driver is fixed, BMG160 module should be
blacklisted when booting on the GTA04A5.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/omap2plus_defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 6de45d7f6078..84f334e94d5f 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -609,6 +609,7 @@ CONFIG_LEDS_LP5523=m
 CONFIG_LEDS_PCA963X=m
 CONFIG_LEDS_PWM=m
 CONFIG_LEDS_BD2606MVV=m
+CONFIG_LEDS_TCA6507=m
 CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=m
 CONFIG_LEDS_TRIGGER_ONESHOT=m
@@ -643,6 +644,8 @@ CONFIG_TI_EMIF_SRAM=m
 CONFIG_IIO=m
 CONFIG_IIO_SW_DEVICE=m
 CONFIG_IIO_SW_TRIGGER=m
+CONFIG_BMA180=m
+CONFIG_BMC150_ACCEL=m
 CONFIG_IIO_ST_ACCEL_3AXIS=m
 CONFIG_KXCJK1013=m
 CONFIG_CPCAP_ADC=m
@@ -650,10 +653,15 @@ CONFIG_INA2XX_ADC=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_TWL4030_MADC=m
 CONFIG_TWL6030_GPADC=m
+CONFIG_BMG160=m
 CONFIG_MPU3050_I2C=m
+CONFIG_ITG3200=m
+CONFIG_BOSCH_BNO055_I2C=m
 CONFIG_INV_MPU6050_I2C=m
 CONFIG_SENSORS_ISL29028=m
 CONFIG_AK8975=m
+CONFIG_BMC150_MAGN_I2C=m
+CONFIG_SENSORS_HMC5843_I2C=m
 CONFIG_BMP280=m
 CONFIG_PWM=y
 CONFIG_PWM_OMAP_DMTIMER=m
-- 
2.39.5


