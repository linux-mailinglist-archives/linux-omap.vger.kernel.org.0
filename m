Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8224F466F55
	for <lists+linux-omap@lfdr.de>; Fri,  3 Dec 2021 02:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236943AbhLCBzO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Dec 2021 20:55:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245290AbhLCBzO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Dec 2021 20:55:14 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A368C06175A
        for <linux-omap@vger.kernel.org>; Thu,  2 Dec 2021 17:51:50 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id v30-20020a4a315e000000b002c52d555875so515830oog.12
        for <linux-omap@vger.kernel.org>; Thu, 02 Dec 2021 17:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+aU1FZVep5hNwcFj6bmAba50FjRI/ltWIZ16DYNnIGA=;
        b=N7OF2583fEDmizbOmvRYnkpfZT93YEBncq9hnq85jlidjhoMePMAp06+j5M69LuaPh
         qsId6+csYsMtmOeURg6xkLIAjj5OBVfhBZu7FArYKUzlsBWl1xx+GkYLXIQcD07l3yNI
         gz4oeJfAAB/rn6T3EuqRD8KkfgLb9n9d+uw80SM5mg3iGlJdouJpirSJ3r74iti2rkSJ
         Q/TOfHzhFo2SAEjlDox/So7yxUh8use4aDmV4kGPgMha3TvLysEWDHRNxIWnyKUZS/hl
         YKnlXCJQj28b9plcwHfb0UkriKD+Qdvi1/2ALKZSAiEnMkQNUiSuFxIZi6tso2o5ezPm
         hCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+aU1FZVep5hNwcFj6bmAba50FjRI/ltWIZ16DYNnIGA=;
        b=wIkRQUtCPvRTZvhnjkOral2PxtV3AioRzaJ0OhM8wtp9Dd5H/NZ5ibq54hF/zrm83R
         fEt0d9ViKfY9jrKbm+sjnv5rZtkauNrusQLRDVmY89kUdx2zDPaN/MP8NLv1HCBH6hRQ
         TkW9C3UzaHoEIDfoCZ4en33G+sfb8jjrsLlcZmpx11LldDd9B8KwARE/o2jbyeLlzxvh
         i7l8y99Sss2lMHnE9M/+bbE5hKj6DWkXkObtt6FQBn9XSw3sz6KEmrVeLlyZpyKdvJ7x
         Mq8ynfmT1LespqQWVlHWKjO9hLE4fOQz6uMMd1doSBJv+lfvT4EHJleOJNKPo6KmMob8
         uYRg==
X-Gm-Message-State: AOAM530Ynoj97NFr1fLE3IjZa+SIAIuMA+ktop4KnxNiEK6LUWQz3orO
        B6rUK+neq4aW7EpEpfRJsd4TzJ4rnTXrRuHibjQkYQ==
X-Google-Smtp-Source: ABdhPJy+E2enGXW2BZTWyy52ObOiGXworrn7TaAu700osVmrszldA1sRllG22o2QwrneHsnoXpIe0ViKVme+U9Asy2A=
X-Received: by 2002:a4a:e155:: with SMTP id p21mr10809521oot.84.1638496309854;
 Thu, 02 Dec 2021 17:51:49 -0800 (PST)
MIME-Version: 1.0
References: <20211202222732.2453851-1-swboyd@chromium.org>
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 3 Dec 2021 02:51:38 +0100
Message-ID: <CACRpkdbDNYroj=RvxRhffiGLKSHD=1+LNUGpxf7bxt2rzXrMkw@mail.gmail.com>
Subject: Re: [PATCH v4 00/34] component: Make into an aggregate bus
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Chen Feng <puck.chen@hisilicon.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Emma Anholt <emma@anholt.net>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Inki Dae <inki.dae@samsung.com>,
        James Qian Wang <james.qian.wang@arm.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Joerg Roedel <joro@8bytes.org>,
        John Stultz <john.stultz@linaro.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-pm@vger.kernel.org, Liviu Dudau <Liviu.Dudau@arm.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Sandy Huang <hjc@rock-chips.com>,
        Saravana Kannan <saravanak@google.com>,
        Sebastian Reichel <sre@kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Takashi Iwai <tiwai@suse.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Will Deacon <will@kernel.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Vitaly Lubart <vitaly.lubart@intel.com>,
        Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Dec 2, 2021 at 11:27 PM Stephen Boyd <swboyd@chromium.org> wrote:

>   drm/mcde: Migrate to aggregate driver

This also works fine after the patch series.
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
