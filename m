Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F199C4158BD
	for <lists+linux-omap@lfdr.de>; Thu, 23 Sep 2021 09:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239555AbhIWHIj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Sep 2021 03:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239454AbhIWHIg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Sep 2021 03:08:36 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD8A4C061756
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 00:07:05 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id t28so799504wra.7
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5GWAsl4l64TQBtsmcfug9p1yGttFyM9Ke67LZF01xVU=;
        b=d9BuzkQ4r4tP5eRWDOMRiIPSIfhlfsoyCCF+cNGUvGn07I1BwTOcpGUCMrCVzi/TEW
         eludHV8OstE6OBnKI4OyMUuhifZDSLAvY465HQBx38ydDMB1y1+JBn9+xqqvowRE8qN/
         7Rgss8Pts8eUU6DuMYkj6ZSFRND3sDk21e9ppIu7Eo3gQ57XfSdyPQip2/Us8qrQInEV
         NGVzPYy4OyyNzLm2CBtpZE7vSVGo4XleSk7sBiCtsCzC70jBPoFO1ThEDBQfkADjdO/+
         /FODRtwF3tMr1PxxskKxcZW9cV6MrYW8nKaW2WY17DtzDrwa9JiJ1XB+g+Fg1GA/fT8w
         0wEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5GWAsl4l64TQBtsmcfug9p1yGttFyM9Ke67LZF01xVU=;
        b=W39sOAZ/RlHUvQArLbDAiZesYxBEMwui8F0JAL0Iu962Pet9oadIo//0wr5U8zPTID
         x5TccK8Pixe5S4gWV7OIrMpp61EsPx7V/fJ3N6lmN3KSFktl1NbFlitjUDKi5xvfj1fF
         FqBNzoAEF1HBG9XijaheLbeBkQLZx1lBF2IJemfJ6Fi72oqATLSQ4tIDG6oh0i0IsvLa
         LBaG4auCoiegsPEEXG75W2OKgnOcGVAF0H+pq9tiNuI9N/SaFdHQsw+PRvnmEnxSu+Jv
         AIGN4BqtUHkurR11pX4B1zy9oliLnGBzHtjffsXLqA3rOaUaTByLAksuDQQ6/xGcpr7E
         UuAA==
X-Gm-Message-State: AOAM5323Xs9LChroRZeztAKaVPowlM50NO4EDWzm9dBWkiFdCJF7/INS
        xtC0qm7xyoTkEnENg1gbEp6CxA==
X-Google-Smtp-Source: ABdhPJzJXo/zSlxISVuBtECbdiljJaMAtg8mhirRu9qOf52JpS4J5LwiHunEEHKRXiTq0yePT2icuw==
X-Received: by 2002:adf:ec4b:: with SMTP id w11mr3091248wrn.389.1632380823641;
        Thu, 23 Sep 2021 00:07:03 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:74cf:b054:76f4:7692])
        by smtp.gmail.com with ESMTPSA id d2sm4380357wrc.32.2021.09.23.00.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 00:07:03 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v5 0/8] drm/omap: Add virtual-planes support
Date:   Thu, 23 Sep 2021 09:06:53 +0200
Message-Id: <20210923070701.145377-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2183; h=from:subject; bh=yOy5rWZ5ENlqECjbFwkSYwKDX6hpYWcemiBYkbWEeNs=; b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhTCceglpcB1dj9PYGpYa5ZkCO0lTrijPyuaDPsRyi x8nXJ6iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYUwnHgAKCRB33NvayMhJ0W26D/ 42qZZtIUkKfXE+zeZeenqKivzrk/RLby68iBMhBX+Uth+xSa9ZmVyrn6dDEIEIPQnh/Hd+UjyU/1Hv XoBm2eatKhFoKW72clHIuNuocTEXGqTW6B42PQyENIwYD3TMxhDi+FM/mAe85U9v0S9eBITQMiEm8K 0U1q76x06HrR09+i0sEmBtsDVhYe7lvAdOoDFerkToRbHpf8KT6r3aaxZ/CCNBm75VhpNipSBbCo4J ikYm/woKxBlcjxDqwjd93mmlwnY7ug4dbJosf4JqTurmWzgyPMe3zKs6u8uAVTENn2inKLDdYAeU90 mjmZf7OAzxXnLV2Bjz8pmcjDdk5qYirz4YjncdarFbjU1GAdLdNbMXVJJQVlYYP4LLU9t+FYRNDTZ9 vyEVtt3KLK1JIR4LakD5LpEjx1vtU79pXjK0giIRxewOK4d4McH5l+BahcfbQpDrWLJVUd+w+Bqoys 7+Rh+tzTHTEgOlrE5X+cTlhos63WcGXR6Op3PoNHRYg9LUuOeVMYN1mBTnnnWMUf/hIRgtzvLerMgM P/hiKmJEG9iKPdmDYxhKp5fTQONdM1obR8QaPKZnWQ98vE3QNxPAn2/kF0U6ns3H/su2P20cncPB18 /hehqOaHi29JbDFWZU24zyXMpyQRfPNpCiHIi3TTh+UomFFxBlM9vvhMnp7Q==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patchset is the follow-up the v4 patchset from Benoit Parrot at [1].

This patch series adds virtual-plane support to omapdrm driver to allow the use
of display wider than 2048 pixels.

In order to do so we introduce the concept of hw_overlay which can then be
dynamically allocated to a plane. When the requested output width exceed what
be supported by one overlay a second is then allocated if possible to handle
display wider then 2048.

This series replaces an earlier series which was DT based and using statically
allocated resources. 

This implementation is inspired from the work done in msm/disp/mdp5
driver.

Changes since v4 at [1]:
- rebased on v5.15-rc2
- adapted to drm_atomic_get_new/old_plane_state()
- tested on Beagle-x15
- checked for non-regression on Beagle-x15
- removed unused "state" variable in omap_global_state

[1] https://lore.kernel.org/all/20181012201703.29065-1-bparrot@ti.com/

Benoit Parrot (8):
  drm/omap: Add ability to check if requested plane modes can be
    supported
  drm/omap: Add ovl checking funcs to dispc_ops
  drm/omap: introduce omap_hw_overlay
  drm/omap: omap_plane: subclass drm_plane_state
  drm/omap: Add global state as a private atomic object
  drm/omap: dynamically assign hw overlays to planes
  drm/omap: add plane_atomic_print_state support
  drm/omap: Add a 'right overlay' to plane state

 drivers/gpu/drm/omapdrm/Makefile       |   1 +
 drivers/gpu/drm/omapdrm/dss/dispc.c    |  31 +-
 drivers/gpu/drm/omapdrm/dss/dss.h      |   5 +
 drivers/gpu/drm/omapdrm/omap_drv.c     | 189 ++++++++++++-
 drivers/gpu/drm/omapdrm/omap_drv.h     |  28 ++
 drivers/gpu/drm/omapdrm/omap_fb.c      |  33 ++-
 drivers/gpu/drm/omapdrm/omap_fb.h      |   4 +-
 drivers/gpu/drm/omapdrm/omap_overlay.c | 254 +++++++++++++++++
 drivers/gpu/drm/omapdrm/omap_overlay.h |  41 +++
 drivers/gpu/drm/omapdrm/omap_plane.c   | 375 +++++++++++++++++++++----
 drivers/gpu/drm/omapdrm/omap_plane.h   |   1 +
 11 files changed, 903 insertions(+), 59 deletions(-)
 create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.c
 create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.h

-- 
2.25.1

