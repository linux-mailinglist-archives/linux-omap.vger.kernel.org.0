Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECDE2AA856
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2019 18:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389110AbfIEQSq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Sep 2019 12:18:46 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39725 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388610AbfIEQSU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Sep 2019 12:18:20 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so1678010pgi.6
        for <linux-omap@vger.kernel.org>; Thu, 05 Sep 2019 09:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=k4RSHQziswwPF3IEl7odNlbX/Lq1Hx75YDWK/+CVFu0=;
        b=jZZB1l94YWLd3tFIaGQ47yvMyJb9LlEazs2Ow8RBBjQ4l/r+vNhmddIWpMfHfHXs50
         78rWPPNCOz1OQu1AmHck6xNxXoRE7CFw9P+2slSZQz2Ys6D042/onIrEufTy+6xGnf7G
         /W7VbSFrbc056Zl/UdlRSDhj5hSjjoWsrULBTO1dp2b+2wVkNBYy15jzvUSO7Yol26Pq
         +a0ju3yHvCNmc2ezasYLStXloGX/OXTLGO31IarwZm/OPn8nU0nkbRODmTltiIBUdlzi
         njdrh0EUYg8SUhgdMLrNIUsilQw7WpjaCy9U6aj+BbrkPvrH3K1Yod5NAymx6bhyqYRw
         48AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=k4RSHQziswwPF3IEl7odNlbX/Lq1Hx75YDWK/+CVFu0=;
        b=l4eVMmskzN+xCN0BoffeSO5IlYcIvWjcW7udalbAe9udajKpfmD1dBpNqVOL1QAi42
         1bBLPCXNKNN/WVUxYK56qDhHbzL660Rc26LS3GmwHddRgMQ/yuSvj1HpWYRFjY8n0eNo
         Qb2+7qBYl5kXtvKwZWKax/YOgpcphzzbkIVjlMeHBdiLoitsuoPxdcsmmisSA8Ipt0Y9
         8VVyA4faL3MWXwpUaPJ9Ugugt5PWARlQVnSe+tsL5zwHlH3Gq1o5cSjkDTA0wgXlAcNq
         P+dPMKR7OXt9bpGdL7NgeMdQx8XHsk2ePl4sp/SR5nc+WJgEYx/cNb2YrkWdcBtZWolf
         oEtA==
X-Gm-Message-State: APjAAAUgfNJYPVJpvKV32WDvjKhosuUfeV4kKrRWUuk9D1AQiB42Zyph
        rmsaL8CVneKIkYhUw+wqLQVTDA==
X-Google-Smtp-Source: APXvYqylgGgnlf/Z0Orza9qJRrWxcszrwnK+vdVT7tg0cYX2LQXbbeSPDVM6mlYFYgUjBYVURutriw==
X-Received: by 2002:a63:714a:: with SMTP id b10mr4066928pgn.25.1567700299222;
        Thu, 05 Sep 2019 09:18:19 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 09:18:18 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     stable@vger.kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [BACKPORT 4.14.y 15/18] ASoC: davinci: Kill BUG_ON() usage
Date:   Thu,  5 Sep 2019 10:17:56 -0600
Message-Id: <20190905161759.28036-16-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Takashi Iwai <tiwai@suse.de>

commit befff4fbc27e19b14b343eb4a65d8f75d38b6230 upstream

Don't use BUG_ON() for a non-critical sanity check on production
systems.  This patch replaces with a softer WARN_ON() and an error
path.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 sound/soc/davinci/davinci-mcasp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/davinci/davinci-mcasp.c b/sound/soc/davinci/davinci-mcasp.c
index af6cd8b874f5..b4e6f4a04cb6 100644
--- a/sound/soc/davinci/davinci-mcasp.c
+++ b/sound/soc/davinci/davinci-mcasp.c
@@ -1748,7 +1748,8 @@ static int davinci_mcasp_get_dma_type(struct davinci_mcasp *mcasp)
 				PTR_ERR(chan));
 		return PTR_ERR(chan);
 	}
-	BUG_ON(!chan->device || !chan->device->dev);
+	if (WARN_ON(!chan->device || !chan->device->dev))
+		return -EINVAL;
 
 	if (chan->device->dev->of_node)
 		ret = of_property_read_string(chan->device->dev->of_node,
-- 
2.17.1

