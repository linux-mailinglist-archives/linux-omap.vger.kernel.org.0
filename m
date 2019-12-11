Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3AEA11BD2A
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 20:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbfLKTkO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 14:40:14 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37865 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbfLKTkO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 14:40:14 -0500
Received: by mail-wr1-f66.google.com with SMTP id w15so25487418wru.4
        for <linux-omap@vger.kernel.org>; Wed, 11 Dec 2019 11:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newoldbits-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BQmYkzxzuJFcEZEM1zZf6dMLQjogmuzV839YGrPJbCo=;
        b=FgQpTSTBkhSXGcl296Oqs66MZgJoxfXx7Bim02LCDBoV7hEBFTLWI7bTz4hncSbefv
         lPVjZGYITyVCPQzLPRwXln6FD2KEbfRZkTpUXTRXFvP86ZhrLMy5hbo9NvMDf72ZGUd7
         0JzLoK4gmfnCQRT2aBXzLp68Q12G5FaCUTe6D/xfL/Q0L+K/91iHLMeDVeqJrAUnufzh
         9gAGPUAU/VaYe6R3mYA4UzwGcxzh3JEhKE4Pwr7+398B7E/WwFJmZlS5SQvi8BT0bqKL
         yv6UMqrAK4CU4v+rDUjseSDCBgYYxci6pUdcDvPc2MJDVnC4Iv+qU05zpM4d4M/y8TFT
         /QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BQmYkzxzuJFcEZEM1zZf6dMLQjogmuzV839YGrPJbCo=;
        b=WsnQODrctmHhuZnDAdsFPeq/9iLb2HysUi1J2SO5t7x0k4pkKkUIlBkcBCAlNHmfXB
         RhAWs3WWlY8Z0W5OVgXL/6FYqWcqdOK9W5IX2ciiIDge2BTDiLg9mpqm0H4hzAqEzsM2
         mLf58iaTJqczqIctArqjLUVRPv0x68rTBpd1imA8Vy8NW0z5gP5WSo2bqzWSoBQkStzW
         Lap2VogsuTc+RFjA6551FVnrhyIGtOKPKIv91gsbk8GLgmOKeMER6V3VYbY053kVnKtj
         iS5dJDWiBJThjO21J9hLs3vaFpsdifluTU3hVcGnqSGJS8Nd+dNFYJuuzbPRiWHbE5dP
         Cu/w==
X-Gm-Message-State: APjAAAWgTcw+vhnFACxU+8xOyKwSCds6aK0QcjKiFH6+rueKD2kT0iff
        sbErqycugO8DqBvtK0dNq4X+YA==
X-Google-Smtp-Source: APXvYqxmrSljC7te1sBWtHOqGTVoBhPFhWAFPbU/E5oMvQVdyvKXT3hPX1LRSHLiBq6+Lk7IBkvLeQ==
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr1514397wrw.391.1576093212580;
        Wed, 11 Dec 2019 11:40:12 -0800 (PST)
Received: from msilabo.lan (241.33-200-80.adsl-dyn.isp.belgacom.be. [80.200.33.241])
        by smtp.gmail.com with ESMTPSA id x1sm3309964wru.50.2019.12.11.11.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 11:40:12 -0800 (PST)
From:   Jean Pihet <jean.pihet@newoldbits.com>
To:     Mark Brown <broonie@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-spi@vger.kernel.org,
        Ryan Barnett <ryan.barnett@rockwellcollins.com>,
        Conrad Ratschan <conrad.ratschan@rockwellcollins.com>,
        Arnout Vandecappelle <arnout.vandecappelle@essensium.com>,
        Jean Pihet <jean.pihet@newoldbits.com>
Subject: [PATCH 1/3] spi: spi-ti-qspi: Remove unused macro for fclk frequency
Date:   Wed, 11 Dec 2019 20:39:52 +0100
Message-Id: <20191211193954.747745-2-jean.pihet@newoldbits.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191211193954.747745-1-jean.pihet@newoldbits.com>
References: <20191211193954.747745-1-jean.pihet@newoldbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The fclk and its rate are retrieved from DT.

Signed-off-by: Jean Pihet <jean.pihet@newoldbits.com>
Cc: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Cc: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
Cc: Arnout Vandecappelle <arnout.vandecappelle@essensium.com>
---
 drivers/spi/spi-ti-qspi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index 3cb65371ae3b..a18835128ad0 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -79,8 +79,6 @@ struct ti_qspi {
 
 #define QSPI_COMPLETION_TIMEOUT		msecs_to_jiffies(2000)
 
-#define QSPI_FCLK			192000000
-
 /* Clock Control */
 #define QSPI_CLK_EN			(1 << 31)
 #define QSPI_CLK_DIV_MAX		0xffff
-- 
2.23.0

