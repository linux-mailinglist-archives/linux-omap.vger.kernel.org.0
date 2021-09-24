Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7699E417724
	for <lists+linux-omap@lfdr.de>; Fri, 24 Sep 2021 16:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346880AbhIXO5w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Sep 2021 10:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346922AbhIXO5v (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Sep 2021 10:57:51 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B1AC061571
        for <linux-omap@vger.kernel.org>; Fri, 24 Sep 2021 07:56:18 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id h129so13057405iof.1
        for <linux-omap@vger.kernel.org>; Fri, 24 Sep 2021 07:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BTzhRmtCWqSMLNXYgMz/A9yGJztHmzn9VR2FvTuT1X0=;
        b=SKj11i9J4weHpWL5gca5C27GtKyeqnzkCdtcpOIE6SIBamXV+/M7CCgWI59YoHaNnN
         iSF1u8VJNmzdE20M16uM0tZzJoOCJvjCiAKadITYS8Nm4YpI6rE0IFZKalF9NOxRcEoO
         HNl464XYupmzvQxjt3QsQLi35uS7yBRNytTbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BTzhRmtCWqSMLNXYgMz/A9yGJztHmzn9VR2FvTuT1X0=;
        b=NiB/DFRsBDMo5aMYLXl5jK39OCZrmddl4+x3of7JyTL33To7ElcsJjX1dkwPPDy2ti
         DZR+qwErRlkXXCka4VhAi+OHTf/Uv2DLyhZ+TsXx5OQHBBPrC7yGZbyvIEE1JyO36ddx
         DVAma+xEMJM+u4/nPfC0YUQ0s6LEFQhF+RRzPSymzUaiCgHIt0WLylJWsCNnbi8Z9mrj
         M/6pna6CcUqdcdFwx0khoNjpKmLOfqMpi9xilgj2PhKBm3zUHqxwMfjd7JYtxj4vxLeA
         UP6mEOA0CZz9ACX8qmvi3RDoL1q2AYAlnA4BUAtkyo+J/GiO1qL4NLbvD26Bk5vpHsM9
         wLmg==
X-Gm-Message-State: AOAM530Bwk6AMXawshFNid+q8x/5AcAJjFA4G12ZK6B66X4ZXHAcI7s4
        hsKQ+23vVeDAm33g8JQKPptdcfq4Z9rBJA==
X-Google-Smtp-Source: ABdhPJxKfsUFyXSSCuRfilNILgZ00kpN+UqE0weu1H0OlE01v+GBqH+OGdEUD/VbOwawvs8+K8cqfA==
X-Received: by 2002:a05:6638:2050:: with SMTP id t16mr9555859jaj.101.1632495377989;
        Fri, 24 Sep 2021 07:56:17 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id m1sm119070ilc.75.2021.09.24.07.56.17
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 07:56:17 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id q14so10671334ils.5
        for <linux-omap@vger.kernel.org>; Fri, 24 Sep 2021 07:56:17 -0700 (PDT)
X-Received: by 2002:a6b:3f02:: with SMTP id m2mr9047097ioa.136.1632495366689;
 Fri, 24 Sep 2021 07:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210914202202.1702601-1-dianders@chromium.org>
 <CACRpkdaTb4_UfFzCqw=fiAnQhHD+1sDDua529KdGQbgMVfjYBw@mail.gmail.com>
 <CAD=FV=VPgFRBLgOGvt4a4afDr80aQL64L7=H3kqeRf2ffiusPg@mail.gmail.com>
 <CGME20210924080417eucas1p209819b105dc64faf1f2a7140c5c1389b@eucas1p2.samsung.com>
 <874kaabdt5.fsf@intel.com> <68c3f798-a18d-fe8d-2925-2686716a985b@samsung.com> <CAD=FV=XEb-jx81inK8hGvdJeRqTLmmBKz7U-m+9=CHbNRSa16g@mail.gmail.com>
In-Reply-To: <CAD=FV=XEb-jx81inK8hGvdJeRqTLmmBKz7U-m+9=CHbNRSa16g@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Sep 2021 07:55:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7V0MLy9XeA=vb_dpMS6ZBKkrGS_dC8uMeAxOeok5C3g@mail.gmail.com>
Message-ID: <CAD=FV=V7V0MLy9XeA=vb_dpMS6ZBKkrGS_dC8uMeAxOeok5C3g@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] eDP: Support probing eDP panels dynamically
 instead of hardcoding
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-sunxi@lists.linux.dev,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Srikanth Myakam <smyakam@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Fri, Sep 24, 2021 at 6:59 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Sep 24, 2021 at 2:10 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >
> > Hi
> >
> > removed most cc, due to server limitation
> >
> >
> > W dniu 24.09.2021 o 10:03, Jani Nikula pisze:
> > > On Mon, 20 Sep 2021, Doug Anderson <dianders@chromium.org> wrote:
> > >> Pushed all 15 to drm-misc-next.
> > > ...
> > >> e8de4d55c259 drm/edid: Use new encoded panel id style for quirks matching
> > >> d9f91a10c3e8 drm/edid: Allow querying/working with the panel ID from
> > >> the EDID
> > > Hi Doug, Stan's reporting "initializer element is not constant" issues
> > > here that were discussed before [1]. I wonder what gives, you said you'd
> > > hit them on a draft version, but not with what was merged, and I can't
> > > reproduce this either. Curious.
> >
> >
> > Apparently this is grey area of unclear specification.
> >
> > gcc version below 8 reports error, above 8.1+ should work [1]. I am not
> > sure if there is nice workaround for older gcc.
> >
> >
> > [1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69960#c18
>
> So I think the only solution is to go back to the character-at-a-time
> version. It's slightly uglier but functionality trumps form.
>
> I'll post something today though it might need to wait a few hours
> before I can manage it.

I managed to squeeze it in before my other obligations:

https://lore.kernel.org/all/20210924075317.1.I1e58d74d501613f1fe7585958f451160d11b8a98@changeid

I didn't CC everyone here but dri-devel and LKML are copied so
hopefully if I missed someone it should still be accessible.

-Doug
