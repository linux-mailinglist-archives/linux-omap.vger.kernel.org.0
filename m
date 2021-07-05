Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1AB63BC330
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jul 2021 21:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhGETnN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jul 2021 15:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhGETnN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jul 2021 15:43:13 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B98C06175F
        for <linux-omap@vger.kernel.org>; Mon,  5 Jul 2021 12:40:35 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id u25so25912507ljj.11
        for <linux-omap@vger.kernel.org>; Mon, 05 Jul 2021 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nOpUy5xHeuJOos9ar9hRXmpZzYmMtFmjPsSjfELVa8A=;
        b=K/3hCrosFdpUbTHdtCDAWPK55w7YXi114gMvfr6QFGBsNZ9I8ctS6xNowG1DyDFCOE
         5MgAGVcNPI15zGyiCIYnPXW9ZvgDx9kGiUG4NLte6GGPW5XIlaJrCbBzdq02EXOfuuAO
         nnSJEB8Ewg4i/OjKaL+aPJV+nQTXhfWBTa4iGV/B05IcHWIbKU1v7GZwrUN+RWCIIzds
         Q9uIt5u3ij3zx6vaPN0bOwPWmw2amqE81kgegvXDR74wrpq6Nk0Mf9PnrgnPWV7itT+f
         PSV3u+dQB/zBr8680yZLvPoyrOHAwFZ3LvvVzkrLuEWgZT5SAFW0gHDHRLEsthHCnLve
         jkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nOpUy5xHeuJOos9ar9hRXmpZzYmMtFmjPsSjfELVa8A=;
        b=M1fFr6r9YwumB/DGCiImulTOmuR/9hzoZGsHNUideq/05cIy4MNvD3qoS0v37uKRmE
         KyI8AldzapevQ2uDmUtOdTuXBTg5/OkLF0fqhjdrP2LqkGkPCrSxuB7q9qrLdUTKZond
         dt8tYQ4ucQk87TFhP7pJEvsy9W3DblAFFEoBX27rvTc2TbkrT55tk2I4+mqpNqVTbQ2o
         mVXAI3hpHX5z76MFyf1lzf29n+2MxCAKrc7UT8cydfsbQ8xrF9N9py9NUkTpP5H8dqUu
         05WE3oVcJ1wIc6iMMIWWNmR/Y/IEJ1JUDNMrwszX6a6D1u8fRNwYbZvLTIUIB3Q3u0Ur
         44bA==
X-Gm-Message-State: AOAM532quDlT9W8PAGmBcrAzxos3f2gUypUg326CzULHgzmHnz4hSWs9
        BpGrwXCLs9LrfQWBdrvXutE=
X-Google-Smtp-Source: ABdhPJzr0skanV+K7S8YxGJQYbDceG65gegEXC37d2KrV7inNrK+bn0IBtMHYTLGoV8cFXUro1cVyA==
X-Received: by 2002:a2e:844a:: with SMTP id u10mr12312217ljh.443.1625514033638;
        Mon, 05 Jul 2021 12:40:33 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id b5sm1167248lfv.3.2021.07.05.12.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 12:40:32 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     broonie@kernel.org, tony@atomide.com
Cc:     alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
Subject: [PATCH v2 2/5] ASoC: dt-bindings: davinci-mcasp: Add compatible string for OMAP4
Date:   Mon,  5 Jul 2021 22:42:46 +0300
Message-Id: <20210705194249.2385-3-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
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

