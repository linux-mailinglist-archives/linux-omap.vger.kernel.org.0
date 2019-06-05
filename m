Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C16993561C
	for <lists+linux-omap@lfdr.de>; Wed,  5 Jun 2019 07:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfFEFHP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Jun 2019 01:07:15 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:11915 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbfFEFHP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Jun 2019 01:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1559711232;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=9HrfA+nGUIofb4uzcr10lyOFJZGIK/MX9HZYtnlp2N0=;
        b=m1jS+/qWgsAcKqHLEUoAdRIA0CDHZE3XbS3WSzimXKBSrXaj0dAvnyhz3OFspYAK17
        jyEgCbMPDTbMg8ksF1tR+45y3k7IaC3YFr48KoPUu5+Y8wASbxgTFPbXGLhOfyM8vZ2O
        0WZjzF4xM0F5ZaDFaHHU0TF7HuD8mX9bUbZBzx6/2WjnKnctHwvgwLEPWxoho541symj
        +2uiyzASZ2GLyOLk3HMomN+Ecfq/dI/jqsNQXMLQVPmihiseL4SIqpXbHIHebqz4Ho40
        U2OPD2pSsOgLslZwlfDguD6aWGJfzCGm5v3qMNAO0h0y23pXW8MfxziDiGTuBpxM0vQa
        f+ew==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2MzN9Qq6uM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
        with ESMTPSA id i01b98v55573A1A
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 5 Jun 2019 07:07:03 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
        imirkin@alum.mit.edu, marek.belisko@gmail.com
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, letux-kernel@openphoenux.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 0/2] drm/panel-simple: Add panel parameters for ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
Date:   Wed,  5 Jun 2019 07:07:01 +0200
Message-Id: <cover.1559711222.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

V2:
* fix typo in 99dtc panel compatible string (reported by imirkin@alum.mit.edu)

V1:

Since v5.2-rc1 OMAP is no longer using a special display driver architecture
for DPI panels, but uses the general drm/panel/panel-simple.

So we finally can add SoC independent panel definitions for two panel models
which we already had worked on quite a while ago (before device tree was
introduced):

	https://patchwork.kernel.org/patch/2851295/



H. Nikolaus Schaller (2):
  drm/panel: simple: Add Sharp LQ070Y3DG3B panel support
  drm/panel: simple: Add Ortustech COM37H3M panel support

 drivers/gpu/drm/panel/panel-simple.c | 63 ++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

-- 
2.19.1

