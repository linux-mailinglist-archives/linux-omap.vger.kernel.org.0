Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D2838291B
	for <lists+linux-omap@lfdr.de>; Mon, 17 May 2021 11:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236306AbhEQKAK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 May 2021 06:00:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34557 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236483AbhEQJ7o (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 May 2021 05:59:44 -0400
Received: from mail-ej1-f69.google.com ([209.85.218.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <juerg.haefliger@canonical.com>)
        id 1lia14-0002Ps-K3
        for linux-omap@vger.kernel.org; Mon, 17 May 2021 09:58:26 +0000
Received: by mail-ej1-f69.google.com with SMTP id z15-20020a170906074fb029038ca4d43d48so821188ejb.17
        for <linux-omap@vger.kernel.org>; Mon, 17 May 2021 02:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AlaCxcqDCOiBRDYPEaHdHoe0OPHtgCA7z30qB1fR2/Q=;
        b=q6mbG2QpLYXYCpsdCH9WstqmNiHCDaitUPR++sJIoWxRScjvTT/TUGsx55UOgpXrNy
         vKc5qPWRtStT/3ksDg0aNTepYZhKNWuOzDgtUlW0YriNYhyUMPbbGxWkE5OkepWRsN7a
         Dml5f95bPlG8jqfuDxi81T8DtMnlRLfVMMvjnuc6yFa2AZuQvplsV7M3meIVVPfo0zF8
         /ILQzAD3H3grxpYjPvvB7TS5BAbI86RyMVRJAYkbcW7IkT9LqkQ/tAF7GNZWgLiAYQt2
         8SMu6hIMjPYiaumB9rZ65g+NfbD35IZcTuYcqEy2hHaRGJijzCIQ+GA9uZrUCX3s0XSj
         FNGQ==
X-Gm-Message-State: AOAM5329W/CMxcq8mD0d+iKOsoF/d0QCUPSEN5J5kgV2qkE7iJ7Na54Y
        JiMheU34NoWORxYA4mwu77HYd3s8yjDzl/ONhdgR/XX48HTBB1loxElJOEaJcrvZRWsUTfp9Qll
        QrNj40iSDhAi/dz/DURIpeu9eofBm0HXeL5dANXU=
X-Received: by 2002:a17:907:76fa:: with SMTP id kg26mr2934920ejc.192.1621245506320;
        Mon, 17 May 2021 02:58:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNjgq8NT1v+mGWipzQ4yu9FYHNSktSHh/6XfZPOPFUi3ONbsmTb7bORdBnH2aAdPL7i0S3cg==
X-Received: by 2002:a17:907:76fa:: with SMTP id kg26mr2934911ejc.192.1621245506125;
        Mon, 17 May 2021 02:58:26 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id gx23sm350667ejb.125.2021.05.17.02.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 02:58:25 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     aaro.koskinen@iki.fi, tony@atomide.com,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, juergh@canonical.com
Subject: [PATCH] ARM: OMAP1: Remove leading spaces in Kconfig
Date:   Mon, 17 May 2021 11:58:09 +0200
Message-Id: <20210517095809.81478-1-juergh@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Remove leading spaces before tabs in Kconfig file(s) by running the
following command:

  $ find arch/arm/mach-omap1 -name 'Kconfig*' | \
    xargs sed -r -i 's/^[ ]+\t/\t/'

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 arch/arm/mach-omap1/Kconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index 9536b8f3c07d..208c700c2455 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -65,14 +65,14 @@ config MACH_OMAP_INNOVATOR
 config MACH_OMAP_H2
 	bool "TI H2 Support"
 	depends on ARCH_OMAP16XX
-    	help
+	help
 	  TI OMAP 1610/1611B H2 board support. Say Y here if you have such
 	  a board.
 
 config MACH_OMAP_H3
 	bool "TI H3 Support"
 	depends on ARCH_OMAP16XX
-    	help
+	help
 	  TI OMAP 1710 H3 board support. Say Y here if you have such
 	  a board.
 
@@ -85,14 +85,14 @@ config MACH_HERALD
 config MACH_OMAP_OSK
 	bool "TI OSK Support"
 	depends on ARCH_OMAP16XX
-    	help
+	help
 	  TI OMAP 5912 OSK (OMAP Starter Kit) board support. Say Y here
           if you have such a board.
 
 config OMAP_OSK_MISTRAL
 	bool "Mistral QVGA board Support"
 	depends on MACH_OMAP_OSK
-    	help
+	help
 	  The OSK supports an optional add-on board with a Quarter-VGA
 	  touchscreen, PDA-ish buttons, a resume button, bicolor LED,
 	  and camera connector.  Say Y here if you have this board.
@@ -100,14 +100,14 @@ config OMAP_OSK_MISTRAL
 config MACH_OMAP_PERSEUS2
 	bool "TI Perseus2"
 	depends on ARCH_OMAP730
-    	help
+	help
 	  Support for TI OMAP 730 Perseus2 board. Say Y here if you have such
 	  a board.
 
 config MACH_OMAP_FSAMPLE
 	bool "TI F-Sample"
 	depends on ARCH_OMAP730
-    	help
+	help
 	  Support for TI OMAP 850 F-Sample board. Say Y here if you have such
 	  a board.
 
-- 
2.27.0

