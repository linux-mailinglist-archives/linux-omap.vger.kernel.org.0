Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1882E45A01D
	for <lists+linux-omap@lfdr.de>; Tue, 23 Nov 2021 11:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhKWK30 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Nov 2021 05:29:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:45420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235346AbhKWK30 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Nov 2021 05:29:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77F056102A;
        Tue, 23 Nov 2021 10:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637663178;
        bh=H9X1abjHl74goFDJmGzOnSvlKUx52sUOVNBBILp1Zpw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bs2Ubfsva/+nTuqEMkfjqO99vjHfLxR72YKz0ElP4uUtrWOmh1NLxTfIyojdAftNu
         qbf0i1SR4nIzeBNOvfYnaWLYdAOB3EZ05JXYMd0+gzvuJnDm0sz7kchCAB7xFiFUGh
         VWdofRIvNCWlQ7EJfSrgAlvxHOp9WjYyK4CDJ5nnabitVQkYv8EbJpFbV70fYnDHU2
         NLg9lXYMlUOJ+5cSiDay86ybpIHMbJkOh+JREGycSlxGTV9O6YGSGByD4ESllVTIwE
         fhMLSBcKd+hCbLnwUJKYliHvY4hvx7vebIpHN2UHLrjvlVyvOFZRJ9uohKReMf0bQo
         k5YSu8/urIbSA==
From:   Roger Quadros <rogerq@kernel.org>
To:     krzysztof.kozlowski@canonical.com, tony@atomide.com
Cc:     kishon@ti.com, nm@ti.com, vigneshr@ti.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH 2/4] memory: gpmc: Fix menuconfig visibility
Date:   Tue, 23 Nov 2021 12:26:03 +0200
Message-Id: <20211123102607.13002-3-rogerq@kernel.org>
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

