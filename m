Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E4745A021
	for <lists+linux-omap@lfdr.de>; Tue, 23 Nov 2021 11:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235444AbhKWK3b (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Nov 2021 05:29:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:45456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235356AbhKWK32 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Nov 2021 05:29:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD2BE60ED4;
        Tue, 23 Nov 2021 10:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637663180;
        bh=H9X1abjHl74goFDJmGzOnSvlKUx52sUOVNBBILp1Zpw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GagIVRS+axpQLcQ/NF5w9z4eeUghs/uFqjDv6kr2UGCZkWUid3gIOt/hcq3nQz9b/
         wjf+TGnj24M9/O+L6Vc6oiDVUO9RwO85d4PJvKy3w122PGu16QUq9lpF/iAKSCR/EK
         bVzZn+908GjtDprbYTD7JskbcATJDGNShbH11WubnhPQe36B0H5v40Q/rBCrYm96J2
         UQ4NlecTu9+ojYyDbNFEffuYYSbSK/gwVzsLyd1FLaQc642xiOQz6wCcZjeerToGy0
         zibfsHN1hze7WNsk6MIuWs9e4+JWkREXqn/ecUZ6RE3BxgW6Nf427EsTv0vz4iIDAH
         pPxvG13FYIACg==
From:   Roger Quadros <rogerq@kernel.org>
To:     krzysztof.kozlowski@canonical.com, tony@atomide.com
Cc:     kishon@ti.com, nm@ti.com, vigneshr@ti.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH 2/4] memory: omap-gpmc: Fix menuconfig visibility
Date:   Tue, 23 Nov 2021 12:26:04 +0200
Message-Id: <20211123102607.13002-4-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123102607.13002-1-rogerq@kernel.org>
References: <20211123102607.13002-1-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

GPMC was not being visible if COMPILE_TEST is not enabled.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/memory/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 30bff6cb1b8d..da2af9c38fe3 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -103,8 +103,8 @@ config TI_EMIF
 	  temperature changes
 
 config OMAP_GPMC
-	bool "Texas Instruments OMAP SoC GPMC driver" if COMPILE_TEST
-	depends on OF_ADDRESS
+	bool "Texas Instruments OMAP SoC GPMC driver"
+	depends on OF_ADDRESS || COMPILE_TEST
 	select GPIOLIB
 	help
 	  This driver is for the General Purpose Memory Controller (GPMC)
-- 
2.17.1

