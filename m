Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 263B31A3F5
	for <lists+linux-omap@lfdr.de>; Fri, 10 May 2019 22:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727676AbfEJUXG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 May 2019 16:23:06 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:52808 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727670AbfEJUXG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 May 2019 16:23:06 -0400
Received: by mail-it1-f195.google.com with SMTP id q65so11384699itg.2
        for <linux-omap@vger.kernel.org>; Fri, 10 May 2019 13:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lCa0VB5El00GYhfM2nd523XtHcW49CtH8fCoLbOMyqM=;
        b=TYEKoCqEQPqQBAS8biUSWB/jSjTQGbcXm6hrsgSDnODlv97z0FF1Q6F+oBRZHPpPbD
         A45u85l+G9M9Fzgi3RaqOumsO1bw3+aOuHM+RYf9kh982ZPcn3Amg33w/TF2kLmpWxb1
         ee/A1lXEKa93TuPgcv7KyeyPo7GJ65hwnLKm/5K+22/QH4k7fkAmzFrGWsmnR2E9qHNh
         j8qxscdRL8D+MLZ2xNSu4gHf/PudVJHGVsdIsbzsx41bTpxRj5ElWgSh5s+9i4hO2t7h
         CLi0bxPNjhtft9uUYtbI54dpNTzrfI+Ur/lWQ/qzFKGZaKQiR+ZwVV0TZix2KZPS3Gpu
         cuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lCa0VB5El00GYhfM2nd523XtHcW49CtH8fCoLbOMyqM=;
        b=jGAKGnBSduF3S93P1yg1t87exGQoYxIb5sR+qbHvTEQlvIn2laPTDkJW2/6FiHDRNQ
         9y7iQ23YpYgYOiw+GRLrfQoGD4FfY65NILhkf4THoZUP7mfpebiQitttZzfiQFr5QGgQ
         7VKQRFb5fgXzF70o3kBcBHtvRd10ygln+Zc20WErITX3MJyOJ63jMYMirxaJy0Csysjk
         bVYlKi0GuVsra3QFfEBBASI/6+iJQQJt7p4EAhSaGer2hcHxJCWsAxkKr1ohGE4+6Yza
         OHCBpUTM0K6jDCoG/ZhdiXO9WOpHjHgp9jBsB3AuUUZadJ8e0MM1owCbmGsSu4XAxzRp
         UZtg==
X-Gm-Message-State: APjAAAUEYhLBVpJBngRxWmlZl07txolWcu6L/3/ZBGIMaDZFi15+L0+z
        pW7n1qkzybcKKtFhq3fMOOD+YaAS+Se1AA==
X-Google-Smtp-Source: APXvYqz65k+i3xW8LVcwM2FkGyjcJspSzfyaw+SE12VxcicE6GJFd8OErh3VMQ6cI+L0gmo1cXFajQ==
X-Received: by 2002:a24:274e:: with SMTP id g75mr8728805ita.34.1557519784834;
        Fri, 10 May 2019 13:23:04 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id x187sm2261651itg.10.2019.05.10.13.23.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 13:23:03 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: Add LCD type 28 support to LogicPD Torpedo DM3730 devkit
Date:   Fri, 10 May 2019 15:22:56 -0500
Message-Id: <20190510202256.25050-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There are two LCD device released by Logic PD for the Torpedo,
type 15 and Type 28.  The stock dts file supports the older LCD,
so this patch enables support for the newer one.

For details between these different LCD's see
https://support.logicpd.com/DesktopModules/Bring2mind/DMX/Download.aspx?portalid=0&EntryId=2777

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
new file mode 100644
index 000000000000..7350a7135a20
--- /dev/null
+++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+
+
+/dts-v1/;
+
+/*
+ * There are two types of 4.3" LCD, Type 15 and Type 28.
+ * By default, type 15 was used.  This device tree file
+ * uses the timing for the type 28 LCD
+ */
+
+#include "logicpd-torpedo-37xx-devkit.dts"
+
+&lcd0 {
+
+	label = "28";
+
+	panel-timing {
+		clock-frequency = <9000000>;
+		hactive = <480>;
+		vactive = <272>;
+		hfront-porch = <3>;
+		hback-porch = <2>;
+		hsync-len = <42>;
+		vback-porch = <3>;
+		vfront-porch = <2>;
+		vsync-len = <11>;
+		hsync-active = <1>;
+		vsync-active = <1>;
+		de-active = <1>;
+		pixelclk-active = <0>;
+	};
+};
-- 
2.17.1

