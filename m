Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A87EC4476
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 01:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729166AbfJAXjp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Oct 2019 19:39:45 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44535 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729121AbfJAXjo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Oct 2019 19:39:44 -0400
Received: by mail-io1-f66.google.com with SMTP id w12so24508611iol.11;
        Tue, 01 Oct 2019 16:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RRxLLSLdYwPdwhaO14RiyNJQD0CnUxdvg/CobR3GW5Q=;
        b=YWLeJfkzMxoxnKC9S2IDx/ImKJyQgItw4ogl4KTAYntuzKeBUpp1ELZC+jHlp/V/Ab
         +hEnKJf55bl4VmxnOu51FJ1WJZlxtwBf8BDeKtndV3efHggQYfppqdsn9erursI+yECl
         Isb/zG9H9P7dHHKcdri6UFxJ+teXY2Jiijg15W3KC+7XZXqkpQ5FFtkSNFhS7Kk4YO9V
         I+bAYC31vJL5q3vAtBmq+2G3fyQYNUNmNQBM+oeCd2JzVYy6oNS2HOeK7sk/W2irWE9z
         9t4PpGKvHvXDdZgDptLb+VDyeO+LArU35DFD2i5Tz3zkwuiDazMSC8MmG26ZKTeOplPg
         dGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RRxLLSLdYwPdwhaO14RiyNJQD0CnUxdvg/CobR3GW5Q=;
        b=J+i0y3kL+3MrGJL0UURMfpP5NSYUA9HdUnmr6OjfDUk6oIT2T0SfhCTw8EH4C/+rZD
         q+ENWHy4P3KtaM6icdd+iQgKKbSTp6di+imSSHz3QvI2g1SpxTcuoIDAwTy14Gp0CJ2j
         K7kEnj29NwlAUvAUswBtwal+PHfr8YPcLu00i8CNiOeuU8SLIn24TPuz7fNarbqGiHQf
         Xcbuese9gA5VbkUhwSFE4g+JMbJNch09WbmG15OVn0C+2gRmWasPu0zkfaP5Ef7IX5uM
         CmzBZ502mjsmqYNFpkd6HzisU5IvTI6ijsqIfILz4Xvmb3eXVYN+C9HLn+fHR3Kq8909
         5N+g==
X-Gm-Message-State: APjAAAURysACS1lf515sJXR3/OeeKAdaTGU8lHBykR229LLnibl83q+D
        hPxLglzOg24MxDHjYoGN7C9OXGoByAY=
X-Google-Smtp-Source: APXvYqwk7qlO0PNhrZR3WgJgT8SF3Byi9/aFmXFt4aobfTcW2u9plJ0vscAA877Q6XRqnQwTtZy8Tg==
X-Received: by 2002:a5d:88d1:: with SMTP id i17mr771093iol.235.1569973183086;
        Tue, 01 Oct 2019 16:39:43 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id r22sm8659935ilb.85.2019.10.01.16.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 16:39:42 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com,
        Adam Ford <aford173@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V4 2/3] dt-bindings: Add Logic PD Type 28 display panel
Date:   Tue,  1 Oct 2019 18:39:19 -0500
Message-Id: <20191001233923.16514-2-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001233923.16514-1-aford173@gmail.com>
References: <20191001233923.16514-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch adds documentation of device tree bindings for the WVGA panel
Logic PD Type 28 display.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V4:  Update per Rob H's suggestions and copy other panel yaml example from 5.4-rc1
V3:  Correct build errors from 'make dt_binding_check'
V2:  Use YAML instead of TXT for binding

diff --git a/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
new file mode 100644
index 000000000000..e2c62e8f1db4
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
+      enable-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;
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

