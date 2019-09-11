Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46BF9AFF30
	for <lists+linux-omap@lfdr.de>; Wed, 11 Sep 2019 16:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbfIKOwr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Sep 2019 10:52:47 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:33525 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727873AbfIKOwr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Sep 2019 10:52:47 -0400
Received: by mail-io1-f67.google.com with SMTP id m11so46497530ioo.0;
        Wed, 11 Sep 2019 07:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=NGTdt9F3ZZ0dAl/NdWgfhoQHQnI6Jo5dypLz9RxIFA4=;
        b=GbyNlW7h2LT7nD3Ki7aDD9R1X05eplw0cyGNnFV9cKkIE8KMZE8Z5Wi32J3x9MuD6d
         zED3Dr8G52vVyizid/Bfl4ycAopbtx6KJ82zD56iixaf5vJMVq9adv8MxHqXJE7i9rB3
         LXwhDREw4vrAttqxN5ia3975x/V78DTDCq9/JFA8r4htJgk2YgUNzlacu+5f1be+4+V2
         6gT1D9PPSf5hIgpKrxPjYbJLLDYbAALoFHUuIrqvxLpuTy9W1VVINDSfjoqicZ+OAZGH
         YxhKsUFVpHWC6lRx3F4J6r3XOenJMbPiqY8tVGxJp/hYw5oKLCQIfhMv9S2fR+nuT/x6
         NqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NGTdt9F3ZZ0dAl/NdWgfhoQHQnI6Jo5dypLz9RxIFA4=;
        b=Vx8WybcSZmZPGxLNoKaWE3tLGXD7fuJSJT/S0Ux3DxY3Q6j3Fkj2+YWa9tDOqYzizf
         EDs7p/i3eBaOQdVxa8efN2JZOp5IGF2SKIEUB4a7pgxytcT/u9bLVl0/fAjB6t16yFne
         EO1mzqI/oHB+LF74DbryFwWobvTSSTxPi5N54TO3TwETMVHXRrnzPuoCXBp6jN7IY3U5
         bkDFK0S0B5Qog2wPn6puSTlFohm4T7yM79S04S/YeKu+EnTu6t2g1TJOKq+yNAIVPQh1
         DT1oBF1bEz5BWSMJZA31mkJBwxFxBt5PJtw6QBm2NE0n6Fq+r+tP1cdzbkkpoAONZOOm
         Kp3w==
X-Gm-Message-State: APjAAAXyHxNoHa2lZj8Jz89lsSH9Ge5xSD8iP1BldK5twbzLCsyfT7X0
        SNbZsiWFoFICyYadx2rAtJXLYJh1
X-Google-Smtp-Source: APXvYqzVP2bjj9XYcMcE3MUN8QMaHKh++5QvZJUYU65sh0Dv0wdc0Q1dzhJAnOiiWC/xGnT3dclImQ==
X-Received: by 2002:a5d:894a:: with SMTP id b10mr17475319iot.49.1568213565885;
        Wed, 11 Sep 2019 07:52:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id p25sm17109904ioo.35.2019.09.11.07.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 07:52:44 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: omap2plus_defconfig: Update for removed items
Date:   Wed, 11 Sep 2019 09:52:25 -0500
Message-Id: <20190911145226.21088-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The omap panel-dpi driver was removed in
Commit 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")

The tFP410 and DVI connector was remove in
Commit be3143d8b27f ("drm/omap: Remove TFP410 and DVI connector drivers")

This patch removes these items from the omap2plus_defconfig.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index c7bf9c493646..166b36be2ca6 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -349,12 +349,9 @@ CONFIG_OMAP5_DSS_HDMI=y
 CONFIG_OMAP2_DSS_SDI=y
 CONFIG_OMAP2_DSS_DSI=y
 CONFIG_DRM_OMAP_ENCODER_OPA362=m
-CONFIG_DRM_OMAP_ENCODER_TFP410=m
 CONFIG_DRM_OMAP_ENCODER_TPD12S015=m
-CONFIG_DRM_OMAP_CONNECTOR_DVI=m
 CONFIG_DRM_OMAP_CONNECTOR_HDMI=m
 CONFIG_DRM_OMAP_CONNECTOR_ANALOG_TV=m
-CONFIG_DRM_OMAP_PANEL_DPI=m
 CONFIG_DRM_OMAP_PANEL_DSI_CM=m
 CONFIG_DRM_OMAP_PANEL_SONY_ACX565AKM=m
 CONFIG_DRM_OMAP_PANEL_LGPHILIPS_LB035Q02=m
-- 
2.17.1

