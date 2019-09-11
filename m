Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79159B0499
	for <lists+linux-omap@lfdr.de>; Wed, 11 Sep 2019 21:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728691AbfIKTln (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Sep 2019 15:41:43 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40537 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728638AbfIKTln (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Sep 2019 15:41:43 -0400
Received: by mail-io1-f66.google.com with SMTP id h144so48616655iof.7
        for <linux-omap@vger.kernel.org>; Wed, 11 Sep 2019 12:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=XFkqyTo5f+pGZgIx9UwVdStRxk6jM73a1Uaf+Hl9Aho=;
        b=ZZcIiR8xJXNfMHRVCSWYY8TRIF2lrTzY9t3HYULnMpeGKAgZuAiKNYUkfTXfDVodl3
         myOaWrPLkj1GvwaGZAq3nrZrIuQUD8VRHAiztRW+Hd4Kh75JOxCwoAY/m2UuSM/eO/i7
         scZJl77aNRxkbWVnIplQqTJ7239uidl6CqKSsFO6wWHmRoea8OAoOeSejWgEGHTWwBjm
         cuBDmWz6T5gxYWG+AifE+bgZtzI+lQmPfZwDemNzOm4a8eWlBow4UZXIxWwaOxXPW51z
         kR4j4uz7Zy+Yk+/9g95KM1ikD81eK1UL8aldJHHAO5JL7/ViRznGimSWwMyTG7W3mPLp
         Omvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XFkqyTo5f+pGZgIx9UwVdStRxk6jM73a1Uaf+Hl9Aho=;
        b=TrUjneLYUpw89D9CxXnihvyP/BViSqSzZno2kFnbI4fkEcR78iaGqRmkSeGPTLUtVn
         oEQEJwtkzgUZLnO/IlydcU+Os+oyCGW+KH5YsPmonucEalURoxveUoDgstrcqboma0A6
         0VBYmDae91Ob7R8NOcAhpdXmRDaUe/MGS1JbOUOq0R1o/ldp08ZmSTe+4LU4IEOANv/0
         WIpYsTOx27bpNGGp4F1CQ9HQyODMsspxNqMVh+V19gYE+peyKxk3ecGuwlNcwzerpy6x
         lwgSVyHTtWdY5YEMKuY28qqK9fL8AjVrNb4dwyIVHWWZloONN7VJfQrkPQn+xdv6GADW
         LH3Q==
X-Gm-Message-State: APjAAAUgUg8K5U/RiOTspAp6pmKvT5F5bFhaHGBuNwBDjhygASU4Bfgc
        8E3r2T/EMxavzDsd9APrv6jbk6ih
X-Google-Smtp-Source: APXvYqw0MBTOnysv5rWKTx0NtLpQwwAKo8tzdml/KPQIA7LWstSbgc0GKB051+5GQ+XMDJCz7+0WdA==
X-Received: by 2002:a5e:db45:: with SMTP id r5mr8352387iop.33.1568230902199;
        Wed, 11 Sep 2019 12:41:42 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id u24sm11200426iob.12.2019.09.11.12.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 12:41:41 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: omap2plus_defconfig: Enable HW Crypto engine modules
Date:   Wed, 11 Sep 2019 14:41:30 -0500
Message-Id: <20190911194130.17292-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The general-purpose OMAP3530, OMAP3630, and DM3730 have hardware
crypto engines that appear to be functional despite limited
documentation.

This patch enables them as modules.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index d384c13de19a..582dcc5e3702 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -532,6 +532,10 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_MICHAEL_MIC=y
+CONFIG_CRYPTO_DEV_OMAP=m
+CONFIG_CRYPTO_DEV_OMAP_SHAM=m
+CONFIG_CRYPTO_DEV_OMAP_AES=m
+CONFIG_CRYPTO_DEV_OMAP_DES=m
 CONFIG_CRC_CCITT=y
 CONFIG_CRC_T10DIF=y
 CONFIG_CRC_ITU_T=y
-- 
2.17.1

