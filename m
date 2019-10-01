Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3720C446F
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 01:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729183AbfJAXjv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Oct 2019 19:39:51 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34614 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729221AbfJAXju (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Oct 2019 19:39:50 -0400
Received: by mail-io1-f66.google.com with SMTP id q1so52683097ion.1;
        Tue, 01 Oct 2019 16:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RRxLLSLdYwPdwhaO14RiyNJQD0CnUxdvg/CobR3GW5Q=;
        b=d5sf5a4QPval49H/yPG+oZ218/LNFsYS2BqSXjPtJQZVXLxwOE9eFp/e1Itrk/nsMN
         6xHr7klTiWaAx5ZwbkIYHMMhDJ1zq7JlFCsf81h+mhmCcKKAbOdGj3Pika8UsnR5O7dq
         ryOg5PveRi69RaDQogmV3+UoaAyq5ii++GhDdQcyXrQADLH/3kOIGk5P0/6TgjxoHQo+
         XIdRmIgV6R8l+Gnf7ntm5ffCrTiBcajCjsuKXcwTQC1pl7Er6sjXvMJ7iNaP9nZc3XTi
         cIFFv06rhM1wQB8sozAiNHN1ssw+inHRC4J4fieg4fzJOwVRY+Ze1FD7rk5cy0h5zzII
         w3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RRxLLSLdYwPdwhaO14RiyNJQD0CnUxdvg/CobR3GW5Q=;
        b=r/kYnuHOy6jjffdHBn5jswoFnV+Lcqs6c9saLgD1xrzHrn7Uy2w0DtT8Z7mxe2zGZE
         xkkoJCchn1xJl+yM4MGEpfQpZ4zAgHFQ1ZQKJLu9rkxlAZPQj2rNVeD+Gl83QcWRHZ5p
         G2X8fvJzEiS9G2OZAWNLGrWPpN7G0uegPNjNXBw8qPITsVLvdTee/QUbJC/glyxZKeOg
         wK/tO1YlDzPYygL4r+kVJ7cuft5kQgh0pxtAS8Zm0b1/L7+L+TqQ9dN5Lew1I7f5gsQB
         NuaX4ssjYYJuUz+bfwumDX72q6q+PqwbWS0jd+h8wZLWkaIOefPDQ86ZyX6n3miiBsIq
         zXPg==
X-Gm-Message-State: APjAAAXzQfpUEymGYq9jl/Yd1pLvOhRg8yiXPQIXtlj1rgdKYKj+sT47
        wTtsKwkIh4CL+jUMXOoztzQ=
X-Google-Smtp-Source: APXvYqw/0RbXnF1zpAYBmsTItdefmNQwLFLdY/TiQ+O49LmKTlWPdXKhCB6f8Yd31d8q+MoClv92Bw==
X-Received: by 2002:a92:502:: with SMTP id q2mr750564ile.141.1569973187916;
        Tue, 01 Oct 2019 16:39:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id r22sm8659935ilb.85.2019.10.01.16.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 16:39:47 -0700 (PDT)
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
Date:   Tue,  1 Oct 2019 18:39:22 -0500
Message-Id: <20191001233923.16514-5-aford173@gmail.com>
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

