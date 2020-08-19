Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B8224A6C1
	for <lists+linux-omap@lfdr.de>; Wed, 19 Aug 2020 21:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgHSTSP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Aug 2020 15:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbgHSTSN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Aug 2020 15:18:13 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1A8C061757;
        Wed, 19 Aug 2020 12:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Oai+oxzNPuIfgriKFZ7IPO9e3XuWOzJ6eg1UgB7h7Gc=; b=MTL94uuGp7VWO1sIxU/Kyr7fZh
        +e35aZqq/1xl3ZdqcbyhO/pOOdXpNkMqJmOi9pFpOAy+sqUjLX/GnUpqd3YZT8wQ//qKk+BehM0gp
        F6QQomcAlhyITzvIsT1L07XVqW29a5Gqi0oX5Sp8Efbn8ujGxFks/ROebwoAwG6Lboaw=;
Received: from p200300ccff0e87001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0e:8700:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1k8Tas-0007ns-Kv; Wed, 19 Aug 2020 21:17:54 +0200
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1k8TYk-0008UT-TE; Wed, 19 Aug 2020 21:15:42 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] ARM: omap2plus_defconfig: enable twl4030_madc as a loadable module
Date:   Wed, 19 Aug 2020 21:15:24 +0200
Message-Id: <20200819191524.32581-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The ADC is used by twl4030_charger to read voltages. If a dtb contains
the ADC but the module is not build, probing twl4030_charger will be
endlessly deferred, so just enable CONFIG_TWL4030_MADC in the config.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/omap2plus_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index fe383f5a92fb..c9a32000f1d4 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -510,6 +510,7 @@ CONFIG_IIO_ST_ACCEL_3AXIS=m
 CONFIG_CPCAP_ADC=m
 CONFIG_INA2XX_ADC=m
 CONFIG_TI_AM335X_ADC=m
+CONFIG_TWL4030_MADC=m
 CONFIG_SENSORS_ISL29028=m
 CONFIG_BMP280=m
 CONFIG_PWM=y
-- 
2.20.1

