Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8DCC2AACE4
	for <lists+linux-omap@lfdr.de>; Sun,  8 Nov 2020 19:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbgKHSpU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 8 Nov 2020 13:45:20 -0500
Received: from sender11-of-o52.zoho.eu ([31.186.226.238]:21349 "EHLO
        sender11-of-o52.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728853AbgKHSpU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 8 Nov 2020 13:45:20 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1604861116; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=PCHrPDK7QiGSfgDprZUkQ5BpfCBY6aMuhWXM2sz0exg8zY1Il5RTEohWzSnoTPP059KKb5vgNV9ob4R3QPyfQzL10h3MXNTJzNdKDlG8geo1Jm9gC7uddDN1a3tb/+nptl0hM1KxTvtascfxIdFBIXRxrA/7cZ2lCHAAk9eY45A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1604861116; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=qPipucW8n9UtuPcW1Qn3rgYn+bKvcuqZ2YgCh3mJD6g=; 
        b=fKoxSumsN5q8BWd4OXr7dYk4hrsxSxNQLpkLYyhOZhxWvkwVexSpW0EIO3YIcrOB6AGzgBOSSxHiHGtHS/jhI4ghueZAQG4yb57lo66DyEm9kuMFlw6ZBTuPiGdBk7OWjet0oMaGRG4Vp+GKfspDaZ+9Eq4dE9o+6/EmHyD7TO0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-213-200.hsi15.unitymediagroup.de [95.222.213.200]) by mx.zoho.eu
        with SMTPS id 160486111555721.86119355288656; Sun, 8 Nov 2020 19:45:15 +0100 (CET)
Date:   Sun, 8 Nov 2020 19:45:15 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
Subject: [PATCH v2] ARM: omap2plus_defconfig: add CONFIG_AK8975=m and
 CONFIG_KXCJK1013=m to support motorola xt894's magnetometer and motorola
 xt875's accelerometer respectivly
Message-Id: <20201108194515.f63392e0f236041115e9ed24@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

ARM: omap2plus_defconfig: add CONFIG_AK8975=m and CONFIG_KXCJK1013=m to
support motorola xt894's magnetometer and motorola xt875's
accelerometer respectivly

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 arch/arm/configs/omap2plus_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/omap2plus_defconfig
b/arch/arm/configs/omap2plus_defconfig index 1d3106dc0e23..8158aeb53c89
100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -525,6 +525,8 @@ CONFIG_INA2XX_ADC=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_SENSORS_ISL29028=m
 CONFIG_BMP280=m
+CONFIG_KXCJK1013=m
+CONFIG_AK8975=m
 CONFIG_PWM=y
 CONFIG_PWM_OMAP_DMTIMER=m
 CONFIG_PWM_TIECAP=m
-- 
2.29.1
