Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAE6CEEC9
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 00:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729133AbfJGWGG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 18:06:06 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34161 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728422AbfJGWGG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 18:06:06 -0400
Received: by mail-io1-f68.google.com with SMTP id q1so32282663ion.1;
        Mon, 07 Oct 2019 15:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Twc3gHw5x4Wog7YioRFdt2DRj3Idc7+bXpqT/1hf/GA=;
        b=BwM8IGAfFvBfdef2Lcn9ilsr9qhBSudW05V5D/5vmlL2JjGCQk2t+E007puOLkLE7G
         Pp5/W7p0ju/W6fAg03miaqEwbkUBKCqgFwjXyPzq4zju0sBDr2wXJez9kBrUGQM1RmGO
         NbWuGpgxjri/wex9sXDdFblIWVIBCNxKkHulrPOLKfArSDCJFkGIDVo11FwKfJsq25x/
         PvYE1waz2dwmul3X+yfxXxEr5oLSwcJc38hW6ZWMBawSqyVyp7iFw9UJmWmrbYoRQwci
         T9wcYEUFER4gcVvkpiPLjqYHScwZHwzgKihWISU8TPKiSrUCQAdZMmvg4MmBgudqVvSK
         e/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Twc3gHw5x4Wog7YioRFdt2DRj3Idc7+bXpqT/1hf/GA=;
        b=i39/Yw4In3CFwzkAGgzxHGzB87l8PzHv8ACgybwFU7GU26+veb7V8lwH6p711j8kgT
         QcykM7bHo2U1P9fD0D9XazZreQusnJ54Q6KU6vRg+RohnSkqgLKHkam61dguEWtAsZ30
         RqSHN6wCliHXYIKNBKULjop0tcmq3Xo/lurivckmfnPD6W+u8ITIMxDsVs72+MP7ld17
         UukZ8DW78Hac5a4j3r9/rSuq9e2QiOvbifJWXhyO6pPz03DNea7K5rLojI0QoyvkdOjE
         Nh9lURhDV90Anbm5zUmrDFERZCSJChnzV4rUpmY7aWW4tey6dH/53tMYi7zEVjG0XqjX
         V7bQ==
X-Gm-Message-State: APjAAAUfJ+knYa+BVy1cJswrLX5OGlhMrcXZYm4d9YqRftLVqfqFuHmZ
        qFfihRwjr958IK77L0qnVsL7o8TY
X-Google-Smtp-Source: APXvYqyVAqPt1YZkaEVl6jWaSrNlk0N+4BwSkrrhVDjCjtrmc7NlXfQbwe77w3FKpa5DV52V1cNtMg==
X-Received: by 2002:a6b:8e0f:: with SMTP id q15mr25463674iod.186.1570485964958;
        Mon, 07 Oct 2019 15:06:04 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id m14sm6479874ild.3.2019.10.07.15.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 15:06:03 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, hns@goldelico.com,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] configs: ARM: omap2plus: Enable OMAP3_THERMAL
Date:   Mon,  7 Oct 2019 17:05:39 -0500
Message-Id: <20191007220540.30690-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The some in the OMAP3 family have a bandgap thermal sensor, but
omap2plus has it disabled.

This patch enables the OMAP3_THERMAL by default like the rest of
the OMAP family.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 8f1c2b6f9e56..7e14a8c8bb29 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -292,6 +292,7 @@ CONFIG_THERMAL_GOV_FAIR_SHARE=y
 CONFIG_THERMAL_GOV_USER_SPACE=y
 CONFIG_CPU_THERMAL=y
 CONFIG_TI_THERMAL=y
+CONFIG_OMAP3_THERMAL=y
 CONFIG_OMAP4_THERMAL=y
 CONFIG_OMAP5_THERMAL=y
 CONFIG_DRA752_THERMAL=y
-- 
2.17.1

