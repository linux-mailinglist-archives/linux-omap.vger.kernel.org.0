Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8D9216EF0
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 16:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728607AbgGGOip (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 10:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728484AbgGGOiS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jul 2020 10:38:18 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9AEC08C5E3
        for <linux-omap@vger.kernel.org>; Tue,  7 Jul 2020 07:38:18 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s10so45358447wrw.12
        for <linux-omap@vger.kernel.org>; Tue, 07 Jul 2020 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wlcleqYJY5jQ1OZcMa4GgQUjEFsprvthMn+zX7CdCH0=;
        b=C+DvgwtImCJiiCVNxFwI9tT6IRQA5rXY9b0UMNq/qhCDZJquNaMLx1Q027QICk1xw6
         GOcMf0ZeJzxE16mOIP1eh8YHcFNXeCt6BMeMYGeSxEzmXLFRTkUS20lyaPihXAlgOo7n
         3wNkADF2GRmNbauV/DltdxYgl0GoSQPwvkmZyKXUOpKKk3ipTlo7/NkL4p8cA6Z6ECdJ
         ZR4HMK2QM2YJBpGt8wfV72UC6VNVFCCY4ahwb+tPnvIGzY3H8OnSZTNZYWvHp9e/gjvg
         cX0wPlpkVMbw3sBrQkauQHX6xvWLsYdN2dMTjhVYzzzbh/g01qqPoVl3KyHSgRAuL6R8
         1IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wlcleqYJY5jQ1OZcMa4GgQUjEFsprvthMn+zX7CdCH0=;
        b=nBJBHwH4ypskMH0z3XcE/cNVlwjkmSwRC9p5ns6i33Ps9VcKPwLvymx7Kj/hnGLlcc
         j7+6QettNnDUxDwjEvvESG/efbwjWahAd//RzIB5WcJBXlopd/qBIVAoSDY/9cZ8mNuo
         Bxb1Fr4WHT6zPhKSBnQXPyIZ9RwrNw1vLelQQpz1q1XdrYijpalp6V19tYyM87SpRKiJ
         e0kuRwbNKzg74l0Bh6C9RTZXgB+gDDeMjQJO8kkiDV86RpKRObG/k/TMoexFmsS20TcT
         L8/0PEVryfFUSuxSIRDuwS0RkX8i5p540ivWNzLUs4hiTOl/w7Mpx7DPKqhxIfZjXUT0
         YDaw==
X-Gm-Message-State: AOAM533aXc8L4oGe83WYXJMEnElmB7jxTcJ5AMWyyq+wF6iuLYidcjqm
        RLNPPzLrKupH/BJC8TaviEt1bzhZfR8=
X-Google-Smtp-Source: ABdhPJwKOPKcRllwzqIDBY+TgIWIRPSnExaAAvyTfdJWtFOiySyUOdAS4Vf5gq6RLSb6KEqnudtfkg==
X-Received: by 2002:adf:f10a:: with SMTP id r10mr23439173wro.406.1594132697074;
        Tue, 07 Jul 2020 07:38:17 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 07:38:16 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, Lee Jones <lee.jones@linaro.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Samuel Ortiz <samuel.ortiz@nokia.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH v2 21/28] ASoC: ti: omap-mcbsp-st: Remove set, but unused variable 'w'
Date:   Tue,  7 Jul 2020 15:37:35 +0100
Message-Id: <20200707143742.2959960-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Looks like 'w' has remained unchecked since the driver's inception.

Fixes the following W=1 kernel build warning(s):

 sound/soc/ti/omap-mcbsp-st.c: In function ‘omap_mcbsp_st_chgain’:
 sound/soc/ti/omap-mcbsp-st.c:145:6: warning: variable ‘w’ set but not used [-Wunused-but-set-variable]

Peter suggested that the whole read can be removed, so that's
been done too.

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Samuel Ortiz <samuel.ortiz@nokia.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/ti/omap-mcbsp-st.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.c
index 5a32b54bbf3bb..0bc7d26c660aa 100644
--- a/sound/soc/ti/omap-mcbsp-st.c
+++ b/sound/soc/ti/omap-mcbsp-st.c
@@ -142,11 +142,8 @@ static void omap_mcbsp_st_fir_write(struct omap_mcbsp *mcbsp, s16 *fir)
 
 static void omap_mcbsp_st_chgain(struct omap_mcbsp *mcbsp)
 {
-	u16 w;
 	struct omap_mcbsp_st_data *st_data = mcbsp->st_data;
 
-	w = MCBSP_ST_READ(mcbsp, SSELCR);
-
 	MCBSP_ST_WRITE(mcbsp, SGAINCR, ST_CH0GAIN(st_data->ch0gain) |
 		       ST_CH1GAIN(st_data->ch1gain));
 }
-- 
2.25.1

