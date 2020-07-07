Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435B5216CF3
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 14:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgGGMiu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 08:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbgGGMit (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jul 2020 08:38:49 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37782C08C5E0
        for <linux-omap@vger.kernel.org>; Tue,  7 Jul 2020 05:38:49 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id f5so33840801ljj.10
        for <linux-omap@vger.kernel.org>; Tue, 07 Jul 2020 05:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ALRzdTLy834Js6tTsVkyDFm5RYrKEAntVTYaxszaiDQ=;
        b=aLfGXKCbdw5RslyT1YhWet8LBrZh/bNQOtTk/PwK3iEuA6A5iJDWcvk1bkngR6dszE
         S17yZdv7HMYGw8iriZsrT/yS2o3URiwMkIbC68bx4k64nYHX1LTL3DAc0ovy67QinFHe
         Uy81/Joga+AfxTgbUzy21gDXBYdXYpTgwH7/5PnTVG39MfOI13n8Ajr/CE6o8bZE0+Im
         noIImb5Ap+OC5jGxyvqFPMgCGmp6IiuCKNXWJsN2AF3OTk6UwEf+z95mLA3tKx7I8VgR
         WmMAUvK+o57Vm/BemnxhxxeiymNsBmztfjhKRAwEhVrNM7EyxloVWpW/uxCs7cH/WEKg
         EW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ALRzdTLy834Js6tTsVkyDFm5RYrKEAntVTYaxszaiDQ=;
        b=HTdrixQvzHx2uSXLWD2J+ekhSHt+eZs63gqWCc8IYhgKvibObFTs9Mp7QvsvC16N9u
         ieNZm6v4j5uR0knwWhLcS+85scDzHWCh/7v0uvILrUXPrKKHi+PSuoPIUCquvQOxy7vO
         cZw0w3r+aEa24tHBuC+/jGtWP6dDnZplkgtenULnpxDCGjCL6w1LSbqXCdxOXMdj2xyB
         6bYOO//2tZf/gmvJffeZ5VqPnQ0ZLyRTWst+q4AB8H5X6IdtIAV3HI/dn7djURA02fFl
         Uog4DaM2k6K+/x23OL6q3DjDTR4Zq/NqJFmKbeebi743oT/XqoEBWaqL7YBR2FfcMyR5
         hrkg==
X-Gm-Message-State: AOAM531D6o4zm/EU2a6DKZhmpnQErTRnPWH5CMgZz6O3bv1dhWtxcGDh
        aWwttJP+5OSW+FR467sQ4xdfmQVvxbbuNRSa0d6UWA==
X-Google-Smtp-Source: ABdhPJwxMSAmN1uyPf5LNJGh5vCr3v5HdzAsOO+vaOfhxHwx+Q4+PAvi5tR60rOLYyZ3HfYO4u2xvmlGWU2veYJflBk=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr14155071ljc.104.1594125527565;
 Tue, 07 Jul 2020 05:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200625002736.GA24954@x1>
In-Reply-To: <20200625002736.GA24954@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 14:38:36 +0200
Message-ID: <CACRpkdYze_6cM0R=rr7RF8h5WO4GoCcz4=K1_XLt0PJNxCYtbw@mail.gmail.com>
Subject: Re: gpio-omap: handle bias flag for gpio line
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jun 25, 2020 at 2:27 AM Drew Fustini <drew@beagleboard.org> wrote:

> Tony and Linus -
>
> I'm hoping you could give me some feedback on this approach. My goal is
> to allow a userspace library (like libgpiod) to be able to set pull-up
> and pull-downs on the AM3358.

I'm lost on any pinctrl-single specifics, sorry... Generic questions about
pinctrl I can maybe answer.

Yours,
Linus Walleij
