Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC0134D659
	for <lists+linux-omap@lfdr.de>; Mon, 29 Mar 2021 19:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhC2Rxn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Mar 2021 13:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbhC2RxV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Mar 2021 13:53:21 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B756C061756
        for <linux-omap@vger.kernel.org>; Mon, 29 Mar 2021 10:53:21 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id p19so7052682wmq.1
        for <linux-omap@vger.kernel.org>; Mon, 29 Mar 2021 10:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=telliq.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N6EnRd/MY7h8IstQCaZRWpBwbfFtnJv4s7DJ21C8TVU=;
        b=CAYs0tgpe8vK037DR+QKaY/dFao1NgmTdZvmoJDVBWeLeSuPcF3sVB1RqBALma6L8e
         60P2lVgiHv00myzkjExiWiTZHHsP7a/koD0WhGQ+zNK1slD/vjgM6DrhEZVhmH2+Tnmu
         Z/mI+39OQ3DTCUwCqMrlnG5aMbvmKzhNwdyUvJ44OPCCWxE0MdElOpdyvE7VNhXccv/5
         HebYIbIELrPYac0N9mRrcLivnzbn51nOkbB2tL/qlB5Q0pwMejygyEGxzUBbSykJ3YuR
         LLyWHvkBLRHBMbVOTCYKZhA1cUYOPBjFs2k3h6OlZiJnMiAZoytiL8wzI5xn/HtZmzbW
         zm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N6EnRd/MY7h8IstQCaZRWpBwbfFtnJv4s7DJ21C8TVU=;
        b=LAGcf2oHv9JxXJl46Mw4CH0z7TgDXv9MY6MlZd0jtX3Z/cmJitYGr6QqrWEr6wULow
         lfWFteUqE49WTIGwtIwwZaWlsq7w1nXrpREa1r3/v5Ot0bOl4WUiRRMvA8VTcWACVcc1
         xdFLXwh1MIHTSp3h6tclvU02JFn+Idy3fi4TiZKlnfLmKQw8fiFQCRNJT/c6Eb+RO/w0
         rG/la9Cihp8az6/XrhoD7/Xm+V1FNlGoXogEXolIgg1394sbulWLdyMkjV1i5eDG2U+c
         3q6MgejKYFzGzKPEv8K9C/dVQeDXKSL4cc1PSCJMYfY/AVSkug0uPYoUqYihtDSXVk8G
         y1Zg==
X-Gm-Message-State: AOAM532PDrzbPyzI6botvMb3Of0nhDeqdtpzj7JTuWwTI6H0qUN9vgo8
        qHYElp6bKNRuLjF827t1WIY3fw==
X-Google-Smtp-Source: ABdhPJzNvL5rgMlYeb3DLyMYlNh0fTGWd7RQJVVnvzJUaoumN5K/evaFhoN2SSC65l7mRBlLfxAODg==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr232796wml.123.1617040399629;
        Mon, 29 Mar 2021 10:53:19 -0700 (PDT)
Received: from emu.mida (static-212-247-121-18.cust.tele2.se. [212.247.121.18])
        by smtp.gmail.com with ESMTPSA id q4sm154209wma.20.2021.03.29.10.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 10:53:19 -0700 (PDT)
From:   Jan Kardell <jan.kardell@telliq.com>
To:     Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: [PATCH] arm: Define arch_is_kernel_initmem_freed() for lockdep
Date:   Mon, 29 Mar 2021 19:53:18 +0200
Message-Id: <20210329175318.21393-1-jan.kardell@telliq.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This fixes the warning:

WARNING: CPU: 0 PID: 1994 at kernel/locking/lockdep.c:1119 alloc_netdev_mqs+0xb4/0x3b0

This warning is because the check in static_obj() assumes that all
memory within [_stext, _end] belongs to static objects. The init
section is also part of this range, and freeing it allows the buddy
allocator to allocate memory from it.

To fix this, define arch_is_kernel_initmem_freed() for arm, it will
return 1 if initmem has been freed and the address is in the range
[__init_begin, __init_end], and this function is called by the
static_obj() function in lockdep.

Tested on TI am3352 (Cortex A8).

This change is modelled after commit 7a5da02de8d6eafba995
("locking/lockdep: check for freed initmem in static_obj()") for s390 by
Gerald Schaefer <gerald.schaefer@linux.ibm.com>

Signed-off-by: Jan Kardell <jan.kardell@telliq.com>
---
 arch/arm/include/asm/sections.h | 13 +++++++++++++
 arch/arm/mm/init.c              |  6 +++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/sections.h b/arch/arm/include/asm/sections.h
index 700b8bcdf9bd..1dd64c90c1ac 100644
--- a/arch/arm/include/asm/sections.h
+++ b/arch/arm/include/asm/sections.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_ARM_SECTIONS_H
 #define _ASM_ARM_SECTIONS_H
 
+#define arch_is_kernel_initmem_freed arch_is_kernel_initmem_freed
+
 #include <asm-generic/sections.h>
 
 extern char _exiprom[];
@@ -11,6 +13,17 @@ extern char __idmap_text_end[];
 extern char __entry_text_start[];
 extern char __entry_text_end[];
 
+extern bool initmem_freed;
+
+static inline int arch_is_kernel_initmem_freed(unsigned long addr)
+{
+	if (!initmem_freed)
+		return 0;
+	return addr >= (unsigned long)__init_begin &&
+	       addr < (unsigned long)__init_end;
+}
+
+
 static inline bool in_entry_text(unsigned long addr)
 {
 	return memory_contains(__entry_text_start, __entry_text_end,
diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 828a2561b229..cd7a4273797a 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -41,6 +41,8 @@
 
 #include "mm.h"
 
+bool initmem_freed;
+
 #ifdef CONFIG_CPU_CP15_MMU
 unsigned long __init __clear_cr(unsigned long mask)
 {
@@ -523,8 +525,10 @@ void free_initmem(void)
 	fix_kernmem_perms();
 
 	poison_init_mem(__init_begin, __init_end - __init_begin);
-	if (!machine_is_integrator() && !machine_is_cintegrator())
+	if (!machine_is_integrator() && !machine_is_cintegrator()) {
+		initmem_freed = true;
 		free_initmem_default(-1);
+	}
 }
 
 #ifdef CONFIG_BLK_DEV_INITRD
-- 
2.26.2

