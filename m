Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E749C527C1
	for <lists+linux-omap@lfdr.de>; Tue, 25 Jun 2019 11:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730669AbfFYJSj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jun 2019 05:18:39 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44910 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730606AbfFYJSi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jun 2019 05:18:38 -0400
Received: by mail-lj1-f194.google.com with SMTP id k18so15479079ljc.11
        for <linux-omap@vger.kernel.org>; Tue, 25 Jun 2019 02:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t4qhaTHJZ+3VBU1sVx1P1bcNOnkqcH9GEq/1NAbRuaM=;
        b=dudxju8wkw9TnDww1MEY+prohp3emhDrV6fkIsizGs9ivSRezr09XAmqfYjzhFzVMU
         M7dAzWcIrqssTYQ+ntjda0GlaqnCFf3x8MqRLrGBB2pELALKPgRLTC96hz/QGoV5nGP3
         vQ+v+HCwhp3r+tZpxQ5nVhn7UVTGXadDPrevIgF0bafpI5g85m1kUYlXK7xsxEZGebTu
         u/CEYDoE6RcP+5AtgX3cltmInNUs7FXhX761Rm9Wk9qS3//cZYLbP84TOJGFDG9y5lOn
         Z40GhL86T6fir5q17T6MJR/rukojQMoAcghGapd2Wa8oQLWJvjHMdmsR6ogv9aMnWXOD
         h8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t4qhaTHJZ+3VBU1sVx1P1bcNOnkqcH9GEq/1NAbRuaM=;
        b=GfShvxvLPczO/eFZXeenEY0ElT63v0qyilFTRlynGCDEHDfKEN+ycndql9EBnsB98+
         vIFJvefXsQRZda+N78bcnPGMNRj0QVwZypARUMSnrAsU2mc06wAmfHRch7vEn8s+CKku
         yos6VNtpbah4YcN02HDY7pF6zN3R2xgbh7HlEfOgltYRghDzhu8Dd6mcm5YtMPv3StOR
         eVauL46s5kCzpwzKZPD2r38sS4/F/0U2U1Uungp9D6EBD8nk+8ZwmQHsYNJE3PNyetx+
         5GTG4Xkahy1F7P+fxha12tXmO5YvJypbhPMk0rGR6JTZeDEv1jY1iIHkYGPr+pnca8H+
         ZvzQ==
X-Gm-Message-State: APjAAAXuyAu+pWx5yGNeSmz/CvDRtaa0hxQVA1AuyDGBf7VE7DPJxmwL
        AsR7WBOlmU/iVP1vImwjtRilSaWjnZFq/IS+zWM5vA==
X-Google-Smtp-Source: APXvYqzvk2RCfrRnXaXWwBrZIvYLYyUWEsxMZVmaEfW91r8is6s4PyLGcy8jnjPFrzrLe73W09Y89A9lRRIfkn3eSFk=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr15217716ljs.54.1561454316621;
 Tue, 25 Jun 2019 02:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <1560796871-18560-1-git-send-email-info@metux.net>
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 11:18:25 +0200
Message-ID: <CACRpkdYQXFd5q+k8aKWKK5krzq0KpCmo9fsUW8Dx3jHq1LHwhA@mail.gmail.com>
Subject: Re: [PATCH 01/30] include: linux: platform_device: more helpers for
 declaring platform drivers
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tien Hock Loh <thloh@altera.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-tegra@vger.kernel.org, patches@opensource.cirrus.com,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 17, 2019 at 8:41 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> From: Enrico Weigelt <info@metux.net>
>
> Add more helper macros for trivial driver init cases, similar to the
> already existing module_platform_driver()+friends - now for those which
> are initialized at other stages. Lots of drivers couldn't use the existing
> macros, as they need to be called at different init stages, eg. subsys,
> postcore, arch.
>
> This helps to further reduce driver init boilerplate.
>
> Signed-off-by: Enrico Weigelt <info@metux.net>

You need to send this to Greg as device core maintainer.
Possibly to Rafael as well, he did a very intersting rework
on device dependencies with device links.

While in general I agree that this diets down a lot of duplicate
code that we have done the same way over and over, there
is the issue that we don't want any drivers to do this mockery
and instead use deferred probe and ultimately just probe in the
right order.

I think device links were supposed to fix this up, but it indeed
assumes that you know of these dependencies before you
start probing the first driver, and often you do not, unless the
hardware description explicitly encodes that. And that is one
big problem.

If we should do this, device core changes must be merged or
explicitly ACKed first.

Yours,
Linus Walleij
