Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 830691154BC
	for <lists+linux-omap@lfdr.de>; Fri,  6 Dec 2019 17:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbfLFQAY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Dec 2019 11:00:24 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38656 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbfLFQAY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 Dec 2019 11:00:24 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so7851097wmi.3
        for <linux-omap@vger.kernel.org>; Fri, 06 Dec 2019 08:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newoldbits-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MIA0NWCCK4h1Z/JZPXdHERLAqtudgTBcQ16Z5dk400I=;
        b=k+OCABUOgXU2D0H91QEc8C4MBpcCEGP4BtU3hy4jh+nQXUZhONkKwJvVhLEylHMIWe
         4hL9OkcFNYRFW5O13eLzUsQ+6LCpgBnPusEFHz5FPKRgK5vtYn4a2QVARTJka2mLHekc
         gu8I/LQDV9pRztsvXDcvIOHndW3RnPo1o1QfT8pZ/NDzuGXG+2t6UzOqsOrhhjWATi2Q
         5p0WMHuaZ0lnfR7tzkQqDgg6hiBx4xkXLZp0EWYz0cPk5wtpVQpv6Ecl9/ww7GGvUvch
         KXILmz55BX2btblZTaJL/HjFXZhciOuIo4+hbK0TFncZakBphZdJ7GK4nwQ+Uni7+YEM
         CIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MIA0NWCCK4h1Z/JZPXdHERLAqtudgTBcQ16Z5dk400I=;
        b=OqTS9k7HlKmo9Gp71yoY0P6rHhKpqaNd14F5X1s2YVcyQqkfmivRioDmVI3sZp6RR6
         wNVv48V4biSpSpOTlorFA9BCbb0/ZR2s5jbN3zbzD2W2MiCVfdUDnbuVDIDFLi4dMTxa
         JLZC1q6Pl+JeQb2qDkRFeuT5YtnVj0n9GgnaSqj9n19MrlI/500mYjszW5KSSUkBhkVA
         bQV1+v6b/RppTMmxbDxRldUEUhgBxYbn8B9Bq92dgAsBUiPmqERShNlgM5b2dRN5Q5f5
         RyrRgITJkIpF8aoqLuqyxaIpVTCBwd8AcK0HhmBCNUYZPAI1T3DSwPSZwAlfFubgmBiJ
         V9rg==
X-Gm-Message-State: APjAAAWoZGKje+5F0iRa9J2nKnfo+DVPdXdBKqi1MbCIqW3ahl30o/A6
        AC2ARwWd8wSI1ncOzTSx5pPFP/1nDr5bhg==
X-Google-Smtp-Source: APXvYqw74RI7bZwglD8R2ii0dsT+fkEoVrUANmipbT37cvligxfRIUroUVQN1eZpKoeIMBQyb6Rcdw==
X-Received: by 2002:a1c:f316:: with SMTP id q22mr11570892wmq.103.1575648022396;
        Fri, 06 Dec 2019 08:00:22 -0800 (PST)
Received: from msilabo.lan (241.33-200-80.adsl-dyn.isp.belgacom.be. [80.200.33.241])
        by smtp.gmail.com with ESMTPSA id d19sm3891496wmd.38.2019.12.06.08.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 08:00:21 -0800 (PST)
From:   Jean Pihet <jean.pihet@newoldbits.com>
To:     Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-spi@vger.kernel.org,
        Ryan Barnett <ryan.barnett@rockwellcollins.com>,
        Conrad Ratschan <conrad.ratschan@rockwellcollins.com>,
        Jean Pihet <jean.pihet@newoldbits.com>
Subject: [PATCH 0/3] TI QSPI: Add support for large flash devices
Date:   Fri,  6 Dec 2019 17:00:04 +0100
Message-Id: <20191206160007.331801-1-jean.pihet@newoldbits.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Large devices are bigger than >64MB in size.

- Fix the SPI clock generation in order to produce the desired
  frequency.
- Since the TI QSPI IP block only maps 64MB of MMIO, use MMIO
  below the 64MB boundary and software generated transfers above.
- Optimize the software generated transfers for dual and quad
  I/O read operations. The speed-up is 3.5x for quad I/O reads.

Tested using raw accesses (mtd_debug) and JFFS2 FS read/write/erase;
in single, dual and quad modes.
All accesses have been checked on the logic analyzer.

Jean Pihet (3):
  TI QSPI: Fix fclk frequency
  TI QSPI: support large flash devices
  TI QSPI: optimize transfers for dual and quad read

 drivers/spi/spi-ti-qspi.c | 83 +++++++++++++++++++++++++++++----------
 1 file changed, 63 insertions(+), 20 deletions(-)

-- 
2.23.0

