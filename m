Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 754533BAD90
	for <lists+linux-omap@lfdr.de>; Sun,  4 Jul 2021 17:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhGDPFO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 4 Jul 2021 11:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhGDPFO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 4 Jul 2021 11:05:14 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A81CC061574
        for <linux-omap@vger.kernel.org>; Sun,  4 Jul 2021 08:02:38 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t17so27794928lfq.0
        for <linux-omap@vger.kernel.org>; Sun, 04 Jul 2021 08:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nOpUy5xHeuJOos9ar9hRXmpZzYmMtFmjPsSjfELVa8A=;
        b=ndzUD/rgkvhBq1IG58jEEg8IZKvma1NB89a5uziZmIsbIxT3MEiTNYvo5OtnRRujCn
         RLN6XOMRapqlr9hF5nUOYiRcPggIZILVvw51/Q+YqR9cbZPWAXwThThgFkxpF+GkEO0G
         RQVd4o2ndoSNs4zc9q7EOCaMZL5tMJWvVogrOlU28Q9MGvyk0ChcAhIsSwSO+n7apbVv
         fo4ofZZr43wmUGU8SX16F4D0wPPvBkGVb4Vp6WLqc4bCBpz/PkjfYrduma76pd+OifmI
         bwupaouPjs2r0408d7mt8+jczb8daTv9OACsQB3Gk0oTB78Gq2iNu9JOA7hehn9Tlr4S
         OOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nOpUy5xHeuJOos9ar9hRXmpZzYmMtFmjPsSjfELVa8A=;
        b=BDezilTkBcm6dKDztsjb3yeIn2A5S557Gbh3JB6/oCBv180YhfxFwIUArhG+zpzfyJ
         1/RQQbpVR+Ke9ssSqJLobZjo3Bpl69b3wkiJDhgIJ5rxHEVxutTBcWd222AJ6br+hpSD
         acjDXep77iqhTltyn2Zh/4di5KO9dmgPoWvLS/Wtd2JSpQKKuujxtMFS9WkTuHzpdhnQ
         TtVDR5GHMZTTB6ZikfPxD7F5XRyaP+TENNCFXg8bgU/LKHlSBxUwagW8xOcr3J7XhSmA
         a3FdSaXMLOsAQ8lo1mKEuK/VO6fUbT4WyOoeQ78KBo9MjP/N7ZpL5pYP1jiNdfAagHuN
         CcTw==
X-Gm-Message-State: AOAM533MXJyYn+cHGOkLzNAf9KMlaMIrFQVUnce2x5XJz5JTkZ/fPELk
        lmIxM6k4uLDJbeoutJuvMRA=
X-Google-Smtp-Source: ABdhPJxViP7tCqgW6wU2dgnzo0XeICUptuEXwzf0L4TRojqYvknubl3Utv2E+uZmbXAgVH2GP7sd+Q==
X-Received: by 2002:a05:6512:2086:: with SMTP id t6mr7065840lfr.424.1625410956508;
        Sun, 04 Jul 2021 08:02:36 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id k11sm268826lfc.272.2021.07.04.08.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 08:02:35 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     broonie@kernel.org, tony@atomide.com
Cc:     alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
Subject: [PATCH 2/5] ASoC: dt-bindings: davinci-mcasp: Add compatible string for OMAP4
Date:   Sun,  4 Jul 2021 18:04:47 +0300
Message-Id: <20210704150450.20106-3-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

OMAP4 has one McASP instance with single serializer and supporting only
DIT mode.
According to the TRM the DAT port needs to be accessed as specific offset
compared to other devices where access to any part of the DAT region is
valid.
To handle this constraint we need to introduce a new compatiple string for
OMAP4.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
index c483dcec01f8..bd863bd69501 100644
--- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
+++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
@@ -6,6 +6,7 @@ Required properties:
 	"ti,da830-mcasp-audio"	: for both DA830 & DA850 platforms
 	"ti,am33xx-mcasp-audio"	: for AM33xx platforms (AM33xx, AM43xx, TI81xx)
 	"ti,dra7-mcasp-audio"	: for DRA7xx platforms
+	"ti,omap4-mcasp-audio"	: for OMAP4
 
 - reg : Should contain reg specifiers for the entries in the reg-names property.
 - reg-names : Should contain:
-- 
2.32.0

