Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98DB542BF9D
	for <lists+linux-omap@lfdr.de>; Wed, 13 Oct 2021 14:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbhJMMQt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Oct 2021 08:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232645AbhJMMQq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Oct 2021 08:16:46 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4191C061570
        for <linux-omap@vger.kernel.org>; Wed, 13 Oct 2021 05:14:42 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id t2so7632245wrb.8
        for <linux-omap@vger.kernel.org>; Wed, 13 Oct 2021 05:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=dMRaftnF9U+W3ku1B/GD71FJ+aEgoWgdI3sg+irCBSU=;
        b=MhciuyvSk02sHng4PyOacoSMmXkEirv4ROaG/YFOPm3C/PGs4IaqJa0KzfxdG/7GZy
         j0erLuzznKPfPq1SooRZKFK4Ph0eeQeU9mpXHHT+jpz7xE3bhD8wZpm0IH5MWOlJV1Vs
         JSjS/+eukQ+3NvBveep9Rvje8X5OHCWQU9oNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=dMRaftnF9U+W3ku1B/GD71FJ+aEgoWgdI3sg+irCBSU=;
        b=pSJYNIirckFFQ3aOWED6hIDGXghHkRqGJF/wFHfh1LVnk2ekCpKPlFHFy5X/UNtNlH
         7QErto3xHDDiL1ldScSCOfLgUNnLCjnVVTXjQ/cQdmMifmADvS1oCVa6pqrcYBkB4KIw
         lf9WTvLAGfu8vh712h3wcbsG8d87u6LIiKBsxUvPpieffaAQW1VoRdB2rih5yl7RU+Uj
         9H/gzTRZq625Ceq9/oNlsir24/CxB0Zq3YN5IMZI3sFj6LJfnzYeoH3JlQssL/XbRhTg
         UDSxFKV8VTasmRe0lPgPmee7vWa0wU3Pbg55HjLOYA9jy8WC9CMleSVFBU+5aMmK7x1i
         u70g==
X-Gm-Message-State: AOAM531HpwHmuea3buvrWzP8wyDnr1uQPwvDYH+N7OZFw4kwdWC7ZOj7
        3UBF0EYrTkWhzuEXfT38s5c2qg==
X-Google-Smtp-Source: ABdhPJwjQFtFTLxMhkElGP+tQ3IDjeuJllYWlfjQHSU4ZkxQZ996sxB4SGM/CwV1ziLNNbEonMsSKw==
X-Received: by 2002:a05:600c:4ba9:: with SMTP id e41mr12535688wmp.70.1634127281038;
        Wed, 13 Oct 2021 05:14:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q16sm13619647wru.39.2021.10.13.05.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 05:14:40 -0700 (PDT)
Date:   Wed, 13 Oct 2021 14:14:37 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andrzej Hajda <andrzej.hajda@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
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
        linux-pm@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
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
        Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v2 00/34] component: Make into an aggregate bus
Message-ID: <YWbNrfxQ0IqV7vsO@phenom.ffwll.local>
Mail-Followup-To: Stephen Boyd <swboyd@chromium.org>,
        Andrzej Hajda <andrzej.hajda@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Chen Feng <puck.chen@hisilicon.com>, Chen-Yu Tsai <wens@csie.org>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Emma Anholt <emma@anholt.net>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        Inki Dae <inki.dae@samsung.com>,
        James Qian Wang <james.qian.wang@arm.com>,
        Jaroslav Kysela <perex@perex.cz>, Joerg Roedel <joro@8bytes.org>,
        John Stultz <john.stultz@linaro.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-pm@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
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
        Takashi Iwai <tiwai@suse.com>, Tian Tao <tiantao6@hisilicon.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Tomi Valkeinen <tomba@kernel.org>, Will Deacon <will@kernel.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Yong Wu <yong.wu@mediatek.com>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <5d3f4343-da38-04b4-fdb9-cb2dd4983db2@gmail.com>
 <CAE-0n50s_cOLA0xRa8mmUS2Nawd5X7WiQE3PvOLHu+i=hE3Eow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50s_cOLA0xRa8mmUS2Nawd5X7WiQE3PvOLHu+i=hE3Eow@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 07, 2021 at 04:46:22PM -0400, Stephen Boyd wrote:
> Quoting Andrzej Hajda (2021-10-07 03:16:27)
> > Hi Stephen,
> >
> > On 06.10.2021 21:37, Stephen Boyd wrote:
> > > This series is from discussion we had on reordering the device lists for
> > > drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
> > > the aggregate device onto and then we probe the aggregate device once
> > > all the components are probed and call component_add(). The probe/remove
> > > hooks are where the bind/unbind calls go, and then a shutdown hook is
> > > added that can be used to shutdown the drm display pipeline at the right
> > > time.
> > >
> > > This works for me on my sc7180 board. I no longer get a warning from i2c
> > > at shutdown that we're trying to make an i2c transaction after the i2c
> > > bus has been shutdown. There's more work to do on the msm drm driver to
> > > extract component device resources like clks, regulators, etc. out of
> > > the component bind function into the driver probe but I wanted to move
> > > everything over now in other component drivers before tackling that
> > > problem.
> >
> >
> > As I understand you have DSI host with i2c-controlled DSI bridge. And
> > there is an issue that bridge is shutdown before msmdrm. Your solution
> > is to 'adjust' device order on pm list.
> > I had similar issue and solved it locally by adding notification from
> > DSI bridge to DSI host that is has to be removed: mipi_dsi_detach, this
> > notification escalates in DSI host to component_del and this allow to
> > react properly.
> >
> > Advantages:
> > - it is local (only involves DSI host and DSI device),
> > - it does not depend on PM internals,
> > - it can be used in other scenarios as well - unbinding DSI device driver
> >
> > Disadvantage:
> > - It is DSI specific (but this is your case), I have advertised some
> > time ago more general approach [1][2].
> >
> > [1]: https://static.sched.com/hosted_files/osseu18/0f/deferred_problem.pdf
> > [2]: https://lwn.net/Articles/625454/
> >
> 
> I think these are all points for or against using the component code in
> general? Maybe you can send patches that you think can solve the problem
> I'm experiencing and we can review them on the list.

Yeah I think this is entirely orthogonal. If you use component, then
component should provide a way to handle this.

If you use something else, like drm_bridge or dsi or whatever, then that
part should provide a solution to stage stuff correctly and handle all the
ordering.

Now there's a bunch of drivers which mix up component with bridge use and
hilarity ensues, but since there's no real effort to fix that I think it's
toally fine to just improve component.c meanwhile.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
