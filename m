Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70603388A9
	for <lists+linux-omap@lfdr.de>; Fri,  7 Jun 2019 13:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbfFGLLg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 Jun 2019 07:11:36 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:15734 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728573AbfFGLLd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 7 Jun 2019 07:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1559905889;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=gdbB42uBtpCZVbeW6GNf/4lkZJ/Djuqs29FobgjrNn4=;
        b=HLp3Ssps7BnuxN0rKyZgAZxMMHp2GZv7CkVDfglU46BfWkhURMjXmt4cLRanOUQ4Fq
        ykvygxX/TeYfq1e8sIjmVnnKIFBR0T0Sz5UcmYkMGso1M81TIor/aAyo0eApxL8WlJSZ
        eTgGp84MtmeE0+fIouBaEW/9q2qgx5Zt+DZOA10jOJC0Xskwuaf01RKrXoY5r6vTXQMv
        UqUDpmm+JhMGPG1skTnpNsng3Zis8CScPcKRc6qYDdLe/DMf7E6aqRcvGIY9WWirBNey
        3+bnQg5XGTQyFuUiIFP2YxjIkrDVp7FKuPNyRY0s1iPzVxMPb4BbxglU0TngQ++u4P4p
        XG0g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAwkq13LM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
        with ESMTPSA id i01b98v57BBCPaN
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 7 Jun 2019 13:11:12 +0200 (CEST)
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
Subject: [PATCH v3 0/5] drm/panel-simple: Add panel parameters for ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
Date:   Fri,  7 Jun 2019 13:11:06 +0200
Message-Id: <cover.1559905870.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

V3:
* add bindings documentation (suggested by sam@ravnborg.org)

V2 2019-06-05 07:07:05:
* fix typo in 99dtc panel compatible string (reported by imirkin@alum.mit.edu)

V1 2019-06-04 14:53:00:

Since v5.2-rc1 OMAP is no longer using a special display driver architecture
for DPI panels, but uses the general drm/panel/panel-simple.

So we finally can add SoC independent panel definitions for two panel models
which we already had worked on quite a while ago (before device tree was
introduced):

	https://patchwork.kernel.org/patch/2851295/



H. Nikolaus Schaller (5):
  drm/panel: simple: Add Sharp LQ070Y3DG3B panel support
  drm/panel: simple: Add Ortustech COM37H3M panel support
  dt-bindings: drm/panel: simple: add ortustech,com37h3m05dtc panel
  dt-bindings: drm/panel: simple: add ortustech,com37h3m99dtc panel
  dt-bindings: drm/panel: simple: add sharp,lq070y3dg3b panel

 .../display/panel/ortustech,com37h3m05dtc.txt | 12 ++++
 .../display/panel/ortustech,com37h3m99dtc.txt | 12 ++++
 .../display/panel/sharp,lq070y3dg3b.txt       | 12 ++++
 drivers/gpu/drm/panel/panel-simple.c          | 63 +++++++++++++++++++
 4 files changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com37h3m05dtc.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.txt

-- 
2.19.1

