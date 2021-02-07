Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F01931245A
	for <lists+linux-omap@lfdr.de>; Sun,  7 Feb 2021 13:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhBGMrU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 7 Feb 2021 07:47:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhBGMrU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 7 Feb 2021 07:47:20 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E84C06174A
        for <linux-omap@vger.kernel.org>; Sun,  7 Feb 2021 04:46:39 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id y15so10242648ilj.11
        for <linux-omap@vger.kernel.org>; Sun, 07 Feb 2021 04:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M6JtxFaDbr5yFq01/iSQg9Vsjhs2sztxHlsRHpPrPJw=;
        b=YsBAY3GcX2BVf7qapnuOCnboIrR3zoKHo/aUsa46+Ya4d/6J3kCTqQpgGnAYj0Y+fc
         jjRkbmsVMrY3oZ7BhLw9bKLror/4f87efny1uZ8Ac5/Kn7I+a0t7KI3pUrEI+3nUojSa
         faVNz9HnyP3d/0BSRVZtnDkMgzQsrrzjo3H+Y7cI6F2Xh3RiqMpGfrpqxaCPUeXfwycI
         yH7abONCh7VOdGFsSsaHxPsRti/7mCIHCTxQoaTXcLaLgo4fR6dVVwtE+xWX9GzzDUm9
         VXQruuDksyh/96DktOJUfZK4k/o4FYURPaf3hPINGDB+Rc9vZ7lN+i4eiEZa7NjzGC9b
         8OPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M6JtxFaDbr5yFq01/iSQg9Vsjhs2sztxHlsRHpPrPJw=;
        b=plHBdOk6sYGjMHAUcCK9YbFEy+iyTQDHQTdtVL7h/L6h89T/EKbSJ/6TkxsCWLF0+X
         +FobrcD4xLM+fSVeKyr/7uJmoBTFcRdagZXY9Y1TsqvfAAvX0Ttotnn7EX6Sa9XwSt35
         ylXJTgKHwcN2QStEV+KMkyGdbN2IHGoQ8EoZmU2Crn6jDP5RhvKE8AEPrV9us6qNSMx8
         M5k3r9Q3kMgurmTa0zveUvr6HngC3pXIA2nALmd2Nsw8SWZzeoRX4ZhUGipq26HSSt8B
         Vc3mVtJdk6PziLXJvqFXLdrYoKRvcgBZ6SidQyTPik47kiG0AVwsdWg7lY90jM8LKauF
         XV6w==
X-Gm-Message-State: AOAM533Emzo7p9boXBuVP6HztR3B3ryaxVWL4CC4RSZNyGMcK3DRDluD
        Vg9L5jRRtkoZWmWuY0rZ0G7d9MaGkTxEvg==
X-Google-Smtp-Source: ABdhPJy8H5R7Q/7pdVhJSv59giWz7l9py72GXMcMwIRE7InXy8vy1/N7mjFPTUphv7w9w+JgjkEJQQ==
X-Received: by 2002:a92:730a:: with SMTP id o10mr11690760ilc.160.1612701998832;
        Sun, 07 Feb 2021 04:46:38 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:b621:f06c:d5c7:b550])
        by smtp.gmail.com with ESMTPSA id f14sm7296778ilr.14.2021.02.07.04.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 04:46:38 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, aford@beaconembedded.com,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: omap2plus_defconfig: Add AT25 EEPROM module
Date:   Sun,  7 Feb 2021 06:46:32 -0600
Message-Id: <20210207124632.3486194-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Torpedo development kit has an at25 SPI EEPROM on the baseboard.
Enable it as a module in the omap2plus defconfig.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index f250bf1cc022..6d387a9b0d90 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -165,6 +165,7 @@ CONFIG_SENSORS_TSL2550=m
 CONFIG_SRAM=y
 CONFIG_PCI_ENDPOINT_TEST=m
 CONFIG_EEPROM_AT24=m
+CONFIG_EEPROM_AT25=m
 CONFIG_BLK_DEV_SD=y
 CONFIG_SCSI_SCAN_ASYNC=y
 CONFIG_ATA=y
-- 
2.25.1

