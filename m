Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF4842A5E5
	for <lists+linux-omap@lfdr.de>; Tue, 12 Oct 2021 15:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236854AbhJLNlp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Oct 2021 09:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236811AbhJLNlo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Oct 2021 09:41:44 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA66C06161C
        for <linux-omap@vger.kernel.org>; Tue, 12 Oct 2021 06:39:43 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id e3so33456965wrc.11
        for <linux-omap@vger.kernel.org>; Tue, 12 Oct 2021 06:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pwr4S1LGsyq6LS7IC4JlQZR0gOk5notLyIpNchi946Q=;
        b=tK9iVXqDey9YSEkJ+qjEQoMoYG3Q+yPvTn0QMjolUFLgpwNQG2Kbfuvn3AKQWflRP3
         k3XFBDIW1e/2dmJNWTVQLWuOo9sqFgOsV1OBwZRlzXTYDLpFdU4f9ykHp38yUULmIUQp
         pdLnjA0dBKxfv6/4osweXzLDWkIP3kUeseU/V35qswDEahz/tbrzfqdmkp10J0Mxhzz+
         SmmBm56eUahr3YFWwuDgFr2l0TMjtyghCi9nSHpPUjjejXr+wrEfX7ybHI4GGOUbHq8/
         frof5wBNyIkGyb3WREZFnJaqFbnHlNEfatC4RffnWWfr+Sp9lro+4bey8iTYT6c5iEcw
         /COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pwr4S1LGsyq6LS7IC4JlQZR0gOk5notLyIpNchi946Q=;
        b=E597omJLF6BHTh/0j01HedKQncsJ6LK2R1gpSVMpZHClgeyhbb7E8qtd4Ixs9k4lxF
         HuvKHCH6XHgBjdcnsKt6gWDJtRSZ6xGmmLPU2K0NrGiUpy1xDvq65cGVvVO/7y+ZsVYo
         12V044S4W8xQ1LSPPpg5Z6tmYU4OlXOYF/VT4qSxokONlFF25D0qKbBb8V63c4fbKcEF
         SQTPvbRmpv9yOCQFv0ho/xKWoXwrnnqG3OzAhoffnl9J03sOtzpFWBCYJvcmlfwfYSVO
         HlPzxH4b9qVwg9Q4KHrwGFIi752u/tchbT1NUxgWYCDErmCQjzsud3rC99s7gYD2BymO
         sarg==
X-Gm-Message-State: AOAM531ts+ZyVIZwCjrlr8+y0coedunnWcm5CuqbEsGiGUZCMDPGf/00
        6r7A9HksKmep5eiIP2zDgZkrFg==
X-Google-Smtp-Source: ABdhPJxQ1Gnp/p3bCIKdrXcPd8k+PI3uzFjtN6X6X7nwkZH8Q1Tjbk52kD+bGxnzgS6iNtoNS6Bi9g==
X-Received: by 2002:a7b:c0d5:: with SMTP id s21mr5663269wmh.57.1634045981609;
        Tue, 12 Oct 2021 06:39:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c])
        by smtp.gmail.com with ESMTPSA id w5sm10573455wrq.86.2021.10.12.06.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 06:39:41 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] drm/omap: increase DSS5 max tv pclk to 192MHz
Date:   Tue, 12 Oct 2021 15:39:39 +0200
Message-Id: <20211012133939.2145462-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828; i=narmstrong@baylibre.com;
 h=from:subject; bh=/IYAeOjznmFZKQtbyiNltXzbWx1SQSeSVXzsgL7Y0g0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhZY/kQXqtsmH1M5LcYhE+C3h0vv0cLeo6PfSgeey5
 U5lfFqSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWWP5AAKCRB33NvayMhJ0ULjD/
 9i46pV2OVbqvg0OYjwURSFxSkXeze5h2UGKeEFVc8PrCVBu29GY5r5cm/37QzZTkev7b9nwKYuKj7s
 LP9/sE6WZF0UDRjOmAyquo6Rh01Hh+bfFcaLF0U5mklpnmy59qPw+m11uYcAvxbsh72r6sPCyWLSks
 Wuaa65aenK06yHvx6Gq/YYWOML/1xcK/HSpnfMzjkHOwvkJpBdT8LE+i/UsBgoOG0p4PveG36yA4N0
 sA2o1wqDOA4dIMvXj6NoG/dRwzzgUx1xnYlJIfBw+TCdSMja66I08mMzDwFHru9WvkJH5npk722cZ1
 Dkiy7wr0YLOmBCI9j5twVpH1bGmKqPbKZ165fFOJkDSqiJDe7uaR6rVoCTnnCniCPAmRPi9e+dsBtC
 9YWC9bAcUA9rJD/S3sHRrfQT41Y98XeK2ZdqPiHfX00MT8tWMgeiQfGnXQh50Qe0WhoJx36jv8K/O5
 uzUu3fyUkHdDj0sorCg2cKS9SmnEmqBu3yc6lZaNPAy5zmemQUp894FmrPrgMCOrEdRVfBDSnlsVz4
 1oFCBEG1lnNG/KFNqDrOnabaf+PSb849gbkWbIQj2mHKpJeRlaHyZJ8JlPENRZv/gJ8uYHeO5+bGLk
 yfJYPVIhghlOh57VX1ZwS+xsQbzv9rw8Goptklar80SmDswP3AxHOqcjqjIw==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen@ti.com>

DSS5's maximum tv pclk rate (i.e. HDMI) is set to 186MHz, which comes
from the TRM (DPLL_HDMI_CLK1 frequency must be lower than 186 MHz). To
support DRA76's wide screen HDMI feature, we need to increase this
maximum rate.

Testing shows that the PLL seems to work fine even with ~240MHz clocks,
and even the HDMI output at that clock is stable enough for monitors to
show a picture. This holds true for all DRA7 and AM5 SoCs (and probably
also for OMAP5).

However, the highest we can go without big refactoring to the clocking
code is 192MHz, as that is the DSS func clock we get from the PRCM. So,
increase the max HDMI pixel clock to 192MHz for now, to allow some more
2k+ modes to work.

This patch never had a clear confirmation from HW people, but this
change stayed on production trees for multiple years without any report
on an eventual breakage.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Tomi,

I slighly changed the commit message to point the fact this patch has been
used in production fort years without any sign of breakage.

Neil

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 5619420cc2cc..3c4a4991e45a 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -4458,7 +4458,7 @@ static const struct dispc_features omap54xx_dispc_feats = {
 	.mgr_width_max		=	4096,
 	.mgr_height_max		=	4096,
 	.max_lcd_pclk		=	170000000,
-	.max_tv_pclk		=	186000000,
+	.max_tv_pclk		=	192000000,
 	.max_downscale		=	4,
 	.max_line_width		=	2048,
 	.min_pcd		=	1,

base-commit: e4e737bb5c170df6135a127739a9e6148ee3da82
-- 
2.25.1

