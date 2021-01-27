Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E139D306211
	for <lists+linux-omap@lfdr.de>; Wed, 27 Jan 2021 18:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235425AbhA0RcB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Jan 2021 12:32:01 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:57766 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235996AbhA0RaB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Jan 2021 12:30:01 -0500
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1611768553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gV4s82FEuVJugdNoRBb0xE+COjn/uKSW2UKMDbD6jHQ=;
        b=wuR6CRkyif58OjIS/1cWiPhdkXgbh0OqmSlzr7gMAtiiifGyw7zj8i7FN1PfpPjucFGtZg
        CA1lCRgAHYo766uQ0mV0iaP5l4k2JuL7uaQF4DhG88oUB0jsOTiNUe45KPn/WeV/mp5xcW
        2Wj74lJO1uAMK/1hcdw6stC+FgTFqwI2i9kzTd+FtnLqZ1vd6aTy8Y6pKTE2CZX4DCAtd8
        zTiPqDaAa7AQfweHPFdkFyMEWwFZcXMDFe4IV+qvOssPV9a0TraLPIajnhVptgqQhDKyl+
        OTGE2j8s413MmOvIzgLY6bkRtFHqRsHHrx2kqvZSFjnSwBFf0209WFc1lYduuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1611768553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gV4s82FEuVJugdNoRBb0xE+COjn/uKSW2UKMDbD6jHQ=;
        b=NaDYvA+wOnqKU2brmmYmjgXx9Os1WNewhM31jbnuz8NnIT52LlmN3YFszE6p1b0tADmnBN
        v0WyuLWIENFZMKAg==
To:     linux-omap@vger.kernel.org
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thomas Gleixner <tglx@linutronix.de>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 2/2] video: omapfb: Remove WARN_ON(in_interrupt()).
Date:   Wed, 27 Jan 2021 18:29:02 +0100
Message-Id: <20210127172902.145335-3-bigeasy@linutronix.de>
In-Reply-To: <20210127172902.145335-1-bigeasy@linutronix.de>
References: <20210127172902.145335-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Ahmed S. Darwish" <a.darwish@linutronix.de>

dsi_sync_vc() uses in_interrupt() to create a warning if the function is
used in non-preemptible context.

The usage of in_interrupt() in drivers is phased out and Linus clearly
requested that code which changes behaviour depending on context should
either be separated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

The wait_for_completion() function (used in dsi_sync_vc_vp() and
dsi_sync_vc_l4() has already a check if it is invoked from proper
context.

Remove WARN_ON(in_interrupt()) from the driver.

Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbd=
ev/omap2/omapfb/dss/dsi.c
index dc34bb04b865c..df90091de75f8 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -2373,8 +2373,6 @@ static int dsi_sync_vc(struct platform_device *dsidev=
, int channel)
=20
 	WARN_ON_ONCE(!dsi_bus_is_locked(dsidev));
=20
-	WARN_ON(in_interrupt());
-
 	if (!dsi_vc_is_enabled(dsidev, channel))
 		return 0;
=20
--=20
2.30.0

