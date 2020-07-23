Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CFC22AFE9
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 15:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgGWNF4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 09:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726493AbgGWNF4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 09:05:56 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5538C0619DC
        for <linux-omap@vger.kernel.org>; Thu, 23 Jul 2020 06:05:55 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id z24so6236134ljn.8
        for <linux-omap@vger.kernel.org>; Thu, 23 Jul 2020 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/FpACHDz7a5nGjx+ioBPQb3KC4um/vnAQ0sQ8picRFg=;
        b=jNJoSElRtW6TRlUUAFLNiJvnE4zx/7OVBF8askmtfvQai1P2CRuqKVL3nnvucgi+5H
         HFVnsBZ/G6+iTn37mqkSI0eMY6EdEbdMLlapOTRqEIS6Of3vUMx/DDQV8yFX+sdTrRTF
         pd5MdqyhstCYcD12CgoaEIYQqe4uvK3pdUeJ3SG8SjKiS8mm/Vwip41YPCPzU/VBaQJA
         IFDNqD4Hidhu1QyWhwZVUXvW3v46OWczFvre3KRVyMM424JwG/kuzXg7BOjwHaG9cANk
         fFGsKPUjcEiE2w/FBMPE8awwpczCqy2L9obZ7CVgOKEKMA+jBmrJIkwNmgRwyQAQtZYE
         oCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/FpACHDz7a5nGjx+ioBPQb3KC4um/vnAQ0sQ8picRFg=;
        b=AUnLCXZBY/Cqke97cbCbPtVf6sv68DHhH9K+OZ5wqCHkl8cFYP/Vemn5aBRUtNz/+X
         S37cCOMzcB2YCkLVfqCbzwxXY6SNd6qUHnRPj/vw+sEsVOG5ns6hkgzZGi+UepkbyFXQ
         iFWt7o2FPcWVsJNwLmTH2OluF8CE2tKwMYiWDzPiaILYh6YVsgsN8hwVeTWrSgELRRB+
         1+pmR4tMGA9ibI5+ek28+nTAYW5VAETkz87EdoPfdpGOom6I4W8rpXLtC0qTf0EUnGLO
         sWkqKEamEUCEF1xKjSb780gR+NpiBT/thfJAGt+zC1ExEXbsWmRW586wvspPYE+zz8DE
         GDSg==
X-Gm-Message-State: AOAM531pCk+mKO7eBDfmuDIJPNXA9Gsn5xBnu0q/mshFu15XhPUSPGlW
        823i0jOd7DCaj8F7ALzqk9ZGZ1Sp7Q3oQmRemLvHlQ==
X-Google-Smtp-Source: ABdhPJxfHkQizZ37pEG7DjUxGsmLG10G2QP4JxXEoZC9O52R1JG/5dcJH9zenEjR2Bk7BSxv3j8ALDBTNQ4lV7d6Kf0=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr1802676lji.338.1595509553155;
 Thu, 23 Jul 2020 06:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200722120755.230741-1-drew@beagleboard.org>
In-Reply-To: <20200722120755.230741-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jul 2020 15:05:42 +0200
Message-ID: <CACRpkdbqW4FkHx0sBrYEyvpUwrDnyEaMHT7hBbKzSa6URKhA8w@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: improve coding style for pin config flags
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jul 22, 2020 at 2:09 PM Drew Fustini <drew@beagleboard.org> wrote:

> Change the handling of pin config flags from if/else to switch
> statement to make the code more readable and cleaner.
>
> Suggested-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Patch applied!

Yours,
Linus Walleij
