Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E6E43E4D6
	for <lists+linux-omap@lfdr.de>; Thu, 28 Oct 2021 17:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbhJ1PT1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Oct 2021 11:19:27 -0400
Received: from mail-vk1-f175.google.com ([209.85.221.175]:41692 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbhJ1PT0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Oct 2021 11:19:26 -0400
Received: by mail-vk1-f175.google.com with SMTP id 20so3150236vkc.8;
        Thu, 28 Oct 2021 08:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=BXLaUTYOVxvvQd4nIOAq6bZKoQRM5UPz+DwNeiNfKbc=;
        b=Ze/XptZRnJJAPkee6AXcUEj4WX41gYudZVP54gmb7mGmyMKpPpv7AwIDZmGO7euhJw
         DNU0+fLSTtJDUNMj1fwMy/VQLGZb2tRL7WL+0RdT5BOZKN0L19SHe/y9uGzNffDH5FWk
         RvK2XNuCzTObAqgDN+9FYlADmIir+07yjjiXNH1CRMIJF4NN1MFKvM2xXL7dmS0DP0v6
         q75pmlq9d45i3eE0RrwagPTTdCVe2NTBjBGAEyJYXSkfNHvDF349dyVhozc7tLJT6Vmp
         iR49ZbyjuKyXjIgzkxPRIYhmg7ijj4DkdK4nSubbVkAuLFPOHxB1xptzdGIYBqcuM24s
         fgHA==
X-Gm-Message-State: AOAM5313iFSqmcm0tLfBeIR7K1aiEJ/exeDphzu/PTedARFDSIUctErq
        ydcH6zpqe19q2sHj43FRfX+06ya+h9tElQ==
X-Google-Smtp-Source: ABdhPJySpBVGBi7yaFuBIJsW9dKP31y1fizl22Y6Rx5evxnhahd+8nnTdeVASY07+efzDQ9V5U9Xmw==
X-Received: by 2002:a1f:7246:: with SMTP id n67mr4664811vkc.15.1635434218690;
        Thu, 28 Oct 2021 08:16:58 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id q129sm481714vsb.6.2021.10.28.08.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 08:16:58 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id u9so12168476uac.8;
        Thu, 28 Oct 2021 08:16:58 -0700 (PDT)
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr5119238vsl.9.1635434218092;
 Thu, 28 Oct 2021 08:16:58 -0700 (PDT)
MIME-Version: 1.0
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Oct 2021 17:16:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjdQrwV-dP=8n1NQ_AZU7-oAjhmVv2hZBEJHQF5zynCQ@mail.gmail.com>
Message-ID: <CAMuHMdUjdQrwV-dP=8n1NQ_AZU7-oAjhmVv2hZBEJHQF5zynCQ@mail.gmail.com>
Subject: DRA7 clock question
To:     Tero Kristo <kristo@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tero, Tony,

I accidentally stumbled across the following code in drivers/clk/ti/apll.c:

    static int dra7_apll_enable(struct clk_hw *hw)
    {
            struct clk_hw_omap *clk = to_clk_hw_omap(hw);
            int r = 0, i = 0;
            struct dpll_data *ad;
            const char *clk_name;
            u8 state = 1;
            u32 v;

            ad = clk->dpll_data;
            if (!ad)
                    return -EINVAL;

            clk_name = clk_hw_get_name(&clk->hw);

            state <<= __ffs(ad->idlest_mask);

state is shifted to its bit position...

            /* Check is already locked */
            v = ti_clk_ll_ops->clk_readl(&ad->idlest_reg);

            if ((v & ad->idlest_mask) == state)

... and checked.

                    return r;

            v = ti_clk_ll_ops->clk_readl(&ad->control_reg);
            v &= ~ad->enable_mask;
            v |= APLL_FORCE_LOCK << __ffs(ad->enable_mask);
            ti_clk_ll_ops->clk_writel(v, &ad->control_reg);

            state <<= __ffs(ad->idlest_mask);

state is shifted again? ...

            while (1) {
                    v = ti_clk_ll_ops->clk_readl(&ad->idlest_reg);
                    if ((v & ad->idlest_mask) == state)

... and checked again?

                            break;
                    if (i > MAX_APLL_WAIT_TRIES)
                            break;
                    i++;
                    udelay(1);
            }

            if (i == MAX_APLL_WAIT_TRIES) {
                    pr_warn("clock: %s failed transition to '%s'\n",
                            clk_name, (state) ? "locked" : "bypassed");
                    r = -EBUSY;
            } else
                    pr_debug("clock: %s transition to '%s' in %d loops\n",
                             clk_name, (state) ? "locked" : "bypassed", i);

            return r;
    }

    static void dra7_apll_disable(struct clk_hw *hw)
    {
            struct clk_hw_omap *clk = to_clk_hw_omap(hw);
            struct dpll_data *ad;
            u8 state = 1;
            u32 v;

            ad = clk->dpll_data;

            state <<= __ffs(ad->idlest_mask);

state is shifted to its bit position, but it is never used below?
Perhaps one of the check blocks above should be moved here?

I checked git history and the original patch submissions, and even
the oldest submission I could find had the same logic.

            v = ti_clk_ll_ops->clk_readl(&ad->control_reg);
            v &= ~ad->enable_mask;
            v |= APLL_AUTO_IDLE << __ffs(ad->enable_mask);
            ti_clk_ll_ops->clk_writel(v, &ad->control_reg);
    }

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
