Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A386AA0984
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 20:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfH1Sd7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 14:33:59 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39205 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfH1Sd6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 14:33:58 -0400
Received: by mail-io1-f67.google.com with SMTP id l7so1548039ioj.6;
        Wed, 28 Aug 2019 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8hu0ssZ0oGIHsc6XK0+vNFtta74+suq/nbsPFXeUCzo=;
        b=gOExUspZ43jLMuF+eKU6GV47d0erYUbZyKrYKRx3biAPGIachP/lZDr5vFrM7ph+Sw
         shJydx+mpJs1RrkwMNxmJECY4wh7aA7ZKu2d5mA0P3sr7HYMgo5ybKOr2mPGlKDdZp30
         7MhEdpd/5TcPxjlpD44R15158z8gKGN6ZD88QhHvYg+xnGrDm/RXuKuVoinN/WjSDYBd
         VEkShaMh9qJLhxrQfM1EKfjC43RqqjIPrRMvlqTDlrYXW5m3DjhUqwV1z0XKmIM7KBar
         abct8GgJIyTOCQIYegKpz+CXpOUpCR3AegIdWRO5vz88hIWhrDN/hGXah/6GhnMAOo6y
         2rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8hu0ssZ0oGIHsc6XK0+vNFtta74+suq/nbsPFXeUCzo=;
        b=EYPwzy/1oztWmVzmRGlGq9FBEUpMlFMK1rOvvsgsaESFrzkwOhoIIgia0fCilOU+R3
         7fJgJau1mQ6o/9V61223Vi2Xkm9uBRubnqboWHBPCnPG7ayFqFr11j+kaRSVZT7mfPpV
         /51c4iFH1/ug9LzcJdXPq9l59r8Vmd5264LlzRi2DpWHPun3tDtBkr6b95bDtKvhK/mi
         heouUZm/si7Ce02gLy9ROHaM2bhaTXMFJgIsf0dzNDOgf3Mif29hPTWi2ZcyZvCQQ7k6
         hhJAyUKAnI3oFaum01gvSX3SZ0a3Oq79hvmGZi1C2dD+rX5WliOAZfw8QeANLseor3+N
         G+Yw==
X-Gm-Message-State: APjAAAV6EyWsNCeuGUCciVIldUcg/B0LGMEQjMkYNl90apW9An5GI3DS
        yknQLgmaBEnOTWa3jhI85boG07VN54U=
X-Google-Smtp-Source: APXvYqwEMGWFsgtbR4pzYu0QHQcSSHkT8AIV7Vx2F+xl54RWfWBWN+WSLiU9SH8fydowdo4lmRC4Ww==
X-Received: by 2002:a05:6602:219a:: with SMTP id b26mr236370iob.55.1567017237339;
        Wed, 28 Aug 2019 11:33:57 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id o3sm2494650ioo.74.2019.08.28.11.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 11:33:56 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] ARM: omap2plus_defconfig: Fix missing video
Date:   Wed, 28 Aug 2019 13:33:49 -0500
Message-Id: <20190828183351.822-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When the panel-dpi driver was removed, the simple-panels driver
was never enabled, so anyone who used the panel-dpi driver lost
video, and those who used it inconjunction with simple-panels
would have to manually enable CONFIG_DRM_PANEL_SIMPLE.

This patch makes CONFIG_DRM_PANEL_SIMPLE a module in the same
way the deprecated panel-dpi was.

Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index c7bf9c493646..64eb896907bf 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -363,6 +363,7 @@ CONFIG_DRM_OMAP_PANEL_TPO_TD028TTEC1=m
 CONFIG_DRM_OMAP_PANEL_TPO_TD043MTEA1=m
 CONFIG_DRM_OMAP_PANEL_NEC_NL8048HL11=m
 CONFIG_DRM_TILCDC=m
+CONFIG_DRM_PANEL_SIMPLE=m
 CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_MODE_HELPERS=y
-- 
2.17.1

