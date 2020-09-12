Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8587267926
	for <lists+linux-omap@lfdr.de>; Sat, 12 Sep 2020 11:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgILJ2P (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 12 Sep 2020 05:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgILJ2N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 12 Sep 2020 05:28:13 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C862DC061573
        for <linux-omap@vger.kernel.org>; Sat, 12 Sep 2020 02:28:10 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a15so14529207ljk.2
        for <linux-omap@vger.kernel.org>; Sat, 12 Sep 2020 02:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3+/cI6ELF81exg/RR6O6O+aVN5sqIX5r7pgGzHaDNpI=;
        b=vjl9bbO8iUlC2sz3imomb0O6hpjiO8gsClut6HK+gK0O4wRbxMumMVEOuympYxol7K
         y/Ise3AX8b8e3tzqXRxsmGtHKZmV4QDIVwh49vKCRFxmc3gmh4RNsxlTBww1NO2y70I8
         FfsHNexZKO4cQXN/66Cq33fg2FyFiGMQW+Rz9kGk9ZoNkd8c5jc8rUX3/evKM1JcqMvg
         W2WyAehcphSgR+YbsqIuAqow4T/2Cx1UgDUpGBp0mrg8rirA1BWEww5Q1wAcvR0s/E5X
         omLVsALi1566IgwJu0XUUU7ALSI7cAf5vz9ObTKrxDdIz8AY9F6FjFDcEtNsJDeejjzC
         j+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3+/cI6ELF81exg/RR6O6O+aVN5sqIX5r7pgGzHaDNpI=;
        b=VPo89AGtUnIhfiELK2AzuoFX67GE8L2RkiVDOPGOtE4x5+Pjpv+5kr5sA9pI81lEzS
         UhRjYSCSL9LqZY4qiDnXb/dI2efHc/b8DJXmYXehnIb/0wxf3xID2/62E0XO4iUcTssY
         zRBDatYuMt0Wh+Xm20JDgoQdAEA968/TkdsScr4VuFO+MylC8RY+B96JkH3SfNZ3fsbI
         95jhRuwJLQkOQkLoaPk9PG9gUjaaqhI/7buxk8SXq7xPb+n3rHgNNQXXSqT/CJN7PIZG
         1dMPUrnyIwHPDObGxRXneL5oyK4xfNXGyvSWf/hq7CVhlgxrjsGoi2M5ygPr/w1C3BbB
         twBQ==
X-Gm-Message-State: AOAM530FILM0+9kiAZ5f32aMRTCskgpZm5F1/wchtL3ROw/wWHCc+4uE
        +lM5uRr6Kx1bnDHFAF5qw2JAPNyfje8elPhnWfdz5g==
X-Google-Smtp-Source: ABdhPJxBsTNPv8rTOK3nTsl78tCBYvEXZdS93+fdtnacKEhcDIY4ugN8Nz58OFQx6JN7+eus6AgEBIfh+o+KwvT7keo=
X-Received: by 2002:a2e:4e01:: with SMTP id c1mr2035650ljb.144.1599902889267;
 Sat, 12 Sep 2020 02:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200827200827.26462-1-krzk@kernel.org> <CAMpxmJXbjJMgiTgpWokfeeuXjd-tuns8kq1T+Q+qwcxXvums_g@mail.gmail.com>
In-Reply-To: <CAMpxmJXbjJMgiTgpWokfeeuXjd-tuns8kq1T+Q+qwcxXvums_g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 11:27:58 +0200
Message-ID: <CACRpkdbA1L3BzQ8uxVmPjeZKG4z18x-6ZXD0cPWCeCpwUw2=WQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] gpio: bcm-kona: Simplify with dev_err_probe()
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Keerthy <j-keerthy@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Aug 28, 2020 at 8:17 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> Queued the entire series with all the tags, thanks!

Oh you already queued them, I'll drop them from my tree.

Thanks!
Linus Walleij
