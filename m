Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C64295372E0
	for <lists+linux-omap@lfdr.de>; Mon, 30 May 2022 00:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbiE2Wzw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 29 May 2022 18:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbiE2Wzv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 29 May 2022 18:55:51 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E336076287
        for <linux-omap@vger.kernel.org>; Sun, 29 May 2022 15:55:46 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id s188so12167280oie.4
        for <linux-omap@vger.kernel.org>; Sun, 29 May 2022 15:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wPHdUUW4pZaj7kRf0FBDThpZYd5er8xTi7ykyXBFKTc=;
        b=GcxsqXUoYUvI3I+VnzCZSU+yyiV7jlIKVa+gfWIwM8XYrFkdAUH0Wcw181a0IkylKj
         etbxNt8oBoYNT3zY50Z5rZ78SReKg90g3e1hZiRA0uY53WBjPedHxswBd9pHoB4Pmrft
         8i6QdaAMFRNCqaOpteMf8vhbRZlcybOmPC/ulw422vlY5GDuZmZO6ls9UGQqb57rGrdC
         TsRzTV6gxJL87aRe7hDsztq2IFVvpcfRLSdPzhZeGjVhYdmuU5DrJAd+Q0MHSxbQ41jj
         qQTfysg49WrFiu/28NHiw6Zhmz5TtOpc4arO0ZFnNalyJsfoS3Ib539Cw/QsmOWRB3xr
         7YQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wPHdUUW4pZaj7kRf0FBDThpZYd5er8xTi7ykyXBFKTc=;
        b=WHFb/3zthgb7Py1fLyPT9zVM5HOTQZbBBAEUaQlCRuANmh0nhYGJq3dMFgJmD3b+0X
         CHI0AHSr36aAVD407k7bi2HUozp0OUVybC1QO16SkRAOcqQHR9R9aTMcpKlc1j6p1GVH
         bFazojDondl3/6uugPBVRKzaZEEz5PHayJ0A3HSG6dUUHhLGKqUZuEjcSRBn9Rwy9dCx
         aejF5WTteEY15OX/MlyreDG3OO7wIbCUUEGqraPiwlaaGwi9/jeJB2iduP049Uz5K2yl
         uy8jLIJbEad95j4hOvF04UwWyuHdS2l0mr79m4FfO9sCOsrGy1humNYIOqnIdWo9rZhX
         AzYw==
X-Gm-Message-State: AOAM532exJMxovK8QNCoLbI8rUTPRReKk26+yyT58sfRY1aD0fpmiaEf
        Yy/HhCJ0rPXU/Dicw23CI5GcUaMzs5+1dSUiQL6liobyEi90PP2NTfk=
X-Google-Smtp-Source: ABdhPJygXpmAX+3Yr0GbCwyE7nr6O+ubpKWCe5M3asW6kiknvN6cqRpn6pKgnb6/y1wA/ozxUgff9Ee/f86/mSZXNO8=
X-Received: by 2002:a05:6808:f03:b0:32b:c8d7:a98 with SMTP id
 m3-20020a0568080f0300b0032bc8d70a98mr7692183oiw.158.1653864946178; Sun, 29
 May 2022 15:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ku2O3Z7OegxKpq4SnaycvzmgFR7SO1PoZJ3h4P7OHvQYg@mail.gmail.com>
In-Reply-To: <CAGm1_ku2O3Z7OegxKpq4SnaycvzmgFR7SO1PoZJ3h4P7OHvQYg@mail.gmail.com>
From:   Drew Fustini <drew@beagleboard.org>
Date:   Mon, 30 May 2022 00:56:37 +0200
Message-ID: <CAPgEAj7wNtgf9sUrL1E14LgrPwiLv=bGcAyhdzns3ZnkH-Qqww@mail.gmail.com>
Subject: Re: am335x: GPIOs in userspace
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NEUTRAL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, May 27, 2022 at 1:01 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> I have the following problem. The latest kernel version I am using for
> my devices is 5.4.x. In my DTS I don't explicitly expose the GPIOs to
> the usespace but I can read input both via sysfs as also libgpiod API.
>
> With the newest kernel like 5.17 or 5.18, I can read the same input
> pin but I always read 0. I have also tried to add my GPIOs as
> "default" into the am33xx_pinmux section (the way it is done in [1]) but
> it didn't help.
>
> [1] https://patchwork.kernel.org/project/linux-omap/patch/20200712103717.1219765-1-drew@beagleboard.org/
>
> Regards,
> Yegor

Hello Yegor,

Which am335x board are you using?  Is it the PocketBeagle?

Have you tried reverting abe4e4675dfc ("ARM: dts: am335x-pocketbeagle:
set default mux for gpio pins") to see if the results change?

Please post the dts files you created or modified so I can better
familiarize myself with your environment.

Unfortunately, I'm currently traveling with only a BeagleBone Black,
but it might be useful for testing depending on what the issue is.

Thanks,
Drew
