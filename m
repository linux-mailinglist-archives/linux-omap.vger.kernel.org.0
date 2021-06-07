Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A5639D589
	for <lists+linux-omap@lfdr.de>; Mon,  7 Jun 2021 09:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbhFGHFB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Jun 2021 03:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbhFGHFB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Jun 2021 03:05:01 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDBBC061766
        for <linux-omap@vger.kernel.org>; Mon,  7 Jun 2021 00:03:10 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id z22so4785019ljh.8
        for <linux-omap@vger.kernel.org>; Mon, 07 Jun 2021 00:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=byysuq31NqSJ/wEAfWvATOeFVnLZyU0dDvr6U4G7ixg=;
        b=Wie72tEOsYTmHR/0QEli2bJx5rwQj+1aaleOBHWQwtRfswtxcPhWeKH8ZcLEQjm/rL
         3W0YPHwk9EUC2xgALLXGB3mdjGsd0YkNGlf4ZxcdikYP3X0XfJWDROtxh+vUmuLAXsal
         H37vAr3qlgjFjOHsqWc/ElO4gzkorRWiDD5hgUq82zoCOlDeAPo4UEg1goNRB6JXnZmj
         0KYssOGzHy6H6YviXqocjnIhbcUZDGuJyMsLwO5G4JEJLursqP3AW1UbtLwIJB3O3Yrp
         kR9vk/Z6SV8/DL1AnUe9NVBSyE59BNVoel5OhJmyraDrYEvTUP2unhWbMZvtEwa6hiVw
         J9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=byysuq31NqSJ/wEAfWvATOeFVnLZyU0dDvr6U4G7ixg=;
        b=Gbo7xVOAW7k9Pkk+1gdstI8rkZP0+2oRHqp2p0Ov9Uo6nEhzXMEcq1DjdzXavH7L5t
         VUSwH5UeMPvXiUji20tUGHRpsStG50RUohtDElrobrr5CHru26m6T6SUOXHG5L0JHg1S
         l7gNiUIxtv7A+FvyNAPjLU+FiBmBeNgn1Zyor3BJOvdNvb9Nd8Rt9Ygs2eYnwOhAUysP
         79EBFT59OYgiBJ1c99HkIdAmrkHbjbirpbGFVIoNt5HzaiqcmD3AJ/d1CVQQh91QEdPr
         xp4JnfstEWWNjJr/38ntAQzX16Db8gpdDgPtPI996gOhLIPkzgszn9MZfLoCBOcI00d0
         R2Ug==
X-Gm-Message-State: AOAM533nAfHatZQGcRPUbIYpYQkKCGRbQ6tDjXvs+FcbYdzCbLiJO0AH
        629aTNeqdp3iZvfL5lvSW0rQZha/Q4fgrzShgC89vg==
X-Google-Smtp-Source: ABdhPJwGqQGTe/jVvXVpdtfh4ldNGqHyMFsr3xX2w/aRd0jDvuSNNY54PMchcbawxwh8sCOROuRyKq5JfAzFnY97i44=
X-Received: by 2002:a05:651c:1057:: with SMTP id x23mr13380683ljm.467.1623049388829;
 Mon, 07 Jun 2021 00:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210602150420.18202-1-dariobin@libero.it>
In-Reply-To: <20210602150420.18202-1-dariobin@libero.it>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Jun 2021 09:02:57 +0200
Message-ID: <CACRpkdaSYrrwwn+nXj5M+zvgxTBnspdMgQbbViAFV7TpaUPkAQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] pinctrl: single: config: enable the pin's input
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jun 2, 2021 at 5:04 PM Dario Binacchi <dariobin@libero.it> wrote:

> It enables / disables the input buffer. As explained in the description
> of 'enum pin_config_param' this does not affect the pin's ability to
> drive output.
>
> Signed-off-by: Dario Binacchi <dariobin@libero.it>

Patch applied!

Yours,
Linus Walleij
