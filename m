Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24AB41AC0AB
	for <lists+linux-omap@lfdr.de>; Thu, 16 Apr 2020 14:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634862AbgDPMEA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Apr 2020 08:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634695AbgDPMD4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Apr 2020 08:03:56 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A8AC061A0F
        for <linux-omap@vger.kernel.org>; Thu, 16 Apr 2020 05:03:55 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id m2so5365067lfo.6
        for <linux-omap@vger.kernel.org>; Thu, 16 Apr 2020 05:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o670ErblNjXwLmVYEfpf91xjkotnH6/uPHwmnEnshmI=;
        b=T7hOq5vMcO8u8QOFQRpuSFYa2mgJc1T47DhIMgZsV1yewE0TJ9HfdSUeqAQLNA/Zir
         M8MCa50vW9VZfxqjHKEY7yGU7KMieeS4tpb9nmsG8XCcpOiCz38aezWClrX7vtgDlLRn
         CqOrwpZDMNyKjHR6d6JxSr01EiaWzVLBywiV1KzhrVPrAdL3O8qd2CUy2BcXeSD+0emU
         dxxF/rLiT1jnvoF/80sgewcUYpPUvxZt01A7DNgjptwkfhbJ26r6JhxkkXag6ljzjWpq
         ta7DHxhmuyv86JiZoI8OgHkborDWJMr1Znk11uROgYyBGdL2xmdn8D+8Sq5aqDVeVX9b
         3u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o670ErblNjXwLmVYEfpf91xjkotnH6/uPHwmnEnshmI=;
        b=s9NP8TyTqANoslqV4FJeaj7Srad+YCksVwiymamVBcf9Ou5olj1KcU2y3oZbIAtl8p
         KOQRVuccF17mn84VPZ5ODh6Vf5J41NJkk2KZrdLOGXos9Dr2IhZYemiYJzGVp8pU+4o3
         rU24U59ZhmrEQPk8/7uHIZia7diuKRat9k/u5lqm9g+92iacJ0kE46zoPDIelHilQc0n
         AVTK1yRNtNi+25AxAVjUotfCqXPhg8S3nQMl84E7bipU6feHAShydvggdLknTq1hKSjz
         27UDHU8JCo03pH5sjyJ0Cr8dQw87qbD4j7NRerqu9/kFUilS0iFotOb/Y/kWgk7XP2me
         Es/Q==
X-Gm-Message-State: AGi0PuZa22kGHzlJGG7oGVCdFNuYBc+r92bvZKm8cOKMdkoyGCpVfl5S
        ox11l852mjLTEpR+zu43QGR4Q4LPO2b1sGOTOepuWQ==
X-Google-Smtp-Source: APiQypIK2uLfJGQ1ZATASJZHqPMrNJqaZjhcLiPjTVmrBxee13OJdf7e1BmxQ41P0mZKgKOa8lbi9SM1JzyVDj7V6W4=
X-Received: by 2002:a19:cb41:: with SMTP id b62mr5955353lfg.21.1587038634346;
 Thu, 16 Apr 2020 05:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAEf4M_Du6Egn-3nZHtSnMMwohc+-DyEdtWU5DqSJi71+nDthFw@mail.gmail.com>
 <CACRpkdaPoMGZ7jGh6j4dYexx+qCcoMQ37vS7kbpf=3TtcA9zQQ@mail.gmail.com>
 <CAEf4M_B_sxOiKFnEVUrx00RE2MaMA98LpijNhp0EVY11eRAXHg@mail.gmail.com>
 <CAD6h2NT840zMfwaJatfKzai8QjZEQmF5v0xgE+9ngSJJ+Qy+6g@mail.gmail.com>
 <20200413123921.GA32586@x1> <578a51c3-9cb4-91f9-4735-c512bf75553c@ti.com>
 <CAOCHtYg=rM_zP6Wr3bWKfvGpeK7sXLj6GLN3DXSh8JgfqDTcCA@mail.gmail.com>
 <db5e49dc-41b4-2ba5-87b3-f345749d7984@ti.com> <CAOCHtYgNH-OUWdKgKLr7U8Zy2OZb=P9Rpsv4mFii+VwU7h-vGA@mail.gmail.com>
 <20200415233712.GA16167@x1>
In-Reply-To: <20200415233712.GA16167@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 14:03:43 +0200
Message-ID: <CACRpkda_upTeRn7xT9LuAkVKAf8LxUmQJJbVWhOoq+4zyoxfsw@mail.gmail.com>
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
To:     Drew Fustini <drew@pdp7.com>, Tony Lindgren <tony@atomide.com>
Cc:     Robert Nelson <robertcnelson@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Apr 16, 2020 at 1:36 AM Drew Fustini <drew@pdp7.com> wrote:

> Is there no way for gpio-omap to call into the pinctrl-single backend to
> set the bias bits (PULLUDEN and PULLTYPESEL) in pad control registers?

Mostly a Tony question I think, but the single pinconf_ops call
pcs_pinconf_set() which is pretty straight-forward.

Have you tried modifying omap_gpio_set_config() so that
it accepts these configs and just calls down to
gpiochip_generic_config() for anything that is not debounce?

Yours,
Linus Walleij
