Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6208F794005
	for <lists+linux-omap@lfdr.de>; Wed,  6 Sep 2023 17:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242003AbjIFPLW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Sep 2023 11:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbjIFPLV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Sep 2023 11:11:21 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 527921700;
        Wed,  6 Sep 2023 08:11:17 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d7d50ba994eso3235755276.1;
        Wed, 06 Sep 2023 08:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694013076; x=1694617876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGLaZ/BpYw1pfzgNoJ0OmRihvbN7TgiaQmCR6kr9Qys=;
        b=jgmWd5joUCWvPec9Q4SKdi25KDfIduCouoQBKiyjzZH+OFV6LycREmqc0NmwhHzJM6
         7Fn9PwzRmlbYIZnTV7BgNdV0hv4UyUOD8DzaZMjWFml4oHEfOZ+xVo2qxqFKtfMLuiJn
         3IysRIQymB3H+hkdmF6wuRz2hfkeang5m9XWsKF/TL3kdjzVHgSUvaeYoQwDhS7+3uOt
         3rVbOlRSC+cT9/hBg47s427H6iLlr68zzNIx8u9C7Ldl4iGWHwPOJAV3D7q86JEVzRkx
         5kh9+pToGzH6SSJ1F6Vk/LdSHP4/QS7awKTnnIGZ4oD4xngKPNvLRJ6HVKUE4ZGysLzd
         AdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694013076; x=1694617876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGLaZ/BpYw1pfzgNoJ0OmRihvbN7TgiaQmCR6kr9Qys=;
        b=WJdWA+wXVDGVRe8HNv1D07tE/ylH7wTvV4YRQLQYYC65ivNzilMNTdq9CJc4s2pBe7
         xB3SvvJ43JXbPjA1c/hU7kaawQWtWhRE0z/MGMLU9gxjC0i/i9Uawx7s5qOr5OnvGNud
         +FEYIo7NJEBpwe4BSALlL7yREurKkaemhwfzmt9aKQPPApZ6Y+sbxBaIAZxpl2Nz1L7N
         RhX3oypmy4d3nP8spyRFy17Bc29i9utP4AfxN799Xga8rJzMZBigvSx/mLzNLdp7V3w+
         aLmDHSTAinJW0zQPDWA0VDCJL+KGbgxkGAi/yhNEBkL9sd4tzLvNmvJH8LRy31Q2wCGP
         Jqnw==
X-Gm-Message-State: AOJu0Yzs5Jxl8Ai7cxA1Y9M7zKC5M7iF30oMp2LT+CJjhYLqqSGBaB0Q
        TUlG/ARCuuLmE0p81pxFJV2emzVaCfPmmPdPEk22Ax8vfmU=
X-Google-Smtp-Source: AGHT+IFM0roff/XAgsTp2ky591OvLn1odaARLWbDii/KKiM6+Uicl8eg2eZOVxONe7v3hjgAHIhoGLoDN7kNu7j7Y24=
X-Received: by 2002:a25:9290:0:b0:d7f:1bd7:c83c with SMTP id
 y16-20020a259290000000b00d7f1bd7c83cmr8944421ybl.13.1694013076355; Wed, 06
 Sep 2023 08:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xLQH8cksj8OxpvqAF_7uk_Gn-5+ROd7MfUo75EL580+iw@mail.gmail.com>
 <20230906075841.GB11676@atomide.com>
In-Reply-To: <20230906075841.GB11676@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 6 Sep 2023 10:11:04 -0500
Message-ID: <CAHCN7xLkDEBDejgrmdZ-UHVbA9umL35TT=oXUJMwKNLJFYjH2A@mail.gmail.com>
Subject: Re: AM3517 Timer busy regression on 6.1.y branch
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Sep 6, 2023 at 9:40=E2=80=AFAM Tony Lindgren <tony@atomide.com> wro=
te:
>
> Hi,
>
> * Adam Ford <aford173@gmail.com> [230905 15:02]:
> > Tony et al
> > ,
> > I am trying to run the 6.1.y branch on an AM3517-EVM.
> >
> > There are two GPT that throw an error:
> >
> >  ti-sysc: probe of 48318000.target-module failed with error -16
> >  ti-sysc: probe of 49032000.target-module failed with error -16
>
> These two timers are in use as clocksource and clockevent reserved
> by timer-ti-dm-systimer.
>
> > I did some minor investigation and found sysc_check_active_timer() is
> > returning the busy condition.
> >
> > I tracked this back a bit further and found that if I revert commit
> > a12315d6d270  ("bus: ti-sysc: Make omap3 gpt12 quirk handling SoC
> > specific"), this error condition goes away.
> >
> > It almost looks to me like sysc_check_active_timer is defaulting to
> > -EBUSY when the SoC is not 3430, but the sysc_soc_match[] doesn't
> > appear to match to AM3517.
> >
> > I think the proper solution is to treat the AM35* as 3430.  Do you
> > agree with that approach?
> >
> > If so, I'll submit a patch with a fixes tag. I am also wondering how
> > far back I should mark the fixes tag.
>
> Yes am3517 is very similar to 3430. Sounds like the patch would
> be needed also against the current kernels, right?

I submitted a patch against the mainline kernel [1] with fixes tags to
hopefully back-port them to 6.1.y.  Any feedback and/or assistance you
can help to move them forward would be appreciated.

adam

[1] - https://patchwork.kernel.org/project/linux-omap/patch/20230906093244.=
99292-1-aford173@gmail.com/

>
> Regards,
>
> Tony
