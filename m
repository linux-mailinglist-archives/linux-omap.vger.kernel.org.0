Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B383A5880
	for <lists+linux-omap@lfdr.de>; Sun, 13 Jun 2021 14:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhFMMyM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 13 Jun 2021 08:54:12 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:44940 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231767AbhFMMyK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 13 Jun 2021 08:54:10 -0400
Received: by mail-wr1-f47.google.com with SMTP id f2so11276369wri.11
        for <linux-omap@vger.kernel.org>; Sun, 13 Jun 2021 05:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S7x0yXgSGt2oHbuYIah2pjK0DDqOWTD6n400T1HqOzU=;
        b=tdJpFMIzHihbIuQu9Ze+gKgTR7REdWI4SpzLT1u4MCukJI/wVaSBllECShRlWXGN0u
         bam75NJCGb7pS7MZD1zC24zpbcni+fp9ZXnXJ9yND3KBpfJuBETm+q6kPBnvu1luSP6W
         hXSWNP2zOlm3kuGnMuDb4iwdZTNbecrrtqCKRFtxhSqP1ElEZ/QY5wLzDKURMPqT8AHe
         j/Z9CKButmiXMt9nfnxrudPXJW+BIkEQC75CBAixHjUsclkEdOg40XRjNYq3VICbe8se
         3qdpP2HT7Gnoiij0psJeVZCq7u8sKVnDzsxXI0bpDkinwIomdUlD73Fo2DoaWPZrDcYR
         FW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S7x0yXgSGt2oHbuYIah2pjK0DDqOWTD6n400T1HqOzU=;
        b=f1ZOP9nnBpl1Slr8a/sZhBXUD6agOMnRTyNJbfM9/DAuxIZxtZVV0nT2+PQgnRj1CM
         soc/ktP9f3hKGdDHFidWwGfTIutjWThYey+ZGpvKHGERzH0VILNN/Uew6/tbOGujk+lK
         2myD4fn5ppuWEHSTMNXXevr9NK11zYIzKklwRCgLVNGUa6NerbRJNmacoCBFZ07544to
         EiXDggOYUKbqTMK8zlWzYT4fiHswtq9wZ94vs+wBLeuXSfrvtkHlSXIKE4QmS7v+NP04
         Zxi9PU0dyyEF5ookDqdEaUXaxW9hlBKRREcpXTCL/9Ll26lHyhH7isv0+VbVmOPZ4uud
         TJ8w==
X-Gm-Message-State: AOAM530EonZtcFRxeF29x0v4pHFr7uY2P128p8KJ65t+UG5LxFBe+4Jr
        PpUfJk1/PkRGa9nd9NwHGsw=
X-Google-Smtp-Source: ABdhPJwbRGdb6lgN7xAfV1+cx4pw+I/LtrX1W5khWvTpxIgpoKo5FgYIxDXmnoAY1Xx2Y5Hdt2xMZQ==
X-Received: by 2002:a05:6000:1864:: with SMTP id d4mr13418803wri.369.1623588668852;
        Sun, 13 Jun 2021 05:51:08 -0700 (PDT)
Received: from morpheus.home.roving-it.com (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
        by smtp.googlemail.com with ESMTPSA id 4sm12879500wry.74.2021.06.13.05.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 05:51:08 -0700 (PDT)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 1/3] arm: omap2: Drop MACH_OMAP3517EVM entry
Date:   Sun, 13 Jun 2021 13:51:03 +0100
Message-Id: <20210613125105.786984-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The MACH_OMAP3517EVM was added back in commit 549f95ed2016 due to
being used by the ASoC driver, but this driver was dropped in
commit 2c2596f3ab25 as the audio for this board had been moved to
a simple-audio-card configuration so MACH_OMAP3517EVM is now
properly unuused and can be dropped.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm/mach-omap2/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index 7df8f5276ddf..dbe7fa6e8232 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -204,11 +204,6 @@ config MACH_OMAP2_TUSB6010
 	depends on ARCH_OMAP2 && SOC_OMAP2420
 	default y if MACH_NOKIA_N8X0
 
-config MACH_OMAP3517EVM
-	bool "OMAP3517/ AM3517 EVM board"
-	depends on ARCH_OMAP3
-	default y
-
 config MACH_OMAP3_PANDORA
 	bool "OMAP3 Pandora"
 	depends on ARCH_OMAP3
-- 
2.31.1

