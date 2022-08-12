Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7F8590B44
	for <lists+linux-omap@lfdr.de>; Fri, 12 Aug 2022 06:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbiHLEf2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Aug 2022 00:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236387AbiHLEf1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 12 Aug 2022 00:35:27 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028F05925A
        for <linux-omap@vger.kernel.org>; Thu, 11 Aug 2022 21:35:25 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-324ec5a9e97so191730407b3.7
        for <linux-omap@vger.kernel.org>; Thu, 11 Aug 2022 21:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=m/u0OQNcK6WLQ8YRwiHl6NaU06ssTUJCYuMG15+ZS1k=;
        b=w3omfvsy9ZZIm8gFmEWlECrda6oZMt1vsZZQNNa7vA6YNhBRRfenX1dnMcRD7XxU8k
         5/I12jbJ+Kmw6PvZ2i9e4weOcxpl30w4qfWoe2AIiQAH4tqvzERwmWH93byasedP1NRH
         K0sgJRHdGRYPXyop74jnRos7N4WoFkuq+Yn9w2YjTdSzY3b5n04Q3cczBpwTGKERCrhr
         yfV2UPPyrywDcNGH7gtc9xI7cr43PftaQY8V/6M/Xh9Ab52KofQD03q3muGqrcQEnCvo
         pubG/ynkx4TMvQMHGiHyG5OvWKgbRVLGFshW5KhzePVEeCZ2EnA/dzvk29dRPwilyWzM
         KABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=m/u0OQNcK6WLQ8YRwiHl6NaU06ssTUJCYuMG15+ZS1k=;
        b=aS9451nS/9ZfPCgL5nxOOdMxlPsFsPj9zmUq1wgjYCy/bz1Gho76DB1HB7y8YgKopW
         D5xsXMXKoHbZWB/gKD42cJ94PAYSlPJ3w81MHyJNF5Y6EbPJbqfMWlf9Ft8iVZg/gUvQ
         gmxjXAEM6VdlaIUr+6PjXoBkcgwgeCTz0b6K4xGWyfK7/XiuTLR6XqGvz08O8pFBvZMl
         rbQahDIenmNAhj02nlnnjn/QWt7e8780tGpn1d7Y1PU0Efq02z//mcyvMDcSEVbtsujd
         pd+xLcNF3L7LivsBn2vQZTtKnBmt0p2UMMDInTSAJsrV3UrtemLN6f39IJ5AKV1SwH0g
         NbxQ==
X-Gm-Message-State: ACgBeo3KW1gwuWk6lydpeEZPG/YGozKq6fKlWQWQ1GgHNGdWOts7U06Y
        6FlPU4ok3TYbVn32+d4+H7D0AgAkOUGFxHZvIslqQQ==
X-Google-Smtp-Source: AA6agR5Pdd3iB2032+2rT25Yjp4RON2rJ1jN2byswnxfUC4cUX18fpGQ7WkZ/GY+xY3EQg3B/kDr1Cb0O6OMdTP0Y30=
X-Received: by 2002:a81:1ec4:0:b0:31d:e31f:1b6e with SMTP id
 e187-20020a811ec4000000b0031de31f1b6emr2294072ywe.11.1660278924132; Thu, 11
 Aug 2022 21:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <5b6d3e7f-c638-fdc7-5080-44d34abed610@ideasonboard.com> <a3ed3a2c-86ce-1c85-e8aa-c08b54ad1a43@gmail.com>
In-Reply-To: <a3ed3a2c-86ce-1c85-e8aa-c08b54ad1a43@gmail.com>
From:   Yongqin Liu <yongqin.liu@linaro.org>
Date:   Fri, 12 Aug 2022 12:35:12 +0800
Message-ID: <CAMSo37XdZSZUHLWJj373DdtOBA9=uD8SJ7ywWCYF2pU1i4cB_g@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through DMM/TILER
To:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, tomba@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        merlijn@wizzup.org, tony@atomide.com,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi, Ivaylo, Tomi

We have one X15 Android AOSP master build, it could not have the home
screen displayed
on the hdmi monitor connected with this change, with the following
message printed on the serial console
    [  607.404205] omapdrm omapdrm.0: Failed to setup plane plane-0
    [  607.410522] omapdrm omapdrm.0: Failed to setup plane plane-1
    [  607.416381] omapdrm omapdrm.0: Failed to setup plane plane-2
    [  607.422088] omapdrm omapdrm.0: Failed to setup plane plane-3

   # for details, please check the link here: http://ix.io/47m1

It will work with home screen displayed on the hdmi monitor if this
change is reverted.

Is this the broken problem you talked about here?

And could you please give some suggestions on how to have the x15
Android build work with this change?

Thanks,
Yongqin Liu
On Thu, 17 Feb 2022 at 23:29, Ivaylo Dimitrov
<ivo.g.dimitrov.75@gmail.com> wrote:
>
>
>
> On 17.02.22 =D0=B3. 14:46 =D1=87., Tomi Valkeinen wrote:
> > Hi,
> >
> > On 19/01/2022 12:23, Ivaylo Dimitrov wrote:
> >> On devices with DMM, all allocations are done through either DMM or
> >> TILER.
> >> DMM/TILER being a limited resource means that such allocations will st=
art
> >> to fail before actual free memory is exhausted. What is even worse is
> >> that
> >> with time DMM/TILER space gets fragmented to the point that even if we
> >> have
> >> enough free DMM/TILER space and free memory, allocation fails because
> >> there
> >> is no big enough free block in DMM/TILER space.
> >>
> >> Such failures can be easily observed with OMAP xorg DDX, for example -
> >> starting few GUI applications (so buffers for their windows are
> >> allocated)
> >> and then rotating landscape<->portrait while closing and opening new
> >> windows soon results in allocation failures.
> >>
> >> Fix that by mapping buffers through DMM/TILER only when really needed,
> >> like, for scanout buffers.
> >
> > Doesn't this break users that get a buffer from omapdrm and expect it t=
o
> > be contiguous?
> >
>
> If you mean dumb buffer, then no, this does not break users as dumb
> buffers are allocated as scanout:
>
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/omapdrm/om=
ap_gem.c#L603
>
> If you mean omap_bo allocated buffers, then if users want
> linear(scanout) buffer, then they request it explicitly by passing
> OMAP_BO_SCANOUT.
>
> Ivo



--=20
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
