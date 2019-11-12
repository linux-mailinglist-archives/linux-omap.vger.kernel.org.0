Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C84A9F96BB
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 18:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfKLRMM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 12:12:12 -0500
Received: from mail-yb1-f193.google.com ([209.85.219.193]:43723 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfKLRMM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 12:12:12 -0500
Received: by mail-yb1-f193.google.com with SMTP id r201so7875197ybc.10
        for <linux-omap@vger.kernel.org>; Tue, 12 Nov 2019 09:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=eah+6LKBmJ/Z2C3Bs/ptjk6k36zng60s1pj/37f8Oxg=;
        b=hTCqLlB80nAHoRutxUrT61akYprgWZugR/luyjTXRCMT7HGjTCeMm5saYiyUYzux84
         gwlgPDk4HhOLfB712pFVpjMmRI4crJLIXH4MLXUltrK2tf3PWxoqeuIYoUsULIKKn0by
         tq05tqfUxL9+gp53R/FqbdNvBEcF4ue8Z6Kh5MvFi7goZIze4UI5ZbAlaH2s8R8rCQWq
         grm1+gP2T+ABv0gv0f//HNoBaDe5HUEF1xQEBIiMvnKyQbMvoJj65M/4avUOOP5EruUj
         73PUEpsfrqG6zuFzzTDDTm9H2cTVDOmW09NKhVhQyXbhNZI0f10OZawUfvjFOI+TeFL5
         4/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eah+6LKBmJ/Z2C3Bs/ptjk6k36zng60s1pj/37f8Oxg=;
        b=NfbXlUWa4SGVA3LPBEjK80RezDwWQIpoBrkcm4OFAZC5+iaFrnFzdfBhq2WNKQSlXw
         6itcj6HQF8lMq/W1tmo0rPJ2akjxPwGIqfno+PU8n/2u0MTL0Q17nvW8r5L12NSEZKr4
         vfErsVMEwzVurN77efy8ZAvGa9K0V2HksTJ1T9K13f4L4xEypGDsb+SzFUtTVlvM1Nby
         8dcFcpgH1WETpt0um+Lq00W5VnaPfdkP0ornRwkqBS6/pj60S3lpovmk7ETcWfzrG3zT
         0wYGSFGZFO9sgvp4dVd8EE4Mk1wFJxdjNyYT+5fCxyAG4adYjDD0rRvpXYJR9IAG8nOF
         gGUA==
X-Gm-Message-State: APjAAAUo2q7W6vi7fhLVCpubzjftxay0PbDLK9xcpcc6YHhGRJ2iCtpI
        Rq0Gq436muZ9KXct1k8SGFGTGGuMU9s=
X-Google-Smtp-Source: APXvYqx2xq4bjt4YeEf+Ny11O5KZ8oJB2g38LiMJBICEW4BaAefrL0cmDzWtEjUmZRw3nG944SZo5A==
X-Received: by 2002:a25:b8c:: with SMTP id 134mr24240747ybl.115.1573578730849;
        Tue, 12 Nov 2019 09:12:10 -0800 (PST)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id d203sm2464317ywh.48.2019.11.12.09.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 09:12:06 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: logicpd-torpedo-baseboard:  Enable HDQ
Date:   Tue, 12 Nov 2019 11:11:56 -0600
Message-Id: <20191112171156.5952-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The baseboard of the Logic PD Torpedo development kit has a socket
for a rechargable battery.  The battery is monitored by a charger
which can communicate of the the 1-wire HDQ pin.

This patch enables the pinmux for the HDQ pin.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
index 449cc7616da6..f51b472b91b9 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
@@ -101,6 +101,12 @@
 	};
 };
 
+&hdqw1w {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdq_pins>;
+};
+
+
 &vpll2 {
 	regulator-always-on;
 };
@@ -168,6 +174,12 @@
 		>;
 	};
 
+	hdq_pins: hdq_pins {
+		pinctrl-single,pins = <
+			OMAP3_CORE1_IOPAD(0x21c6, PIN_INPUT_PULLUP | MUX_MODE0) /* hdq_sio */
+		>;
+	};
+
 	pwm_pins: pinmux_pwm_pins {
 		pinctrl-single,pins = <
 			OMAP3_CORE1_IOPAD(0x20B8, PIN_OUTPUT | PIN_OFF_OUTPUT_LOW | MUX_MODE3)       /* gpmc_ncs5.gpt_10_pwm_evt */
-- 
2.17.1

