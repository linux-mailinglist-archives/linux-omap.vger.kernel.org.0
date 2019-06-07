Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFE7C388A8
	for <lists+linux-omap@lfdr.de>; Fri,  7 Jun 2019 13:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbfFGLL0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 Jun 2019 07:11:26 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:23808 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728351AbfFGLL0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 7 Jun 2019 07:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1559905882;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Cxs1oKAktwTpHgDSYgztm2PF82fkAQ8JedBNamziUPE=;
        b=jJ75nsznKtbAvSHN+K7CSKtMJvdYoApm6GX4t8NnpqMEe5IbESC10bua23Z0E68yzI
        yaHoB1MTo5+2OLgOOj9tHuZg0aaEAkcMP4OIiRCg7713ytEzpVQUn8H2yXQkhc6F/zD0
        1+u0dOu38U6DfC7p6tjIE/qfEuSTAK/xk/DBCRqwIYql38uJbIjjbEKjQarG958sS9+B
        cLosJuMhTPK/xeq6WHimAFaCrU6rTRzHGPz430AuqKfZlfal7sEYf8KRPScSuPdTV5v4
        7eUOIOsCfE5ocNOdEuZDDiII9mO5IhLPVnpaDEXbgINhjvZ88wDF9D1nGjjx7vQWok6y
        qgaA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAwkq13LM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
        with ESMTPSA id i01b98v57BBEPaS
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 7 Jun 2019 13:11:14 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
        imirkin@alum.mit.edu, marek.belisko@gmail.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, letux-kernel@openphoenux.org,
        devicetree@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v3 4/5] dt-bindings: drm/panel: simple: add ortustech,com37h3m99dtc panel
Date:   Fri,  7 Jun 2019 13:11:10 +0200
Message-Id: <3e0720fbddfd7b35ad8551440544411485d8ad9f.1559905870.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559905870.git.hns@goldelico.com>
References: <cover.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../display/panel/ortustech,com37h3m99dtc.txt        | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt

diff --git a/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt b/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt
new file mode 100644
index 000000000000..06a73c3f46b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt
@@ -0,0 +1,12 @@
+OrtusTech COM37H3M99DTC Blanview 3.7" VGA portrait TFT-LCD panel
+
+Required properties:
+- compatible: should be "ortustech,com37h3m99dtc"
+
+Optional properties:
+- enable-gpios: GPIO pin to enable or disable the panel
+- backlight: phandle of the backlight device attached to the panel
+- power-supply: phandle of the regulator that provides the supply voltage
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
-- 
2.19.1

