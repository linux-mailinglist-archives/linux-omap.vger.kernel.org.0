Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D503F216AEE
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 13:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728172AbgGGLAH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 07:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgGGLAG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jul 2020 07:00:06 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0975EC08C5DB
        for <linux-omap@vger.kernel.org>; Tue,  7 Jul 2020 04:00:06 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id 9so49328809ljv.5
        for <linux-omap@vger.kernel.org>; Tue, 07 Jul 2020 04:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KYp96ZZSsCMgncArOFXly9s4OIli23NE92mNWgNw4B4=;
        b=fTRhwpj/hU9LfJzJkArIDCDB06upW6a/C93yjE1K2cuse98pkQSzoA+sYMYtLUzpDf
         3bp4aEg2xQVvoYioUSQP0uJQAC21hPPGHss9REoOMCDiJiZ5xEBBCNpeUbFG4cvUniMv
         2TC9aOH9W8eK2nENG0Z49Gl/eIoFu9EfVU7YOlIOqdz27oL0+BEVXQstm2SudjiXJY3+
         27TOPF9Jb895pl5OdzMSly4xGJ0XrKuF6+ntvUXmtZOdDg2vGf6j8qqtWXaNTbOKnfRC
         k9bfaV65PgvLITOCEwGD9SdAmApIqfAx76iAQGVkmib6gjtNWscBDAyMLSGqGzdyvUTP
         y7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KYp96ZZSsCMgncArOFXly9s4OIli23NE92mNWgNw4B4=;
        b=s0BuQOmr+ZbTMd2uiv2X8zfxIl9dOKl3uHo0BL5Z6G6pPCGBcucHm7ftWQXtn9UYRc
         GQPI0qh8Ji+rSZoRcieIrJ5YIY4145Y51C2Ih0ld8zL0i9mxkSL3ptHGGHY1/igC/CBk
         VbPdX2y9zH+s03IZrr22lSrgEtxnTmHHXPmilMxIEgiVl4e7PBoCQW5qgLvfF1jFjxJZ
         0pBfSP66RyNYWuSAsTmx2rjdCE/I9lDdp/qd69Wh30oxFJNSOgwYDfA7kNyqk/QkBMJx
         CyCfUlL5stWK9+WwrQMLQJ3Bs3I/WkxhXGGZjqw2Turi6aOumSdmLP6SmRxrFQkNjhH3
         AOmg==
X-Gm-Message-State: AOAM5327ctUfKTZiN6vrlPWHmA1Stk5gNv/mzE+hVD57lMYHlMHnqH4S
        3LEoOhuEWd8frYIQ6xHD0T/bY4MOc1TRDGhjWtnswA==
X-Google-Smtp-Source: ABdhPJz/EbBwJ1T3GgvyKHSaJPDBjC/885l2Y1IY+hCrikFT6rUcrPXU9Ohp3fztPR4QHzpES5qUG955fZ1BVL9iXNs=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr13896696ljc.104.1594119604328;
 Tue, 07 Jul 2020 04:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200701013320.130441-1-drew@beagleboard.org>
In-Reply-To: <20200701013320.130441-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 12:59:53 +0200
Message-ID: <CACRpkdY3mUjczkJhV9BdZhUJGOgrbOMJnciBjOaPg6c9XUt8Ww@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: single: support #pinctrl-cells = 2
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jul 1, 2020 at 3:33 AM Drew Fustini <drew@beagleboard.org> wrote:

> Currently, pinctrl-single only allows #pinctrl-cells = 1.
>
> This series will allow pinctrl-single to also support #pinctrl-cells = 2
>
> If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
> pcs_parse_one_pinctrl_entry() does an OR operation on conf and mux to
> get the value to store in the register.
>
> To take advantage of #pinctrl-cells = 2, the AM33XX_PADCONF macro in
> omap.h is modified to keep pin conf and pin mux values separate.
>
> change log:
> - v4: squash patches 2 and 3 together so that git biesct will not result
>   in a boot failure
>
> - v3: change order of patches to make sure the pinctrl-single.c patch
>   does not break anything without the dts patches
>
> - v2: remove outer parentheses from AM33XX_PADCONF macro as it causes a
>   compile error in dtc.  I had added it per suggestion from checkpatch
>   about having parentheses around complex values.
>
> Drew Fustini (2):
>   pinctrl: single: parse #pinctrl-cells = 2
>   ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2

Both patches applied to the pinctrl devel branch for v5.9!

Please make sure not to create colliding patches in the DTS files merged
through ARM SoC this merge window.

Yours,
Linus Walleij
