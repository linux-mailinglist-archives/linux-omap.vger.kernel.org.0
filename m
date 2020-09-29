Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5755C27CE19
	for <lists+linux-omap@lfdr.de>; Tue, 29 Sep 2020 14:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgI2Mva (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Sep 2020 08:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbgI2Mv3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 29 Sep 2020 08:51:29 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D894C0613D0
        for <linux-omap@vger.kernel.org>; Tue, 29 Sep 2020 05:51:29 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y2so5326024lfy.10
        for <linux-omap@vger.kernel.org>; Tue, 29 Sep 2020 05:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ptsriY4LqRV3GJ566RNPaiV+XmYiNhIg946yy5oC2g=;
        b=C1oMWXhl/V1we8SiQv7MD3uFufVOKUTx1KFYS3ZI3EMF5mo4zflrkl/KNYXDL7r9Es
         cFSk/006NTDo233joIyrpSe3WP/glDonquZa8lFyPbzHO5E9d3WRe5bWA0aQPHy9G2d3
         CEGYDADd//aSSrN9Apffy5e0CZZArqxDe0t5Uk/MS+2HjOwUVsbW1xoL9plDoQ18dgD0
         pmaCC9xpy/Q79VICJs1PIohTlMCuCIkdgrgbD5w5723sAQVXiNNVBT3WuuN2x1mt5pgr
         zjtpTKBdj9DCIV5+jHZiGAGL9xlc7tQgITfuuZh8N08Kp1w07y96lBKAKzknr7TI6hoP
         MKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ptsriY4LqRV3GJ566RNPaiV+XmYiNhIg946yy5oC2g=;
        b=KbeOSqbeG1aU1X/4J0zWV/Z8oW/uXrCU8eOYpf3OV1EQQJiTT1eSap+T29TKDX/njp
         5lp4NY9q6Yo6/2PTuDHJ8rh+JzuspClK1wVabjorPEWJivGySLDVEep/DqiZji0T1PFZ
         m18Xl/C4St0TWHnE5Q+sQFJ/Soyfm90ooa0r4JY1NjVb7qH97Qu3kuBq3xwQbW7grNE4
         Hd+GJp5yURbpA954CPGx3x0EMwWximnMUyEr8QN3x6q6TJMVdET7t9bTOpRvPxfdVxSt
         5/qbk5fTwdaQ5fNDInUCXmVX11CP0YDA4TGCZ+qLZkIfi5qhisSN7tNugICii0PjmNkn
         6XZA==
X-Gm-Message-State: AOAM531OIG6KB8xoEaWy1fs86LWhEo8BRRnwfsqLtcYnfKgPJKqZ5jxD
        rOaeozG6qbx6t2kk4/wPoWbULr63SaBsoKJk3+7nTdSOA6Njeg==
X-Google-Smtp-Source: ABdhPJzAklLFWTOhXE7N9aEIT8GTpcr3Umi0D1/nm0zTd6rrhgvTwNP0yZm6xyWGCQSyOiDqLPaAZ2G3phObiGG1cWk=
X-Received: by 2002:a19:520b:: with SMTP id m11mr1033290lfb.502.1601383887479;
 Tue, 29 Sep 2020 05:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200913210825.2022552-1-drew@beagleboard.org>
In-Reply-To: <20200913210825.2022552-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 14:51:16 +0200
Message-ID: <CACRpkdZXu9g_Rq7707-6hXqPVfbxPBcrnR8KwLm+zOgS_EabAQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: check if #pinctrl-cells exceeds 3
To:     Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Sep 13, 2020 at 11:17 PM Drew Fustini <drew@beagleboard.org> wrote:

> The property #pinctrl-cells can either be 2 or 3.  There is currently
> only a check to make sure that #pinctrl-cells is 2 or greater.  This
> patch adds a check to make sure it is not greater than 3.
>
> Fixes: a13395418888 ("pinctrl: single: parse #pinctrl-cells = 2")
> Reported-by: Trent Piepho <tpiepho@gmail.com>
> Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Tony, does this and the other patch look good to you?

Yours,
Linus Walleij
