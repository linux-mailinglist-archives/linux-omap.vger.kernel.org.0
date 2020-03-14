Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B39F185902
	for <lists+linux-omap@lfdr.de>; Sun, 15 Mar 2020 03:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727693AbgCOC32 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Mar 2020 22:29:28 -0400
Received: from muru.com ([72.249.23.125]:60450 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727695AbgCOC31 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 14 Mar 2020 22:29:27 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CE9E2836C;
        Sat, 14 Mar 2020 21:44:21 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/7] ARM: omap2plus_defconfig: Enable ina2xx_adc as a loadable module
Date:   Sat, 14 Mar 2020 14:43:27 -0700
Message-Id: <20200314214328.13342-6-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200314214328.13342-1-tony@atomide.com>
References: <20200314214328.13342-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Some devices have ina2xx_adc on i2c for measuring power consumption
and can nowadays just read the output via IIO.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/configs/omap2plus_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -506,6 +506,7 @@ CONFIG_IIO_SW_DEVICE=m
 CONFIG_IIO_SW_TRIGGER=m
 CONFIG_IIO_ST_ACCEL_3AXIS=m
 CONFIG_CPCAP_ADC=m
+CONFIG_INA2XX_ADC=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_SENSORS_ISL29028=m
 CONFIG_BMP280=m
-- 
2.25.1
