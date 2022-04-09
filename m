Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C72FA4FA76C
	for <lists+linux-omap@lfdr.de>; Sat,  9 Apr 2022 14:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbiDIMHb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Apr 2022 08:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbiDIMHa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 Apr 2022 08:07:30 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E657360C8
        for <linux-omap@vger.kernel.org>; Sat,  9 Apr 2022 05:05:21 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id a30so14467627ljq.13
        for <linux-omap@vger.kernel.org>; Sat, 09 Apr 2022 05:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W2x7AyNcYhIEBG1UmKMUkshHpXP5duVaX+ckIB7Pknc=;
        b=oDcgINnk2jyD0U8CLm/0OcaSGakbkbHo3g29WGv6P1ySWrKCbtf8Mzgu8cO35C3o9o
         gZzqbS+dsrzNeJX15IW1wv7InCZJ9k3YlbtJ5099e5YWG+HFTndI6wH6VGPuZy74MXQA
         5GiSgf0pvG5G+R9m2UQxTUv211wOqNQ+keaBCUTT6od7WrxCrBt3YVpQTsYwc39y1Zfv
         +tn+pegxfSD4CfFkQsYZAdLUwH+vQ5QqnwanscqJkM0O7AIB5p/wmOac7u77ZokDBUAY
         rglO5DHkHapZrvUv/N5UxsSQOzHfPQx5N97phApaxvRGkdWgkPz9phl9Uv5IjZ/TiTmg
         Wzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W2x7AyNcYhIEBG1UmKMUkshHpXP5duVaX+ckIB7Pknc=;
        b=hJ25DKCs9WWliq3dzMyWY9MtHBLfW2XOVw9JfcVUx8QiTrZi+G8eBkLbSL3bCdFJfZ
         uAcZsn2suZyOR79k6TXAR7ZnlrkvqlXxckhOVxsCahHZIS75VajOGueWctUlHqwCzPP8
         /E2OqKcoNVv2K/v+vuUS7Tmir0QVsO85rGcaLlEqKbfonN7khXjlsvEV8cV9ixTN3/hG
         bC9mSm9w0QsYmsgLj7Fqy4gQjSQNb2AGlhqtWyFVdP9lhkgGcsFwi+FnX6zKW4VbOxD4
         P9dgDIoK/hgcGTCMFQjbDfT67R9D8tiTp1XZbjoitFiWT6XTCQCeKJCPw8x7tgkc5JRP
         Ihig==
X-Gm-Message-State: AOAM532ExKV042qiHhUzV+skw7E0xkdkOWbhicHlzdu8oRC4inq/o4UG
        KEkRSXQzX73AGkPPwvHA47E=
X-Google-Smtp-Source: ABdhPJwohCyBIQ9FKP91KhNxmfu9p2W8y5D+PvVDKtklKR4QQK7p5gqLSq3fQOcrhmL2ZDGEZEXUDQ==
X-Received: by 2002:a2e:86c4:0:b0:24b:54a2:cde with SMTP id n4-20020a2e86c4000000b0024b54a20cdemr3051850ljj.190.1649505919985;
        Sat, 09 Apr 2022 05:05:19 -0700 (PDT)
Received: from dell.intranet (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id p24-20020a056512329800b0046b86c6dd49sm427829lfe.130.2022.04.09.05.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 05:05:19 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v3] ARM: OMAP1: Prepare for conversion of OMAP1 clocks to CCF
Date:   Sat, 09 Apr 2022 14:05:17 +0200
Message-ID: <3167483.44csPzL39Z@dell>
In-Reply-To: <CAK8P3a0ALOvTwFgr=r7v_E6HXjcUTYnkMqQrGc7fmdPaQ3nm3Q@mail.gmail.com>
References: <20220402195155.141364-1-jmkrzyszt@gmail.com> <CAK8P3a0ALOvTwFgr=r7v_E6HXjcUTYnkMqQrGc7fmdPaQ3nm3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tuesday, 5 April 2022 11:39:05 CEST Arnd Bergmann wrote:
> On Sat, Apr 2, 2022 at 9:51 PM Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> >
> > In preparation for conversion of OMAP1 clocks to common clock framework,
> > identify arch/arm/mach-omap1 local users of those clocks and update them
> > to call clk_prepare_enable/clk_disable_unprepare() instead of just
> > clk_enable/disable(), as required by CCF implementation of clock API.
> >
> > Users which reside under /drivers will be updated via separate patches,
> > split out from v2 and already submitted.
> >
> > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > ---
> >  arch/arm/mach-omap1/mcbsp.c    | 8 ++++----
> >  arch/arm/mach-omap1/ocpi.c     | 4 ++--
> >  arch/arm/mach-omap1/serial.c   | 6 +++---
> >  arch/arm/mach-omap1/timer32k.c | 2 +-
> >  4 files changed, 10 insertions(+), 10 deletions(-)
> 
> This all looks good to me. I have now rebased my omap1 multiplatform series
> on the latest kernel and integrated some of your new work, see [1].
> 
> I have also finished up the multiplatform conversion for all other ARMv4T
> and ARMv5 platforms and sent them out, hopefully we are getting into the
> endgame with this.
> 
> Are you able to test your CCF patches in combination with my series?
> It would be great if we could get this all working in time for 5.19.
> 
>          Arnd
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=omap1-multiplatform-5.18

Your branch with my CCF patches on top of it works for me on my OMAP1510 
based Amstrad Delta with the below fix:

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 8cafe7819e13..292fcb0a24fc 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1623,7 +1623,7 @@ static int omapfb_do_probe(struct platform_device *pdev,
 
 	init_state = 0;
 
-	if (pdev->num_resources != 1) {
+	if (pdev->num_resources != 2) {
 		dev_err(&pdev->dev, "probed for an unknown device\n");
 		r = -ENODEV;
 		goto cleanup;

Amstrad Delta uses internal LCD controller, then the second IRQ (for sossi) 
is not needed, but your patch "fbdev: omap: pass irqs as resource" adds 
both to the array of omapfb resources and sets pdev->num_resources = 2.

Thanks,
Janusz


