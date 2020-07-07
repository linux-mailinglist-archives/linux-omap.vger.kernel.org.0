Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 792222169E1
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 12:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgGGKSF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 06:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728230AbgGGKRP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jul 2020 06:17:15 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5ECC08C5DB
        for <linux-omap@vger.kernel.org>; Tue,  7 Jul 2020 03:17:15 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l17so42691574wmj.0
        for <linux-omap@vger.kernel.org>; Tue, 07 Jul 2020 03:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eb/RPEg+kMf5EbfmZ+xzaRqlinKf/Ie6foYLp+7RL7o=;
        b=hYVZlimbR1Y4vTKWrzDgy1aOXAjhRbuXLpjometenz6KMcYiaNc5FhS2U/BgwBCWXy
         LzGWQeSIPg9sR21qe7fjeRqIc3SEMoZrxAkopagoIob1IVlOGbwvFoVywKOqplqP8Umt
         XvO5Yn4OK6ezPzEVhTp5NEyj+HxHd9PFoQ1Fsavx+M+BoqizA5C06Jn5KeLfpr+OIWrh
         +5N+5by4tWgAD/1iQ/PsHy93hhlGY9XnJaOnJKnMMbeQ2LmKUuDnMHIW9lPfudD4XTye
         qSnp/RyyG0guNjiIyiyWHMN+FOLPl53mrX7b5uT0jtu3YXZc4Fa80g30Up4hUTbEk/B9
         MpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eb/RPEg+kMf5EbfmZ+xzaRqlinKf/Ie6foYLp+7RL7o=;
        b=hc3ahKSXkeEc5JkgiJcyWeiFivzPb0zd76DuDwoguFbwqvqk+TeHNnSMhNRWS8NuvW
         PcKt88WBJlgpSsfshKlXW5kW+ZCwcP2IU7KiFzJvG/cne4En6e5Q4ZCTgEs4ULhrHpLT
         5ImNQgkz/ntVczd3vlgLZo0O+SjZr5njkzdSo0x1LdmK1aek/LrP569/bx9B01ntIxnP
         ZznYacJF1moFPE7f9Ifqf5vwLYQVUrTvS+ZZboReCrbnF/nAajYirjUHmH1xenjkWC9v
         V302on6IDNhSAMZXSZyOlzQS0iD1942N2nVYE7haAsTn2XyXKBXHXOKdafJM+xsgM3NZ
         ISRQ==
X-Gm-Message-State: AOAM530JpHfo0z4sAsSH6BqEmNVFuFYKItCk+Osrr+rVeWhISYdTIn87
        aBfi5TgII4R3LmG83ASI1gWAjQ==
X-Google-Smtp-Source: ABdhPJwiukos6NDimwam5UH9qNhkPMjAs8ALC3WtOoAlktRpKr9H6nmMroUuFl9TDomf2uyT3u8ExA==
X-Received: by 2002:a7b:c259:: with SMTP id b25mr3421129wmj.107.1594117034103;
        Tue, 07 Jul 2020 03:17:14 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 03:17:13 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, Lee Jones <lee.jones@linaro.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Samuel Ortiz <samuel.ortiz@nokia.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH 21/28] ASoC: ti: omap-mcbsp-st: Remove set, but unused variable 'w'
Date:   Tue,  7 Jul 2020 11:16:35 +0100
Message-Id: <20200707101642.1747944-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
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

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Samuel Ortiz <samuel.ortiz@nokia.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/ti/omap-mcbsp-st.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.c
index 5a32b54bbf3bb..643ef7eb68fc8 100644
--- a/sound/soc/ti/omap-mcbsp-st.c
+++ b/sound/soc/ti/omap-mcbsp-st.c
@@ -142,10 +142,9 @@ static void omap_mcbsp_st_fir_write(struct omap_mcbsp *mcbsp, s16 *fir)
 
 static void omap_mcbsp_st_chgain(struct omap_mcbsp *mcbsp)
 {
-	u16 w;
 	struct omap_mcbsp_st_data *st_data = mcbsp->st_data;
 
-	w = MCBSP_ST_READ(mcbsp, SSELCR);
+	MCBSP_ST_READ(mcbsp, SSELCR);
 
 	MCBSP_ST_WRITE(mcbsp, SGAINCR, ST_CH0GAIN(st_data->ch0gain) |
 		       ST_CH1GAIN(st_data->ch1gain));
-- 
2.25.1

