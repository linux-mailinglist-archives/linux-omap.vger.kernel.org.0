Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A03F431F9F
	for <lists+linux-omap@lfdr.de>; Mon, 18 Oct 2021 16:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbhJRObX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Oct 2021 10:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232186AbhJRObJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Oct 2021 10:31:09 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B1FC06176F
        for <linux-omap@vger.kernel.org>; Mon, 18 Oct 2021 07:28:55 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id i12so41686900wrb.7
        for <linux-omap@vger.kernel.org>; Mon, 18 Oct 2021 07:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lIVpyuu3eqZnfVh+BWlIEt1O3BS03uxO8GKG4EQyBdY=;
        b=gH/1sgob/dAMXDnK1Zij+GCFUd7n9iU8KyIM0JWJOd9CN13vDFG9eQWDrkNMfK3uee
         aA2hbaiFfVm3iyuF3xUh9Wq/RbP9LJb6zb+qACAsNEa3JW/b5VYklxKXGGMVZiMbjhDd
         lNmoC9znCiWNaDokDrt2ZQUmSU00CENQqlrAYHXiGGpIDZw60grXFUL+ZU8XGXZ7jIj7
         SMMXcz6RZTdp6vEy7vHj/8IfDVggwPNisSYbJD4lspL5uMTQxTtzWD8ZOZ8JE1WzmVIY
         zaX+/DMnL1hV7cEKr6LfeM1e3EylhE/Y19tu8oMkSnODkXTevV1vxwoP6qAUZdjvSOSa
         gG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lIVpyuu3eqZnfVh+BWlIEt1O3BS03uxO8GKG4EQyBdY=;
        b=O8j7tIT/7wuUXP8vQOlTj75OGk47Ujs7GEW2eU94hDxYcJTwQSwQnQ598c07KKyesL
         T70/xULnrKPTjQt/FBXtQCspTqPtjzYQJLVi6HehskdsT2BkL6DoPJJG6Y1pYninM8bh
         V/Bt+pIQgUvEqasnDqGxmSiRfHmFz+VjWAy5PvS2XPLwFLdmOe8tHzGhHRgiab/hD5MT
         1deuIXKJ8+hHohvjFqo5MJuCmtoRZb73uGIu49Qrjoef+Zg98l2hmOtiA38LJen3eVlt
         dJd5CVkij8dC30H2xIdZCumWiF7HmyVYAtHBDt2yGZor7o+O0Fw3/jv+VWTzJlBCZPNH
         Om1w==
X-Gm-Message-State: AOAM533ljOa2OY9P+1KkisWBnBZUL1CkM8CY5VX/Z9mUtTDIZ37AhRgm
        CyQ0kn+0ZagFAcDPYqraZBN5kyj71Q5H6A==
X-Google-Smtp-Source: ABdhPJxGGGec7//1d18gIejeXLzf9z9AnspSnl4+KhhmZtXw6ffAjmmPO4j6D829yKFJcMoWll2JxQ==
X-Received: by 2002:a05:6000:184c:: with SMTP id c12mr36506967wri.127.1634567333786;
        Mon, 18 Oct 2021 07:28:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:2dd7:d5eb:6e87:f924])
        by smtp.gmail.com with ESMTPSA id b3sm12908495wrp.52.2021.10.18.07.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 07:28:53 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v6 8/9] drm/omap: add plane_atomic_print_state support
Date:   Mon, 18 Oct 2021 16:28:41 +0200
Message-Id: <20211018142842.2511200-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018142842.2511200-1-narmstrong@baylibre.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792; i=narmstrong@baylibre.com;
 h=from:subject; bh=WJUnfDMOqyIY/JyZJij5vnFH7gBqBRnpbS9bv6xbZYw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhbYSGNhJeWiEgCa74ngEwWcJR2N3i4688rynOukR8
 uHZQBLWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYW2EhgAKCRB33NvayMhJ0bFAEA
 CZPKHg2+39aPe3f5tZvn5JlQz4R0qTMoABfNZbVbQfeOVaG4gzYlXccrk592IxEZ0xovQT5MySrA0C
 96Ncrj3I11amYmcLbSHtW+9jI5IoHTMvO/2BXFqC/HeQdJZMfb+D7Rmuw9+EAMGyjA5SKTLA2pvjdV
 yEzWHdIh3X10E0Pi1MtFk2qRAbTwMfEO0Nb2RJdPdrfenTb8Tx1K4dmE7cFVhzDVXdJs9UxeZViNN9
 oq0H2wxSBkqnB5yZEeOXuNW/8zv3QyEufxUitip0H6jTgUQm7pAYQ0UOSarrnW7OLtQbYYwzDuSHd7
 +hXrPld4d7pujE+zAhZan4YmyvQFJxF18xOqnh6LANTsvgriz4mCFrv2ylN/v+RDONOkSFe2Z2tMnh
 rlDGaFUnkiULCtObooXMZk0s2odxgPFLEPX0QIZc354DTERybRWGQKfLB6Ft0FFbBc8DN9UXyLGyqz
 fK5pWZiCiw7MKLJ9LkFATzR285rBnv419Z7ZA6L8XPrNdbmEcJJ5ZWAsrzkR3BRjkdR5oDpl7aqTnO
 ajKHJcvA4Gyz+Mt5LOTCOGe0wFDMQMOIzFAe2/JTF0CPOzIZRgtRUOhNFvhaGfY3lh3M7EMooJDY06
 Oer5vjgRzt/R1IHLToLhMXFFi+TltDRYqYPWRZixUxR1TmGwrF7lnvoNrEPg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Benoit Parrot <bparrot@ti.com>

Now that we added specific item to our subclassed drm_plane_state
we can add omap_plane_atomic_print_state() helper to dump out our own
driver specific plane state.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index ce5ed45401fb..5001c8354e4f 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -348,6 +348,21 @@ omap_plane_atomic_duplicate_state(struct drm_plane *plane)
 	return &state->base;
 }
 
+static void omap_plane_atomic_print_state(struct drm_printer *p,
+					  const struct drm_plane_state *state)
+{
+	struct omap_plane_state *omap_state = to_omap_plane_state(state);
+
+	drm_printf(p, "\toverlay=%s\n", omap_state->overlay ?
+					omap_state->overlay->name : "(null)");
+	if (omap_state->overlay) {
+		drm_printf(p, "\t\tidx=%d\n", omap_state->overlay->idx);
+		drm_printf(p, "\t\toverlay_id=%d\n",
+			   omap_state->overlay->id);
+		drm_printf(p, "\t\tcaps=0x%x\n", omap_state->overlay->caps);
+	}
+}
+
 static int omap_plane_atomic_set_property(struct drm_plane *plane,
 					  struct drm_plane_state *state,
 					  struct drm_property *property,
@@ -387,6 +402,7 @@ static const struct drm_plane_funcs omap_plane_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.atomic_set_property = omap_plane_atomic_set_property,
 	.atomic_get_property = omap_plane_atomic_get_property,
+	.atomic_print_state = omap_plane_atomic_print_state,
 };
 
 static bool omap_plane_supports_yuv(struct drm_plane *plane)
-- 
2.25.1

