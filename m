Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4806145A02A
	for <lists+linux-omap@lfdr.de>; Tue, 23 Nov 2021 11:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235542AbhKWK3k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Nov 2021 05:29:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:45678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235531AbhKWK3f (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Nov 2021 05:29:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8915961028;
        Tue, 23 Nov 2021 10:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637663187;
        bh=qOak39y2UEAkUcWUmmEsOSdOVVwbNbLIXTN1949QVzw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Jz1O/2tGK4lNTWSu3YXh7d5HifIfqk6bH2P6W54aVhuC2E5AlTpYzOMvpkFSXTiEo
         Bm1/IUkB8zfcft2gnWx4JOBSnH5wtBCBY/hUpemuK2n8s8tFKYUA+DBg26xHphgjAU
         BKp1A4xLJ8Dx2YxzqDohMJupeBV/sFy9p/imsMn6MMokP4EIXKJURNcueNs+6KB5I9
         YrSu5whrs90gTTdN4takLWyH/xrWYbhChRMZABQIzYswE75Nil+rM5HgMe5kiG8nwJ
         ahYMsOttE3Shjr7EUq5Qy480n2y5BFIOq61juvYKrudIQCPVzY9iqDqmQ1mBQD/KtA
         38IPku7s+5fWw==
From:   Roger Quadros <rogerq@kernel.org>
To:     krzysztof.kozlowski@canonical.com, tony@atomide.com
Cc:     kishon@ti.com, nm@ti.com, vigneshr@ti.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH 4/4] memory: omap-gpmc: check for nand node name instead of just compatibility
Date:   Tue, 23 Nov 2021 12:26:07 +0200
Message-Id: <20211123102607.13002-7-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123102607.13002-1-rogerq@kernel.org>
References: <20211123102607.13002-1-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We have added new compatibles for controller so just checking for
"ti,omap2-nand" compatible is not enough. Check for "nand" node name
as well.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/memory/omap-gpmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 624153048182..9f0062a262db 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2183,7 +2183,8 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 		}
 	}
 
-	if (of_device_is_compatible(child, "ti,omap2-nand")) {
+	if (of_device_is_compatible(child, "ti,omap2-nand") ||
+	    of_node_name_eq(child, "nand")) {
 		/* NAND specific setup */
 		val = 8;
 		of_property_read_u32(child, "nand-bus-width", &val);
-- 
2.17.1

