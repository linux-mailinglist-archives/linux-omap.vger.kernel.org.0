Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA002663ED
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 18:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgIKQ1a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Sep 2020 12:27:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:54530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726459AbgIKPUa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Sep 2020 11:20:30 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 408FB22286;
        Fri, 11 Sep 2020 14:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599834777;
        bh=sM+52fCdoYQKtmyuK3xt2Ylu1+kj/bCYKlufyiyrEsY=;
        h=From:To:Subject:Date:From;
        b=cz2/eNZTwDLgFeOW9c6u5D3gvSeoqwD+5eUuOIWcgAU+3IOLeXegOuBm4W5Ez2O3m
         iqEYIPnDZU76RkPXntpbOrjqqQ/E3NKh6hB7wgiBjRMH0Zg6r7Ot65pgqv7ja3nslL
         m4hmdEakpN1SMapwPMc1zS32DZoh+mntk2zazxEw=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] memory: omap-gpmc: Fix compile test on SPARC
Date:   Fri, 11 Sep 2020 16:32:51 +0200
Message-Id: <20200911143251.399-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SPARC comes without CONFIG_OF_ADDRESS thus compile testing fails on
linking:

  /usr/bin/sparc64-linux-gnu-ld: drivers/memory/omap-gpmc.o: in function `gpmc_probe_generic_child':
  omap-gpmc.c:(.text.unlikely+0x14ec): undefined reference to `of_platform_device_create'

Fixes: ea0c0ad6b6eb ("memory: Enable compile testing for most of the drivers")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 8072204bc21a..00e013b14703 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -104,6 +104,7 @@ config TI_EMIF
 
 config OMAP_GPMC
 	bool "Texas Instruments OMAP SoC GPMC driver" if COMPILE_TEST
+	depends on OF_ADDRESS
 	select GPIOLIB
 	help
 	  This driver is for the General Purpose Memory Controller (GPMC)
-- 
2.17.1

