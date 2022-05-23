Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1104530AC0
	for <lists+linux-omap@lfdr.de>; Mon, 23 May 2022 10:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbiEWHpV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 May 2022 03:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbiEWHpU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 23 May 2022 03:45:20 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F41E617E33
        for <linux-omap@vger.kernel.org>; Mon, 23 May 2022 00:45:17 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 626FC3FD86
        for <linux-omap@vger.kernel.org>; Mon, 23 May 2022 06:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1653287293;
        bh=mhLady9xJOsYFKdyyp5cJp4wqz+mfmHOLOYqLp7Vdvc=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=DTf2T2PmmFeUauLn/EVCVEMRIOQY4PuMZVN9kYn7YWcl5h8uIFUhWvBAThiAcQLss
         2EcrdtTE61rgKqRszLhJ0I3RUInREvfjdxGF1EvkR2ernHMasyv37Fwfcd1GIkaqzM
         bZV+NqeYY7ShOAtCdmwY9uieO2GxB/5TdWVyULF2e1UC/p+Tq3tOMqunnTP8u3aMR6
         8dk7tavKCUmgE28HRWqNvfxRD1VtshkxGKRuhIsMFmOVujhWyFpX3m06lPUh0Ndv1u
         xBF4ZJhWY+Kto25+tsrnLQ52SXmJ9y8sH9aRdGsqjjpAKqHahBP5hPn8lmAyTTKZ0m
         KHFklWNDM7Dbw==
Received: by mail-ej1-f72.google.com with SMTP id p7-20020a170906614700b006f87f866117so5424999ejl.21
        for <linux-omap@vger.kernel.org>; Sun, 22 May 2022 23:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mhLady9xJOsYFKdyyp5cJp4wqz+mfmHOLOYqLp7Vdvc=;
        b=uGXOsycHAP7GCtYSpsCTmODpvgfvXvBD+lQ18HtpNYfi3Z2W5zttkn1JmxPsD4miOA
         //QR0IClRbMTfduXwxIdAczCrZYIWA1xYceGkW+iZ8H0MstWwFHqxCML6mNjITdwoq00
         2pynLFzEdm4kRjYvunwZv8ZrAWeFMQs8da+6p7r83i/XTi5+tSw/c7h08tX7RVucfp7t
         XnjJAMwhIe5lGMdyzMe6RzpHL42uPS3VI0ECU4WDpleXje7x/DChY+B4njWO1nlaSm+A
         dZ4thIpZqcXeAlC1VsIwDrQ6C5f1R3zkuJlROu3OLRRi1Gh49n5ZN6wnJZqYg7MD7L0F
         awaQ==
X-Gm-Message-State: AOAM5332yHt+RlKSNDKFK7fqMduNTWpE1+IHdCJ67s/dpqtjl4sNSgmX
        Rud69c8T1xluKTiWn3xgBQKpKEv5kCiWDezlRzb1+6mH0sWhanjlLxKoOVIezh+hgp4UPJiEm3A
        r271vxzvXElQVaJRVXLlqJt90JTBPsNV20/qaKI8=
X-Received: by 2002:a17:907:7242:b0:6f5:2904:5354 with SMTP id ds2-20020a170907724200b006f529045354mr18968655ejc.452.1653287289985;
        Sun, 22 May 2022 23:28:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCe9Yjq1im7YJA39o3/MAHjexYIKNJaEWJo31J3DrHB1x7uDcNtM3+yNSeKZzO3xMwortHbg==
X-Received: by 2002:a17:907:7242:b0:6f5:2904:5354 with SMTP id ds2-20020a170907724200b006f529045354mr18968639ejc.452.1653287289739;
        Sun, 22 May 2022 23:28:09 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id 11-20020a17090602cb00b006f3ef214e59sm5785652ejk.191.2022.05.22.23.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 23:28:09 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     aaro.koskinen@iki.fi, tony@atomide.com, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH] ARM: omap1: Kconfig: Fix indentation
Date:   Mon, 23 May 2022 08:28:07 +0200
Message-Id: <20220523062807.10544-1-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The convention for indentation seems to be a single tab. Help text is
further indented by an additional two whitespaces. Fix the lines that
violate these rules.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 arch/arm/mach-omap1/Kconfig | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index 208c700c2455..f7088beec7ef 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -59,8 +59,8 @@ config MACH_OMAP_INNOVATOR
 	bool "TI Innovator"
 	depends on ARCH_OMAP15XX || ARCH_OMAP16XX
 	help
-          TI OMAP 1510 or 1610 Innovator board support. Say Y here if you
-          have such a board.
+	  TI OMAP 1510 or 1610 Innovator board support. Say Y here if you
+	  have such a board.
 
 config MACH_OMAP_H2
 	bool "TI H2 Support"
@@ -87,7 +87,7 @@ config MACH_OMAP_OSK
 	depends on ARCH_OMAP16XX
 	help
 	  TI OMAP 5912 OSK (OMAP Starter Kit) board support. Say Y here
-          if you have such a board.
+	  if you have such a board.
 
 config OMAP_OSK_MISTRAL
 	bool "Mistral QVGA board Support"
@@ -124,10 +124,10 @@ config MACH_OMAP_PALMZ71
 	bool "Palm Zire71"
 	depends on ARCH_OMAP15XX
 	help
-	 Support for the Palm Zire71 PDA. To boot the kernel,
-	 you'll need a PalmOS compatible bootloader; check out
-	 http://hackndev.com/palm/z71 for more information.
-	 Say Y here if you have such a PDA, say N otherwise.
+	  Support for the Palm Zire71 PDA. To boot the kernel,
+	  you'll need a PalmOS compatible bootloader; check out
+	  http://hackndev.com/palm/z71 for more information.
+	  Say Y here if you have such a PDA, say N otherwise.
 
 config MACH_OMAP_PALMTT
 	bool "Palm Tungsten|T"
@@ -173,10 +173,10 @@ config MACH_OMAP_GENERIC
 	bool "Generic OMAP board"
 	depends on ARCH_OMAP15XX || ARCH_OMAP16XX
 	help
-          Support for generic OMAP-1510, 1610 or 1710 board with
-          no FPGA. Can be used as template for porting Linux to
-          custom OMAP boards. Say Y here if you have a custom
-          board.
+	  Support for generic OMAP-1510, 1610 or 1710 board with
+	  no FPGA. Can be used as template for porting Linux to
+	  custom OMAP boards. Say Y here if you have a custom
+	  board.
 
 endmenu
 
-- 
2.32.0

