Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93D78D92FE
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 15:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393704AbfJPNwQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Oct 2019 09:52:16 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:35854 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391962AbfJPNwQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Oct 2019 09:52:16 -0400
Received: by mail-il1-f196.google.com with SMTP id z2so2658738ilb.3;
        Wed, 16 Oct 2019 06:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ctwff17X5J9r4AVcc5YjcP9yOcK6+mtooPGCu9/hHIw=;
        b=A/hzu12BKfaEW8nHGrJjJcG3ppjyfUqRobpjVd8JCm4qVUwN0QQO9FUmdSJauYUm/g
         EBenXGD+2DQyS2Fa17RvoESrYm3vDQWFKzTBDMeJ5vt7KRFqWN/+u6EA4n4oWbjLTzEv
         SyTrTpE9IrmSuroF0F8bRo+ODWxSsJY00QTxE3Kv5Kno97QXGIp7J6gG/u8wBvlyoDdw
         gocqu+ktkP6oCLfBW8Nk0wWiUdmYpvKaVctzmOtORafXKQfFh4Qe4yYu92d1/oRjo6kk
         CHWGce68PvJOL/6KRi6u4894gx4NXRiBgByudZ1CYl5BsTKGm2TESBJuAkHgO6KIdgqk
         VviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ctwff17X5J9r4AVcc5YjcP9yOcK6+mtooPGCu9/hHIw=;
        b=akHIFHQwg4aPqMcAL2og/h1A0Acmt+8UIaGS20vHX0eFAMAcguXheyJ4XB2c41GBd9
         R6M7kR7iHFw5POLGc3gnCtQfreVjKL4ZypRgGeb8LDrkR/XwmCjEIpm18E75UJEDD6vK
         Qe0ycphTWjVyCZSbX0DzHHZHONbxaqv6YE55NCyt+pWoW++/gx0NoObMfnCZnIpiI6rP
         75onSZXGxI3Rih1ZgvSyQclOygCLWgNbbam3J31GWv3yHz6hTD14otI2GBuWU+Droxi/
         0WKnYqubfodXEhusOUr9vxW8C/JPF+dDyMkr/BhPheSTxXLkm4ayCMPRoQAHOY30J7HM
         51Dw==
X-Gm-Message-State: APjAAAUwG1TUd9y69NPrkqy2Rs0SX3GWf32vcXfVKKfQmXf3vajZFaXP
        iRlPvNKeLs2HizdUl8R20BE=
X-Google-Smtp-Source: APXvYqygyXkntWbd91r/7evKoDfONJS0uRI50cjxLBBfT2mFkyvh6ytGWEsQbsOzZE9Ya9NTMgEkDQ==
X-Received: by 2002:a92:40d9:: with SMTP id d86mr11885733ill.303.1571233934752;
        Wed, 16 Oct 2019 06:52:14 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id e139sm17227545iof.60.2019.10.16.06.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 06:52:14 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V5 2/3] dt-bindings: Add Logic PD Type 28 display panel
Date:   Wed, 16 Oct 2019 08:51:46 -0500
Message-Id: <20191016135147.7743-2-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016135147.7743-1-aford173@gmail.com>
References: <20191016135147.7743-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch adds documentation of device tree bindings for the WVGA panel
Logic PD Type 28 display.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V5:  Replace GPIO_ACTIVE_HIGH with 0 to fix make dt_binding_check -k
V4:  Update per Rob H's suggestions and copy other panel yaml example from 5.4-rc1
V3:  Correct build errors from 'make dt_binding_check'
V2:  Use YAML instead of TXT for binding

diff --git a/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
new file mode 100644
index 000000000000..2834287b8d88
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/logicpd,type28.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Logic PD Type 28 4.3" WQVGA TFT LCD panel
+
+maintainers:
+  - Adam Ford <aford173@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: logicpd,type28
+
+  power-supply: true
+  enable-gpios: true
+  backlight: true
+  port: true
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    lcd0: display {
+      compatible = "logicpd,type28";
+      enable-gpios = <&gpio5 27 0>;
+      backlight = <&backlight>;
+      port {
+        lcd_in: endpoint {
+          remote-endpoint = <&dpi_out>;
+        };
+      };
+    };
+
+...
-- 
2.17.1

