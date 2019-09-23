Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D26FBB605
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2019 15:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439811AbfIWN7b (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Sep 2019 09:59:31 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38683 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439807AbfIWN7b (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 23 Sep 2019 09:59:31 -0400
Received: by mail-io1-f68.google.com with SMTP id u8so12318847iom.5;
        Mon, 23 Sep 2019 06:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TWgZDntOMYE0pJNm4v4MgMyLm0itzJK9E74UOUCbCFE=;
        b=TBnRiSLVfy271WWoAMMWc0Z8UXP2L2wtqgfKishrEDSHLtOLoJQQU1hcwiMswSc+r3
         bZ7CfjNGnfPdjQEO0iq538SdTVfCT4VIIeL42m4UMEUaw/a/QyJMU2Y65S8M/4K3twhh
         q9FI3zwhb64MDZtkaNKK/9wtIOz6SB3RLWT90+j9SH+kEwRWCVx0pmG5eO+xxL73Pe7C
         YMMkBZmecT7mhlQS+49SF5vX3ZEfPMy5hHhL0v75R4pJUqxjyq9AgZfV0w1GJcAdkLQM
         oma4YMVrkYPTxEWhiCP0/TzsI5Q7aJwiCgFJ0r7Qwh19Gj3SzCLatW/LnQXVIvCcz01v
         X/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TWgZDntOMYE0pJNm4v4MgMyLm0itzJK9E74UOUCbCFE=;
        b=s78ZKnmWReuhvaGkFpV0O52B7Mqo2u7XBCsjkaz6Awxk04i0IWyhqYEbXDpXkxsZ0H
         y7LonknhlWeockJ6uFy77bDjc2rM3kGRzAeh3HPKptASRlIw+r8+eCmugkrHfeqi7lI0
         eU/nGAUW277kJmp+abd1XXH5vPHLBZXN9YbMEiBPxJv8tal/x02uVYabW6xVtvIt0FL0
         9uhW+Cc3/go+9e38mpRyDmpvkxEWLG/b3Z08KK/oZMbe2NkOKrovmgDv+7odRxRCEy/G
         lAFw6xRhpXxmmpEGTDTWrx0TyxEn31AeCiq1ZEE6zcagEs1kQ0SPuS9jvRYQZ1QGp8J1
         0sqQ==
X-Gm-Message-State: APjAAAXMfywPSs5FhUpKhKTZMNol81wavIJ+8AWvuYFSmndqvpVN9nkb
        rtjpXrfxWvk2o2gcs2VlJdUiThgksIE=
X-Google-Smtp-Source: APXvYqxQQ5uwRDzAsTCimzcavWphLCLaUzPU1+RY3btfgKUFL7s2fglpIdGwwlkGKxp66jJ02QUP4w==
X-Received: by 2002:a02:c8cd:: with SMTP id q13mr36171142jao.133.1569247169744;
        Mon, 23 Sep 2019 06:59:29 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id j11sm7917262ioa.55.2019.09.23.06.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 06:59:28 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>
Subject: [PATCH] MAINTAINERS: Add logicpd-som-lv and logicpd-torpedo to OMAP TREE
Date:   Mon, 23 Sep 2019 08:59:08 -0500
Message-Id: <20190923135908.23080-3-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923135908.23080-1-aford173@gmail.com>
References: <20190923135908.23080-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The OMAP DEVICE TREE SUPPORT lists a bunch of device tree files
with wildcard names using am3*, am4*, am5*, dra7*, and *omap*.
Unfortunately, the LogicPD boards do not follow this convention
so changes to these boards don't get automatically flagged to
route to the omap mailing list.  After consulting with Tony
Lindgren, he agreed it made sense to add these boards to the
list.

This patch adds the omap based boards to the omap device tree
maintainer list.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index a50e97a63bc8..0ee89575699c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11645,6 +11645,8 @@ F:	arch/arm/boot/dts/*am3*
 F:	arch/arm/boot/dts/*am4*
 F:	arch/arm/boot/dts/*am5*
 F:	arch/arm/boot/dts/*dra7*
+F:	arch/arm/boot/dts/logicpd-som-lv*
+F:	arch/arm/boot/dts/logicpd-torpedo*
 
 OMAP DISPLAY SUBSYSTEM and FRAMEBUFFER SUPPORT (DSS2)
 L:	linux-omap@vger.kernel.org
-- 
2.17.1

