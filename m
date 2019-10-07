Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADD3CECF8
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 21:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728632AbfJGTtY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 15:49:24 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35649 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbfJGTtY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 15:49:24 -0400
Received: by mail-io1-f68.google.com with SMTP id q10so31437971iop.2
        for <linux-omap@vger.kernel.org>; Mon, 07 Oct 2019 12:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=YxPnjWhxGgOnWnXK95wykreNivtOy1PdIhkRcone4Ts=;
        b=BFQVHtaorTqRM5sN60KFJc6x2gKBAKaRWTjuDBLgFWr0PbR/zHc2QDAkbQjgcnjI8r
         Mqx2SBBCVyQpF/xeYpRFj+8+7yuCsiHKCD1K3F9K+pRXeXOAfHNq0U6DCdDo5iy9nIj0
         e5JJdBEatRdB3XMVLXB0WXBrEEz1MaubeusUWb15PQqYwVWHgHYhK4sWAc9Ic7ot/r8D
         W+gYy4NK0v7X3wsJu3Vly90r9p4zZfXcsQBfNYLBCJLzLsT5qL6C+atAuB/doxb61vA8
         J7WrZ9M5v1W0UlMG3E0Mg+nJ+rOUm7WBTiEXYg3Q7Ot4CVm1bWmQ2BfPybxMAyxeMzqC
         MT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YxPnjWhxGgOnWnXK95wykreNivtOy1PdIhkRcone4Ts=;
        b=j3AHIB6iDMne9jZBLVP3VXJVEe4NzDjd1PTnaDriMf2umfCmahaze6Zbvl7u5oYOi+
         PbK/99GOuGSUTnmvzKKvGiJse+hC6Fi0Pnv1g420fvjJwGv0bkO+Y3v5eS+0bMyBbOcY
         Gep5v5IjwdyhUGq38XoGdb5kWLJr8zIouplWkuyh49NXLetseYc5gMo6eBJGPtleiJGC
         MlxBLuYJyc1iwmQ6WOgQzNIuf7uxfHAVCcllJ7ATx25nkYFJq5I4t9vQ6ww2RAOQSZ0P
         KtA8oqJDFg8XoWh9rsE/4HUiiLhWu4k2K5LO7QcMge3GO92+FUQFC9+lz6TgvnqHPy6F
         YNOQ==
X-Gm-Message-State: APjAAAVEht0NLd2SHuRdTAWNum/+J/nbCsSWksWDo+XQKkYgmUlq8o29
        VYi9Gq9ZsXXCc1aoA/yqOIjM+AldyIo=
X-Google-Smtp-Source: APXvYqyBAYJrVtGM8NYO1gw3t0lG3u7+//xBDY3X3OMGvPJT41QIH3aklOYp1QgnlmUx1NFltyeCYA==
X-Received: by 2002:a92:d847:: with SMTP id h7mr14165606ilq.85.1570477763386;
        Mon, 07 Oct 2019 12:49:23 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id l82sm10033034ilh.23.2019.10.07.12.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 12:49:22 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, tony@atomide.com,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH] configs: omap2plus: Enable VIDEO_MT9P031 module
Date:   Mon,  7 Oct 2019 14:49:13 -0500
Message-Id: <20191007194913.14444-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Logic PD Torpedo Development Kit supports a Leopard Imaging
camera based on the Aptina MT9P031 sensor.

This patch enables this to be built as a module.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index d3f50971e451..2acb75074683 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -343,6 +343,7 @@ CONFIG_VIDEO_OMAP3=m
 CONFIG_CEC_PLATFORM_DRIVERS=y
 # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
 CONFIG_VIDEO_TVP5150=m
+CONFIG_VIDEO_MT9P031=m
 CONFIG_DRM=m
 CONFIG_DRM_OMAP=m
 CONFIG_OMAP5_DSS_HDMI=y
-- 
2.17.1

