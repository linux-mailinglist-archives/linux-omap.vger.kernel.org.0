Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E60326793E
	for <lists+linux-omap@lfdr.de>; Sat, 12 Sep 2020 11:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbgILJlq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 12 Sep 2020 05:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbgILJln (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 12 Sep 2020 05:41:43 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36361C061786
        for <linux-omap@vger.kernel.org>; Sat, 12 Sep 2020 02:41:42 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id q8so8339788lfb.6
        for <linux-omap@vger.kernel.org>; Sat, 12 Sep 2020 02:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UZU/zGwz2ovaC4pIMVMr+MCjpS2iaz8WzZBqdPPj3tI=;
        b=eZokzSMIQ7hJR8bFXNYglm8tUxXHklQVG1x93I2xiIKCW5A8fVxmdyT6LLArph/LNW
         QgYUy/dHVGIKPtUkTfQlGdfjSY8sa59lPD/d3tzo98w1II/rDnuzqANq6pBEOzaZpqeh
         BGq9tuaLi6LrI2zcyNLooPoSA2C+zmi+AQ0ev92rjWK0hINqDfeAwnBKrRcD2EgYhOzF
         TecwnJFY3Tw1S73W5qV+CdjGOX0IxzRUVuGkdG9RDRbTY5vbmr/kWyyTr+dngENvs0cy
         Sjdan74x6z2WafgtXy94uaA5Ibf22ntO2PBUwIGlycFidvOcLWs+NX71KQkGxcTG9xYD
         H8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UZU/zGwz2ovaC4pIMVMr+MCjpS2iaz8WzZBqdPPj3tI=;
        b=qqXUyqooG7wVP/RPiXKorsjOlOAnR5zBMpfGfYSXAeFTd3Hg7W5dr3nk3GeJt3Abo9
         V0PKv1afFfuZE/JYf4l3NQkP2Fv9bmBl6GdQI0Uy0kI6jL8FY2LI2z0R1PX28x0IQ6Z7
         GAhO6TwrW4gyiHQyZKRApobVfFAdSBXbJDD4UPeTR5lxj3PrjusUQynejjk5frpXWXtr
         xT2ctytzRKKMs6iLTz0VyGHzaxjjs4ZuMh2PwR0FsDNPc0z0yCdcMAEqJ20W6bvT3Oq/
         LzymmAIG6ma7HLCHGhktZDA9ZL6uCPC3fbvTieWb4buvugx21WT1bb76Yzaw54414Zsv
         g9/g==
X-Gm-Message-State: AOAM530qmroiB8IuQwr7KKMj0b5MDKKwuhg6PFLCi654I5Rfst6/34WD
        U9f+NUo6X8K1GnBSq0TFFDLJVVn7kysnIswC6KzzaA==
X-Google-Smtp-Source: ABdhPJy4kP0f3CQ9PdpoZfSsR1ZDkXvseTxFo2z9nh5ohEpgFep9TTkvnaVgSqHW+XxIx3RTqvEqvy8k4mH5h5PDXj4=
X-Received: by 2002:ac2:4c11:: with SMTP id t17mr1628328lfq.260.1599903700539;
 Sat, 12 Sep 2020 02:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200829094024.31842-1-krzk@kernel.org> <20200829094024.31842-5-krzk@kernel.org>
In-Reply-To: <20200829094024.31842-5-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 11:41:29 +0200
Message-ID: <CACRpkdaR5jao0hMEUF9KC4EHQwOVZNsd+Up8U+MMKFBTYqNReg@mail.gmail.com>
Subject: Re: [PATCH 5/6] ARM: dts: dove: Fix PCA95xx GPIO expander properties
 on A510
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Aug 29, 2020 at 11:40 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The PCA95xx GPIO expander requires GPIO controller properties to operate
> properly.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
