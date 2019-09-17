Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87C95B52A2
	for <lists+linux-omap@lfdr.de>; Tue, 17 Sep 2019 18:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbfIQQMf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Sep 2019 12:12:35 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38515 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726965AbfIQQMf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Sep 2019 12:12:35 -0400
Received: by mail-io1-f68.google.com with SMTP id k5so8975014iol.5;
        Tue, 17 Sep 2019 09:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DnOWZfH0hOJW+dI1w1NtgRKHb/FFjMuNFZYKGDHEM+E=;
        b=DdhP0J19s0F897KOlRUOyWuJ79Fe27lc+QeqrI5mKAKZWfIyaqt58mnKR0aFCiDJBA
         kU4QtLqfUglUq6yoPa3ZqZfVDCfw63tvQ8h9KZ6goqBY1SyKCSMX0HBdvGb8CofEfTsQ
         PScUllzeXrIBnDfOIMegWYmcvwWLMhHe9kDuq7HnxzkkFvDMS1tAUQMC3YgCwt9KGn6v
         13shSdNd7LOwBozcd0IfIkAa4+kskIJ0W2tNIOYBjGNTUI51IVqcSP3TP6HjJm2Qcowd
         FqC31PZZ0N1X8IPzaPAAR0P9aVDGW17N9A/VN6r0yiYC4icFKI9SY2tU73AsdRwdiUNx
         DGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DnOWZfH0hOJW+dI1w1NtgRKHb/FFjMuNFZYKGDHEM+E=;
        b=l4CTwiDHMO4ZaFgOwMltTCPTtcuO+wFpvuwmPffuR7mlXEHu+V2Ea0N+9MvefSKL9Z
         5VWqpagma0ddEPiS5ZClThQ0D3IRvG6HCvd+Uww9defOJ82NdRqE5chz0AaSvwu6UfT+
         1kqTKdwm6n+M+so8fiCyV0Gr9dQkisnmQoqTdDkhYNj0J773U4FfAgDLS2xpnEyDYCCP
         NwNqSKkKC81lRzp8l/Wu91ARFHX2llp2Tmca1nKNdqhrfQ4fMt1gTJRFgKxawgSZKPLx
         lJuLboJ4/aeqfTr74jbhGy/KcnNKKyictfXyziBeM7pgfDuE2yL1aGdBf34DqbF8Z4Q9
         SEIw==
X-Gm-Message-State: APjAAAVp5B5nW7/MVkh5fBUmArW+rxpr4XBe4MIDcJ6EUmJB0IIKDcGf
        Hrq/YE8YVslUkMxZmmWV+M0=
X-Google-Smtp-Source: APXvYqxKwe5NGUh8qHgGmEb1qYzQYcMoUgcdSrs/VA407oH7iuMzBffD3hKkrywOQuGjJWnPF7yIyg==
X-Received: by 2002:a5d:8f02:: with SMTP id f2mr220335iof.272.1568736754145;
        Tue, 17 Sep 2019 09:12:34 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id p25sm2090487ioo.35.2019.09.17.09.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 09:12:29 -0700 (PDT)
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
Subject: [PATCH 2/3] dt-bindings: Add Logic PD Type 28 display panel
Date:   Tue, 17 Sep 2019 11:12:12 -0500
Message-Id: <20190917161214.2913-2-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917161214.2913-1-aford173@gmail.com>
References: <20190917161214.2913-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch adds documentation of device tree bindings for the WVGA panel
Logic PD Type 28 display.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/Documentation/devicetree/bindings/display/panel/logicpd,type28.txt b/Documentation/devicetree/bindings/display/panel/logicpd,type28.txt
new file mode 100644
index 000000000000..829fc5210e06
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/logicpd,type28.txt
@@ -0,0 +1,26 @@
+Logic PD Type 28 4.3" WQVGA TFT LCD panel
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
+
+Required properties:
+- compatible: should be "logicpd,type28"
+
+Optional properties:
+- power-supply: regulator to provide the supply voltage
+- enable-gpios: GPIO pin to enable or disable the panel
+- backlight: phandle of the backlight device attached to the panel
+
+Optional nodes:
+- Video port for RGB input.
+
+Example:
+	lcd0: display {
+		compatible = "logicpd,type28";
+		enable-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;
+		port {
+			lcd_in: endpoint {
+				remote-endpoint = <&dpi_out>;
+			};
+		};
+	};
-- 
2.17.1

